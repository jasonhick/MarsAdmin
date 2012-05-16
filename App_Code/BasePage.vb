Imports Microsoft.VisualBasic

Public Class BasePage

	Inherits System.Web.UI.Page

    Public Function CheckEmptyLine(ByVal s As String) As String
        Dim retVal As String = ""
        If s > "" Then
            retVal = s & "<br>"
        End If
        Return retVal
    End Function
    Public Function CheckState(ByVal s As String) As String
        Dim retVal As String = ""
        If s > "" Then
            retVal = ", " & s & "<br>"
        Else
            retVal = s & "<br>"
        End If
        Return retVal
    End Function
    Public Function CheckCountry(ByVal s As String) As String
        Dim retVal As String = ""
        If LCase(s) <> "united kingdom" Then
            retVal = s & ", "
        End If
        Return retVal
    End Function
    Public Function CheckOptionName(ByVal s As String) As String
        Dim retVal As String = ""
        If s > "0" Then
            retVal = "&nbsp;(" & s & ")"
        End If
        Return retVal
    End Function
    Public Function CheckIsWrapepd(ByVal b As Boolean) As String
        Dim retVal As String = ""
        If b = True Then
            retVal = "&nbsp;<b>(Gift Wrapped)</b>"
        End If
        Return retVal
    End Function
    Public Function CheckIsSurprise(ByVal b As Boolean) As String
        Dim retVal As String = ""
        If b = True Then
            retVal = "block"
        Else
            retVal = "none"
        End If
        Return retVal
    End Function
    Public Function ShowShipMethod(ByVal methodID As Integer, ByVal method As String) As String
        Dim retVal As String = ""
        Select Case methodID
            Case 2, 3, 4, 5, 6, 7, 8, 11, 12
                retVal = UCase(method)
        End Select
        Return retVal
    End Function
    Public Function ShowNextDayOnLabel(ByVal m As String) As String
        Dim retVal As String = ""
        If UCase(m) = "NEXT WORKING DAY" Then
            retVal = "NEXT DAY"
        End If
        Return retVal
    End Function

    Public Function CheckIsSurpriseIcon(ByVal b As Boolean) As String
        Dim retVal As String = "/resources/images/icons/printer.png"
        If b = True Then
            retVal = "/resources/images/icons/printer_delete.png"
        End If
        Return retVal
    End Function
    Public Function CheckShipSep(ByVal b As Boolean) As String
        Dim retVal As String = ""
        If b = True Then
            retVal = "<b>(Sent Separately)</b>"
        End If
        Return retVal
    End Function
    Public Function CalculateVAT(ByVal total As Decimal) As String
        Dim vat As Decimal = total / 6 '# 20% VAT
        '# Dim vat As Decimal = total / 47 * 7 '# 17.5% VAT
        '#Dim vat As Decimal = total / 23 * 3	'# 15% VAT
        Return FormatCurrency(vat, 2)
    End Function
    Public Function CalculateNet(ByVal total As Decimal) As String
        Dim vat As Decimal = total / 6 '# 20% VAT
        '#Dim vat As Decimal = total / 47 * 7 '# 17.5% VAT
        '#Dim vat As Decimal = total / 23 * 3	'# 15% VAT
        Dim net As Decimal = total - vat
        Return FormatCurrency(net, 2)
    End Function

    Public Function DisplayVoucherRow(ByVal voucheramount As Decimal) As String
        Dim retVal As String
        If voucheramount = 0.0 Then
            retVal = ""
        Else
            retVal = "<tr><td colspan='3' class='decimal'>Discount:</td><td class='decimal'>" & FormatCurrency(voucheramount, 2) & "</td></tr>"
        End If
        Return retVal
    End Function

    Public Function CheckMessage(ByVal s As String, ByVal billfirstname As String, ByVal shipfirstname As String) As String
        Dim retVal As String
        If s > "" Then
            retVal = s & "<br>"
        Else
            If billfirstname.Trim <> shipfirstname.Trim Then
                retVal = "Hello <span style='text-transform:capitalize'>" & shipfirstname & "</span>,<br/>we hope you enjoyed receiving your gift from Needapresent.com. Why not give us a try next time you Needapresent!"
            Else
                retVal = "Hello <span style='text-transform:capitalize'>" & billfirstname & "</span>,<br/>thanks for shopping with Needapresent.<br />We hope you'll use us every time you Needapresent!"
            End If
        End If
        Return retVal
    End Function
End Class
