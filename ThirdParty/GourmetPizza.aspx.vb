Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports aspNetEmail

Partial Class GourmetPizza
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            GridView1.DataSourceID = "SqlDataSource1"
            GridView1.DataBind()
        End If
    End Sub
    Protected Function GetItemFields(ByVal BasketItemID As Integer) As String

        Dim retVal As String = ""

        Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)
        Dim myCommand As SqlCommand = New SqlCommand("FieldValues_s", myConnection)
        myCommand.CommandType = CommandType.StoredProcedure
        myCommand.Parameters.Add(New SqlParameter("@BasketItemID", SqlDbType.Int))
        myCommand.Parameters("@BasketItemID").Value = BasketItemID
        myConnection.Open()

        Dim result As SqlDataReader = myCommand.ExecuteReader()
        For Each item In result
            retVal &= item(4).ToString & ": " & Server.UrlDecode(item(3).ToString) & "<br>"
        Next

        retVal &= vbNewLine

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
    Protected Sub BtnExportGrid_Click(ByVal sender As Object, ByVal args As EventArgs)

        '# rebind grid manually otherwise the checkbox file is repopulated.
        GridView1.DataSourceID = "SqlDataSource1"
        GridView1.Columns.RemoveAt(0)
        GridView1.DataBind()
        Dim path As String
        path = Server.MapPath("~/ThirdParty/GourmetPizza/GP-" & Date.Now.ToString("yyyyMMdd-HHmmtt") & ".xls")
        GridViewExportUtil2.ExportToFolder(path, Me.GridView1)
        EmailExcelFile(path)
        GridView1.DataBind()

    End Sub
    Sub EmailExcelFile(ByVal excelFilePath As String)

        Dim msgBody As New StringBuilder()
        msgBody.AppendLine("Sent to:<br>sales@gourmetchocolatepizza.co.uk<br><b>PLEASE NOTE:<br>This email has been automatically generated.<br>Contact us immediately on 020 3239 1996 if you have any problems reading it.</b>")
        msgBody.AppendLine("<p>Hello,<p>Please find attached todays orders dated " & Date.Now.ToString("dd/MMM/yyyy - HH:mm") & ".<p>Kind Regards,<br>Customer Services<br>Needapresent.com Ltd<p>w: www.needapresent.com<br>e: help@needapresent.com")
        msgBody.AppendLine("<p>DISCLAIMER:<br>The contents of this e-mail are confidential to the intended recipient. If you are not the intended recipient and have received it in error, do not forward or copy it, simply delete it from your inbox and notify us immediatley. Please scan this message and any attachments for the presence of any viruses, as we cannot accept responsibility for damage caused.")

        '# SETUP AND SEND THE EMAIL
        '#Dim msg As New EmailMessage("192.168.1.41") '# LIVE

        Dim msg As New EmailMessage("secure.emailsrvr.com") '# TEST
        msg.Username = "jason@needapresent.com"
        msg.Password = "R@lph4425"

        msg.Logging = True
        msg.LogOverwrite = False
        msg.LogBody = False
        msg.LogPath = "C:\Users\Public\aspNetEmail.log"
        msg.ValidateAddress = False
        msg.ContentTransferEncoding = MailEncoding.QuotedPrintable
        msg.CharSet = "ISO-8859-1"
        msg.FromAddress = "help@needapresent.com"
        msg.FromName = "Needapresent"
        msg.To = "help@needapresent.com"
        'msg.ConfirmRead = True
        'msg.ReturnReceipt = True
        msg.AddAttachment(excelFilePath)

        msg.Subject = "New GP Orders - " & Date.Now.ToString("dd/MM/yyyy HH:mm tt")
        msg.HtmlBodyPart = msgBody.ToString
        msg.Send()
        msgBody.Clear()

    End Sub


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
    Sub Code10(ByVal Sender As Object, ByVal E As EventArgs)
        Dim arrOrders As Array
        Dim myOrders As New Orders()
        arrOrders = Split(Request("myOrders"), ",")
        Dim myEnum As System.Collections.IEnumerator = arrOrders.GetEnumerator()
        While myEnum.MoveNext()
            myOrders.UpdateOrderStatus(myEnum.Current, "Code 10", "N", "N")
        End While
        GridView1.DataBind()
    End Sub


    Protected Sub StatusDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles StatusDropDownList.SelectedIndexChanged
        GridView1.DataSourceID = "SqlDataSource1"
        GridView1.DataBind()
    End Sub




End Class
