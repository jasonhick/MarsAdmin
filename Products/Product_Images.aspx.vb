Imports NAPDataSetTableAdapters
Imports NAPDataSet

Partial Class Product_Images
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSource1.InsertParameters("ProductID").DefaultValue = Request.QueryString("pid")
    End Sub



End Class
