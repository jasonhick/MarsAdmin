Imports System.Data
Imports System.Data.SqlClient

Partial Class Orders_Receipt
    Inherits BasePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '## Create Instance of Connection and Command Object
        Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)
        Dim myCommand As SqlCommand = New SqlCommand("adm_GetMultipleOrderDetail", myConnection)

        '## Mark the Command as a SPROC
        myCommand.CommandType = CommandType.StoredProcedure
        myCommand.Parameters.Add(New SqlParameter("@OrderID", SqlDbType.NVarChar))
        myCommand.Parameters("@OrderID").Value = Request.QueryString("oid").ToString

        '## Execute the command
        myConnection.Open()

        '#Dim result As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim result As SqlDataReader = myCommand.ExecuteReader()
        lvwOrders.DataSource = result
        lvwOrders.DataBind()

        myConnection.Close()
        myConnection.Dispose()

    End Sub


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
            retVal &= "<br><b>" & item(4).ToString & ":</b> " & Server.UrlDecode(item(3).ToString)
        Next

        myConnection.Close()
        myConnection.Dispose()

        Return retVal

    End Function

    '# FOR EACH ITEM DATABOUND:
    Protected Sub lvwOrders_ItemDataBound(ByVal sender As Object, ByVal e As ListViewItemEventArgs) Handles lvwOrders.ItemDataBound

        If e.Item.ItemType = ListViewItemType.DataItem Then
            Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)

            '# BIND THE NESTED LISTVIEW FOR PERSONALISED ITEMS
            Dim objItems As SqlDataSource = DirectCast(e.Item.FindControl("objItems"), SqlDataSource)
            Dim currentItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
            Dim currentDataKey As System.Web.UI.WebControls.DataKey = Me.lvwOrders.DataKeys(currentItem.DataItemIndex)
            Dim parameter As Parameter = objItems.SelectParameters(0)
            parameter.DefaultValue = currentDataKey.Value

        End If

    End Sub


End Class
