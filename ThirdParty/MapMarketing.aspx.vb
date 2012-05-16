Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports aspNetEmail

Partial Class MMOrders
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            listView1.DataSourceID = "SqlDataSource1"
            listView1.DataBind()
        End If
    End Sub

    Protected Function GetMapFields(ByVal BasketItemID As Integer) As String

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
        Dim i = 0
        For Each item In result
            If i = 0 Then
                retVal &= Server.UrlDecode(item(3).ToString) & "</td>"
            Else
                retVal &= "<td>" & Server.UrlDecode(item(3).ToString) & "</td>"
            End If
            i = i + 1
        Next

        Dim xCol As Integer = 10 - i

        For i = 1 To xCol
            retVal &= "<td></td>"
        Next

        retVal &= vbNewLine
        myConnection.Close()
        myConnection.Dispose()

        Return retVal

    End Function
    Public Function GenWordDoc(ByVal msg As String, ByVal id As Integer) As String
        Dim retval As String
        If msg > "" Then
            ExportMsgToWord(msg, id)
            retval = "Yes"
        Else
            retval = "No"
        End If
        Return retval
    End Function
    Public Sub ExportMsgToWord(ByVal msg As String, ByVal id As String)

        Dim strBody As New System.Text.StringBuilder("")

        strBody.Append("<html " & _
                "xmlns:o='urn:schemas-microsoft-com:office:office' " & _
                "xmlns:w='urn:schemas-microsoft-com:office:word'" & _
                "xmlns='http://www.w3.org/TR/REC-html40'>" & _
                "<head><title>Time</title>")

        strBody.Append("<!--[if gte mso 9]>" & _
                                 "<xml>" & _
                                 "<w:WordDocument>" & _
                                 "<w:View>Print</w:View>" & _
                                 "<w:Zoom>90</w:Zoom>" & _
                                 "<w:DoNotOptimizeForBrowser/>" & _
                                 "</w:WordDocument>" & _
                                 "</xml>" & _
                                 "<![endif]-->")

        strBody.Append("<style>" & _
                                "<!-- /* Style Definitions */" & _
                                " table#hrdftrtbl {margin:0in 0in 0in 9in;}" & _
                                "@page Section1" & _
                                "   {size:8.5in 11.0in; " & _
                                "   margin:0.5in 0.5in 0in 0.5in ; " & _
                                "   mso-header-margin:.5in; " & _
                                "   mso-footer-margin:.5in; mso-paper-source:0;}" & _
                                " div.Section1" & _
                                "   {page:Section1;}" & _
                                "-->" & _
                               "</style></head>")

        strBody.Append("<body lang=EN-GB style='tab-interval:.5in'>" & _
                                "<div class=Section1 style='text-align:center'>" & _
                                "<p style='text-align:center'><img src='http://www.needapresent.com/lib/img/LOGO_300_dpi.png' alt='Needapresent.com Logo'></p>" & _
                                "<p style='text-align:center; margin-top:1.0in; margin-left:2.0in; margin-right:2.0in; font-size:22.0pt;line-height:150%;font-family:""Georgia"",""serif""'>" & msg & "</p>" & _
                                "<p style='text-align:center; margin-top:6in; color:#999999; font-size:11.0pt;line-height:150%;font-family:""Georgia"",""serif""'>Date created: " & Date.Now.ToString("dd/MM/yyyy") & " | Order no: " & id & "</p></div>")
        strBody.AppendLine("</body>")
        strBody.AppendLine("</html>")


        Dim fileName As String = Server.MapPath("~/ThirdParty/MapMarketing/" & id & ".doc")
        Dim w As System.IO.TextWriter = New System.IO.StreamWriter(fileName, False, Encoding.Default)
        w.Write(strBody.ToString())
        w.Flush()
        w.Close()

    End Sub

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
        listView1.DataSourceID = "SqlDataSource1"
        listView1.DataBind()

        Dim path As String
        path = Server.MapPath("~/ThirdParty/MapMarketing/NAPMM-" & Date.Now.ToString("yyyyMMdd-HHmmtt") & ".xls")
        GridViewExportUtil2.ExportLvToExcel(listView1, path)
        EmailExcelFile(path)
        'listView1.DataBind()

    End Sub

    Sub EmailExcelFile(ByVal excelFilePath As String)

        Dim msg As New EmailMessage("secure.emailsrvr.com") '# TEST
        msg.Username = "jason@needapresent.com"
        msg.Password = "R@lph4425"

        '## CREATE INSTANCE OF CONNECTION & COMMAND OBJECTS
        Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)
        Dim myCommand As SqlCommand = New SqlCommand("adm_ThirdPartyOrders_s", myConnection)
        myCommand.CommandType = CommandType.StoredProcedure
        myCommand.Parameters.Add(New SqlParameter("@Status", SqlDbType.VarChar))
        myCommand.Parameters("@Status").Value = "Waiting to be Picked"
        myCommand.Parameters.Add(New SqlParameter("@SupplierID", SqlDbType.Int))
        myCommand.Parameters("@SupplierID").Value = 122
        myConnection.Open()

        Dim objDataReader As SqlDataReader
        objDataReader = myCommand.ExecuteReader()

        '# LOOP ROUND THE DATA TO SEE IF A MESSAGE FILE EXISTS & ATTACH IT TO THE EMAIL
        Dim curFile As String
        If objDataReader.HasRows Then
            Do While objDataReader.Read()
                curFile = Server.MapPath("~/ThirdParty/MapMarketing/" & objDataReader(0).ToString & ".doc")
                If (File.Exists(curFile)) Then
                    msg.AddAttachment(curFile)
                End If
            Loop
        End If

        myConnection.Close()
        myCommand.Dispose()


        '# SETUP AND SEND THE EMAIL
        '#Dim msg As New EmailMessage("192.168.1.41") '# LIVE
        Dim msgBody As New StringBuilder()
        msgBody.AppendLine("Send to:<br>carole@mapmarketing.com<br><b>PLEASE NOTE:<br>This email has been automatically generated.<br>Contact us immediately if you have any problems reading it.</b>")
        msgBody.AppendLine("<p>Hi Carol,<p>Please find attached todays orders dated " & Date.Now.ToString("dd/MMM/yyyy - HH:mm") & ".<p>Kind Regards,<br>Customer Services<br>Needapresent.com Ltd<p>w: www.needapresent.com<br>t: 020 3239 1996<br>e: help@needapresent.com")
        msgBody.AppendLine("<p>DISCLAIMER:<br>The contents of this e-mail are confidential to the intended recipient. If you are not the intended recipient and have received it in error, do not forward or copy it, simply delete it from your inbox and notify us immediatley. Please scan this message and any attachments for the presence of any viruses, as we cannot accept responsibility for damage caused.")

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
        msg.HtmlBodyPart = msgBody.ToString
        msg.Subject = "New MM Orders - " & Date.Now.ToString("dd/MM/yyyy HH:mm tt")

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
        listView1.DataBind()
    End Sub
    Sub Code10(ByVal Sender As Object, ByVal E As EventArgs)
        Dim arrOrders As Array
        Dim myOrders As New Orders()
        arrOrders = Split(Request("myOrders"), ",")
        Dim myEnum As System.Collections.IEnumerator = arrOrders.GetEnumerator()
        While myEnum.MoveNext()
            myOrders.UpdateOrderStatus(myEnum.Current, "Code 10", "N", "N")
        End While
        listView1.DataBind()
    End Sub
    Protected Sub StatusDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles StatusDropDownList.SelectedIndexChanged
        listView1.DataSourceID = "SqlDataSource1"
        listView1.DataBind()
    End Sub

    Protected Function CheckSKU(ByVal mainSKU As String, ByVal optionSKU As String) As String
        Dim retVal As String
        If mainSKU = "" Then
            retVal = optionSKU
        Else
            retVal = mainSKU
        End If
        Return retVal
    End Function

End Class
