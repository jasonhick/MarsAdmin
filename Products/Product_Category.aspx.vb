Imports NAPDataSetTableAdapters
Imports NAPDataSet

Partial Class Product_Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim categoriesAdapter As New CategoriesTableAdapter
            CheckBoxList1.DataSource = categoriesAdapter.GetCategories()
            CheckBoxList1.DataBind()

            Dim prodsxcatsAdapter As New ProductsXCategoriesTableAdapter()
            Dim prodsxcats As ProductsXCategoriesDataTable
            prodsxcats = prodsxcatsAdapter.GetCategoriesByProduct(Request.QueryString("pid"))

            For Each row As ProductsXCategoriesRow In prodsxcats
                Dim myitem As New ListItem()
                myitem = CheckBoxList1.Items.FindByValue(row.CategoryID)
                myitem.Selected = True
                litProductName.Text = row.ProductName
            Next
        End If
    End Sub

    Protected Sub CheckBoxList1_SelectedIndexChanged(ByVal sender As Object, _
                    ByVal e As System.EventArgs) _
                    Handles CheckBoxList1.SelectedIndexChanged

        Dim prodsxcatsAdapter As New ProductsXCategoriesTableAdapter()

        Dim name As String = Request.Form("__EVENTTARGET")
        If name.IndexOf("CheckBoxList") <> -1 Then
            Dim last As Integer = name.LastIndexOf("$") + 1
            Dim index As Integer = Convert.ToInt32(name.Substring(last, name.Length - last))

            If CheckBoxList1.Items(index).Selected Then
                Label1.Text = Request.QueryString("pid") & " / " & CheckBoxList1.Items(index).Value & " / " & CheckBoxList1.Items(index).Selected
                prodsxcatsAdapter.InsertProductXCategory(Request.QueryString("pid"), CheckBoxList1.Items(index).Value, False)
                'get name .Text and .Value with index
            Else
                Label1.Text = Request.QueryString("pid") & " / " & CheckBoxList1.Items(index).Value & " / " & CheckBoxList1.Items(index).Selected
                prodsxcatsAdapter.DeleteProductXCategory(Request.QueryString("pid"), CheckBoxList1.Items(index).Value)
            End If

        End If

    End Sub

End Class
