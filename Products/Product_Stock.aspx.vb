Imports NAPDataSetTableAdapters
Imports NAPDataSet

Partial Class Product_Stock
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
        End If
    End Sub

    Protected Sub ObjectDataSource1_Filtering(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceFilteringEventArgs)
        If SupplierList.SelectedIndex = 0 Then
            e.ParameterValues.Clear()
            'e.ParameterValues.Add("FullName", "Nancy Davolio")
        End If
    End Sub

End Class
