Imports NAPDataSetTableAdapters
Imports NAPDataSet

Partial Class Category_Product
    Inherits System.Web.UI.Page

    ' Disable the View State in the page.M
    Private Sub MyPage_Init_DisableViewState(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Init
        Me.EnableViewState = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
    End Sub

    'Protected Sub CheckBoxList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList1.SelectedIndexChanged

    '    Dim prodsxcatsAdapter As New ProductsXCategoriesTableAdapter()

    '    Dim name As String = Request.Form("__EVENTTARGET")
    '    If name.IndexOf("CheckBoxList") <> -1 Then
    '        Dim last As Integer = name.LastIndexOf("$") + 1
    '        Dim index As Integer = Convert.ToInt32(name.Substring(last, name.Length - last))
    '        If CheckBoxList1.Items(index).Selected Then
    '            Label1.Text = Request.QueryString("cid") & " / " & CheckBoxList1.Items(index).Value & " / " & CheckBoxList1.Items(index).Selected
    '            prodsxcatsAdapter.InsertProductXCategory(CheckBoxList1.Items(index).Value, Request.QueryString("cid"), False)
    '        Else
    '            Label1.Text = Request.QueryString("cid") & " / " & CheckBoxList1.Items(index).Value & " / " & CheckBoxList1.Items(index).Selected
    '            prodsxcatsAdapter.DeleteProductXCategory(CheckBoxList1.Items(index).Value, Request.QueryString("cid"))
    '        End If

    '    End If

    'End Sub

    Protected Sub ObjectDataSource2_Filtering(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceFilteringEventArgs)
        If SupplierList.SelectedIndex = 0 Then
            e.ParameterValues.Clear()
        End If
    End Sub

    'Protected Sub Repeater2_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Repeater2.ItemDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        Dim chb As CheckBox = e.Row.Cells(2).FindControl("CheckBox1")
    '        AddHandler chb.CheckedChanged, AddressOf check_changed
    '    End If
    'End Sub

    'Public Sub check_changed(ByVal sender As Object, ByVal e As EventArgs)
    '    Dim box As CheckBox = DirectCast(sender, CheckBox)
    '    Dim prodID As Integer
    '    Response.Write("ashdbkasjdbkajsbdkjasbdj")

    '    Response.Write(box.Attributes("value"))

    '    'prodID = Me.Repeater2.DataKeys.Item(CType(CType(sender, CheckBox).Parent.Parent, GridViewRow).RowIndex).Value
    '    'Dim prodsxcatsAdapter As New ProductsXCategoriesTableAdapter()
    '    'prodsxcatsAdapter.UpdateFeaturedItem(prodID, Request.QueryString("cid"), box.Checked)
    '    'Repeater2.DataBind()
    'End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim Rpt As String = "Repeater Items Checked:<br />"
        Dim i As Integer = 0
        While i < Repeater1.Items.Count
            Dim chk As CheckBox = DirectCast(Repeater1.Items(i).FindControl("ProductID"), CheckBox)
            If chk.Checked Then
                Rpt += (chk.Attributes("value") + "<br />")
            End If
            i += 1
        End While
        Literal1.Text = Rpt

        Repeater1.DataBind()
        lvwActiveProducts.DataBind()

    End Sub


    Protected Sub Item_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim target As CheckBox = TryCast(sender, CheckBox)
        If target IsNot Nothing Then
            Dim di As ListViewDataItem = TryCast(target.NamingContainer, ListViewDataItem)
            If di IsNot Nothing Then
                Dim id As Integer = CInt(lvwActiveProducts.DataKeys(di.DataItemIndex)("ProductID"))
                Dim prodsxcatsAdapter As New ProductsXCategoriesTableAdapter()
                prodsxcatsAdapter.UpdateFeaturedItem(id, Request.QueryString("cid"), target.Checked)
            End If
        End If
        lvwActiveProducts.DataBind()
    End Sub


End Class
