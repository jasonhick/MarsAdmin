Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports aspNetEmail

Public Class Orders

	Public Function UpdateOrderStatus(ByVal OrderID As Integer, ByVal Status As String, ByVal isprint As String, ByVal isship As String) As Object

		'## CREATE CONNECTION AND COMMAND OBJECTS
		Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)
		Dim myCommand As SqlCommand = New SqlCommand("adm_OrderStatus_u", myConnection)

		'## MARK COMMAND AS AN SP
		myCommand.CommandType = CommandType.StoredProcedure
		myCommand.Parameters.Add(New SqlParameter("@OrderID", SqlDbType.Int))
		myCommand.Parameters.Add(New SqlParameter("@Status", SqlDbType.VarChar))
		myCommand.Parameters.Add(New SqlParameter("@IsPrint", SqlDbType.VarChar))
		myCommand.Parameters.Add(New SqlParameter("@IsShip", SqlDbType.VarChar))
		myCommand.Parameters("@OrderID").Value = OrderID
		myCommand.Parameters("@Status").Value = Status
		myCommand.Parameters("@IsPrint").Value = isprint
		myCommand.Parameters("@IsShip").Value = isship

		'## OPEN CONNECTION, EXECUTE QUERY, CLOSE CONNECTION
		myConnection.Open()
		myCommand.ExecuteNonQuery()
		myConnection.Close()

	End Function


    Public Function GetBasketItems(ByVal orderID As Integer) As String

        Dim retVal As String = ""

        '## CREATE INSTANCE OF CONNECTION & COMMAND OBJECTS
        Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)

        '## MARK COMMAND AS AN SP AND ADD PARAMETERS
        Dim myCommand As SqlCommand = New SqlCommand("BasketItemsForDespatch_s", myConnection)
        myCommand.CommandType = CommandType.StoredProcedure
        myCommand.Parameters.Add(New SqlParameter("@BasketID", SqlDbType.Int))
        myCommand.Parameters("@BasketID").Value = orderID

        '## EXECUTE THE COMMAND BasketItems_s 291998460    

        myConnection.Open()
        Dim objDataReader As SqlDataReader
        objDataReader = myCommand.ExecuteReader()

        '0: ID
        '1: BasketID
        '2: ProductID
        '3: SKU
        '5: OptionID
        '12: IsWrappable
        '14: ImageFileName

        '4: Name
        '6: OptionName
        '7: Qty
        '8: Price
        '9: IsWrapped
        '10: IsPersonalised
        '11: IsExpress
        '13: LineTotal
        '15: ShipSeparately
        '16: DeliveryTimeInDays

        If objDataReader.HasRows Then
            Do While objDataReader.Read()

                retVal += objDataReader.GetString(4)

                '# Gift wrapped?
                If objDataReader.GetBoolean(9) = True Then
                    retVal += " (wrapped)" & vbNewLine
                Else
                    retVal += vbNewLine
                End If

                '# Option selected
                If Not objDataReader.GetString(6) = "0" Then
                    retVal += "Option: " & objDataReader.GetString(6) & vbNewLine
                End If

                '# Qty
                retVal += "Qty: " & objDataReader.GetInt16(7) & vbNewLine

                '# Delivery status
                Select Case objDataReader.GetBoolean(15)
                    Case True
                        retVal += "STATUS: Processed" & vbNewLine
                        retVal += " - This item is shipped direct from the manufacturer." & vbNewLine
                        retVal += " - It has been passed onto the production company to be made up." & vbNewLine
                        retVal += " - You will not receive a despatch confirmation for this item." & vbNewLine
                    Case False

                        '# TODO: stocked item delivery method detection. next day???
                        retVal += "STATUS: Despatched by " & objDataReader.GetString(21) & " " & objDataReader.GetString(20) & vbNewLine

                        If objDataReader.GetBoolean(23) = True Then
                            retVal += "Delivery in: 1 working day" & vbNewLine
                        Else
                            retVal += "Delivery in: " & objDataReader.GetString(16) & vbNewLine
                        End If

                End Select

                retVal += "------------------------------------------------------------" & vbNewLine

            Loop
        Else
            retVal += "No items found"
        End If

        Return retVal

        myConnection.Close()
        myCommand.Dispose()

    End Function


	Sub SendDespatchEmail(ByVal orderID As Integer)

        Dim strBody As String = ""

		'## CREATE INSTANCE OF CONNECTION & COMMAND OBJECTS
		Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)

        '## MARK COMMAND AS AN SP AND ADD PARAMETERS
        Dim myCommand As SqlCommand = New SqlCommand("adm_CustomerEmailByOrderID_s", myConnection)
        myCommand.CommandType = CommandType.StoredProcedure
        myCommand.Parameters.Add(New SqlParameter("@OrderID", SqlDbType.Int))
        myCommand.Parameters("@OrderID").Value = orderID

		'## EXECUTE THE COMMAND
		myConnection.Open()
        Dim objDataReader As SqlDataReader
        objDataReader = myCommand.ExecuteReader()
        objDataReader.Read()

        '# CREATE INSTANCE OF CONNECTION & COMMAND OBJECTS

        strBody += "Hi " & objDataReader(1) & "," & vbNewLine & vbNewLine

        strBody += "Just a quick update about your order. It has now been processed" & vbNewLine
        strBody += "and will be with you soon. Details of each item you ordered, and" & vbNewLine
        strBody += "how long they should take to arrive are listed below." & vbNewLine & vbNewLine

        strBody += "------------------------------------------------------------" & vbNewLine
        strBody += GetBasketItems(orderID) & vbNewLine

        strBody += "If you have any queries, please remember to include your order" & vbNewLine
        strBody += "number in all correspondence. You can email: help@needapresent.com." & vbNewLine
        strBody += "Click below for more detailed delivery information:" & vbNewLine
        strBody += "http://www.needapresent.com/help/delivery-info.aspx" & vbNewLine & vbNewLine
        strBody += "------------------------------------------------------------" & vbNewLine
        strBody += "                     Needapresent.com                       " & vbNewLine
        strBody += "      The Leathermarket, Weston Street, London SE1 3ER      " & vbNewLine
        strBody += "       Tel:020 3239 1996   Email:help@needapresent.com      " & vbNewLine
        strBody += "             VAT No: 802733748   Reg: 4928138               " & vbNewLine
        strBody += "------------------------------------------------------------" & vbNewLine


        '# SETUP AND SEND THE EMAIL
        '#Dim msg As New EmailMessage("192.168.1.41") '# LIVE EMAIL SERVER
        '#Dim msg As New EmailMessage("192.168.0.65")	'# LOCAL TEST SERVER
        Dim msg As New EmailMessage("72.4.117.23")    '# TEST SERVER LOG ONTO RACKSPACE
        msg.Username = "help@needapresent.com"
        msg.Password = "leather12b1"

        msg.Logging = True
        msg.LogOverwrite = False
        msg.LogBody = False
        msg.LogPath = "C:\home\logs\aspNetEmail.log"
        msg.ValidateAddress = False
        msg.ContentTransferEncoding = MailEncoding.QuotedPrintable
        msg.CharSet = "ISO-8859-1"
        msg.FromAddress = "help@needapresent.com"
        msg.FromName = "Needapresent.com"

        msg.AddTo("jason@needapresent.com")
        msg.AddBcc("help@needapresent.com;jasonhick@me.com")
        '#msg.Bcc = "c7cb8cd3@trustpilotservice.com;jason@needapresent.com"
        '#msg.AddTo(objDataReader("Email"), objDataReader("NameFirst") & " " & objDataReader("NameLast"))

        msg.Subject = "Order no: " & orderID & ". Order update from Needapresent.com"
        msg.TextBodyPart = strBody
        '#msg.SaveToFile("C:\home\logs\emailText.log")
        Try
            msg.Send()
        Catch ex As Exception
        End Try

        objDataReader.Close()

    End Sub


End Class
