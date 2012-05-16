Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports aspNetEmail
Imports NAPDataSetTableAdapters
Imports NAPDataSet

Partial Class InThePaper
    Inherits BasePage

    Protected Function GetItemFields(ByVal BasketItemID As Integer) As String

        Dim retVal As String = ""

        '## Create Instance of Connection and Command Object
        Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)
        Dim myCommand As SqlCommand = New SqlCommand("FieldValues_s", myConnection)

        '## Mark the Command as a SPROC
        myCommand.CommandType = CommandType.StoredProcedure
        myCommand.Parameters.Add(New SqlParameter("@BasketItemID", SqlDbType.Int))
        myCommand.Parameters("@BasketItemID").Value = BasketItemID

        '## Execute the command
        myConnection.Open()

        '#Dim result As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim result As SqlDataReader = myCommand.ExecuteReader()

        For Each item In result
            retVal &= "<b>" & item(4).ToString & ":</b> " & Server.UrlDecode(item(3).ToString) & "<br>"
        Next

        myConnection.Close()
        myConnection.Dispose()

        Return retVal

    End Function
    Protected Function CheckEmptyString(ByVal s As String) As String
        Dim retVal As String = ""
        Select Case s
            Case "0"
                retVal = ""
            Case Else
                retVal = " (" & s & ")"
        End Select
        Return Server.HtmlDecode(retVal)
    End Function

    Sub ProcessOrders(ByVal Sender As Object, ByVal E As EventArgs)
        Dim arrOrders As Array
        Dim myOrders As New Orders()
        arrOrders = Split(Request("myOrders"), ",")
        Dim myEnum As System.Collections.IEnumerator = arrOrders.GetEnumerator()
        While myEnum.MoveNext()
            myOrders.UpdateOrderStatus(myEnum.Current, "Waiting to be despatched", "N", "N")
        End While
        GridView1.DataBind()
    End Sub


    Protected Sub btnEmailOrders_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmailOrders.Click

        '# StringBuilder object
        Dim str As New StringBuilder()
        For i As Integer = 0 To GridView1.Rows.Count - 1
            Dim row As GridViewRow = GridView1.Rows(i)
            Dim chkBox As HtmlInputCheckBox = DirectCast(row.FindControl("chkSelect"), HtmlInputCheckBox)
            If chkBox.Checked = True Then
                str.Append(chkBox.Value & ",")
            End If
        Next

        Dim str2 As String = str.ToString
        str2 = str2.Substring(0, str2.Length - 1)

        Dim orderAdapter As New ThirdPartyOrdersTableAdapter()
        Dim orders As ThirdPartyOrdersDataTable

        Response.Write(str2)

        orders = orderAdapter.GetSelectedOrders(StatusDropDownList.SelectedValue, 132, str2)

        Dim msgFooter As New StringBuilder()
        Dim msgBody As New StringBuilder()
        msgFooter.AppendLine("<br><br><p>Kind Regards,<br>Customer Services<br>Needapresent.com Ltd<p>w: www.needapresent.com<br>t: 020 3239 1996<br>e: help@needapresent.com")
        msgFooter.AppendLine("<p>DISCLAIMER:<br>The contents of this e-mail are confidential to the intended recipient. If you are not the intended recipient and have received it in error, do not forward or copy it, simply delete it from your inbox and notify us immediatley. Please scan this message and any attachments for the presence of any viruses, as we cannot accept responsibility for damage caused.")

        '# SETUP AND SEND THE EMAIL
        Dim msg As New EmailMessage("192.168.1.41") '# LIVE
        '#Dim msg As New EmailMessage("192.168.0.65") '# TEST
        msg.Logging = True
        msg.LogOverwrite = False
        msg.LogBody = False
        msg.LogPath = "C:\Users\Public\aspNetEmail.log"
        msg.ValidateAddress = False
        msg.ContentTransferEncoding = MailEncoding.QuotedPrintable
        msg.CharSet = "ISO-8859-1"
        msg.FromAddress = "help@needapresent.com"
        msg.FromName = "Needapresent.com"
        msg.To = "sales@inthepaper.co.uk"
        msg.Cc = "help@needapresent.com"
        msg.ConfirmRead = True

        For Each row As ThirdPartyOrdersRow In orders
            msgBody.AppendLine("PLEASE NOTE: This email has been automatically generated. Please contact us if you have any problems reading it. ")
            msgBody.AppendLine("<h3 style='margin-bottom:5px'>ORDER NO: " & row.OrderID & "</h3>")
            msgBody.AppendLine("<h3 style='margin-bottom:5px'>ORDER DETAILS:</h3>")
            msgBody.AppendLine(row.Qty & " x " & row.ProductName & CheckEmptyString(row.OptionName) & "<br>")
            msgBody.AppendLine(GetItemFields(row.BasketItemID))
            msgBody.AppendLine("<h3 style='margin-bottom:5px'>DELIVERY METHOD: " & row.ShipMethod & "</h3>")
            msgBody.AppendLine("<h3 style='margin-bottom:5px'>DELIVERY ADDRESS:</h3>")
            msgBody.AppendLine(row.ShipTitle & " " & row.ShipNameFirst & " " & row.ShipNameLast & "<br>")
            msgBody.AppendLine(CheckEmptyLine(row.Company))
            msgBody.AppendLine(CheckEmptyLine(row.StreetLine1))
            msgBody.AppendLine(CheckEmptyLine(row.StreetLine2))
            msgBody.AppendLine(CheckEmptyLine(row.StreetLine3))
            msgBody.AppendLine(CheckEmptyLine(row.City))
            msgBody.AppendLine(CheckEmptyLine(row.StateProv))
            msgBody.AppendLine(CheckEmptyLine(row.CountryName))
            msgBody.AppendLine(CheckEmptyLine(row.PostCode))
            msgBody.AppendLine("<h3 style='margin-bottom:5px'>GIFT MESSAGE: " & row.Message & "</h3>")
            msg.Subject = "New NAP Order: " & row.OrderID & " : " & row.ProductName
            msg.HtmlBodyPart = msgBody.ToString & msgFooter.ToString
            msg.Send()
            msgBody.Clear()
        Next

    End Sub

End Class
