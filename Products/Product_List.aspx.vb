
Partial Class Product_List
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
        End If
    End Sub

    Protected Sub SupplierList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles SupplierList.SelectedIndexChanged
        If SupplierList.SelectedIndex = 0 Then
            GridView1.DataSourceID = "LinqDataSource2"
        Else
            GridView1.DataSourceID = "LinqDataSource1"
        End If
        GridView1.DataBind()
    End Sub
End Class
