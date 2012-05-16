Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports aspNetEmail

Partial Class Intervino
    Inherits System.Web.UI.Page


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
            retVal &= item(4).ToString & ": " & Server.UrlDecode(item(3).ToString) & "<br>"
        Next

        retVal &= vbNewLine

        myConnection.Close()
        myConnection.Dispose()

        Return retVal

    End Function
    Protected Function GetFields(ByVal ProductID As Integer, ByVal BasketItemID As Integer) As String

        Dim retVal As String = ""

        '## Create Instance of Connection and Command Object
        Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)
        Dim myCommand As SqlCommand = New SqlCommand("adm_FieldsAll_s", myConnection)

        '## Mark the Command as a SPROC
        myCommand.CommandType = CommandType.StoredProcedure
        myCommand.Parameters.Add(New SqlParameter("@ProductID", SqlDbType.Int))
        myCommand.Parameters("@ProductID").Value = ProductID

        '## Execute the command
        myConnection.Open()

        '#Dim result As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim result As SqlDataReader = myCommand.ExecuteReader()

        For Each item In result
            retVal &= GetFieldValue(BasketItemID, item(0).ToString) & "|"
        Next

        myConnection.Close()
        myConnection.Dispose()

        Return retVal

    End Function
    Protected Function GetFieldValue(ByVal BasketItemID As Integer, ByVal FieldID As Integer) As String

        Dim retVal As String

        '## Create Instance of Connection and Command Object
        Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)
        Dim myCommand As SqlCommand = New SqlCommand("adm_FieldValues_s", myConnection)

        '## Mark the Command as a SPROC
        myCommand.CommandType = CommandType.StoredProcedure
        myCommand.Parameters.Add(New SqlParameter("@BasketItemID", SqlDbType.Int))
        myCommand.Parameters.Add(New SqlParameter("@FieldID", SqlDbType.Int))

        myCommand.Parameters("@BasketItemID").Value = BasketItemID
        myCommand.Parameters("@FieldID").Value = FieldID

        '## Execute the command
        myConnection.Open()

        '#Dim result As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim result As SqlDataReader = myCommand.ExecuteReader()

        For Each item In result
            retVal = Server.UrlDecode(item(0).ToString)
        Next

        myConnection.Close()
        myConnection.Dispose()

        Return retVal

    End Function
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

        For Each item In result
            retVal &= Server.UrlDecode(item(3).ToString) & "</td><td>"
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
        '  pass the grid that for exporting ...
        GridViewExportUtil.ExportCSV("ThirdPartyOrders.xls", Me.GridView1)
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



End Class
