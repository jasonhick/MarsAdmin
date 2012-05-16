Imports NAPDataSetTableAdapters
Imports NAPDataSet

Partial Class POZones_Product
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            Dim productAdapter As New ProductsTableAdapter
            CheckBoxListUK.DataSource = productAdapter.GetActiveProductIDs()
            CheckBoxListEU.DataSource = productAdapter.GetActiveProductIDs()
            CheckBoxListZ1.DataSource = productAdapter.GetActiveProductIDs()
            CheckBoxListZ2.DataSource = productAdapter.GetActiveProductIDs()
            CheckBoxListUK.DataBind()
            CheckBoxListEU.DataBind()
            CheckBoxListZ1.DataBind()
            CheckBoxListZ2.DataBind()

            Dim zonesAdapter As New ProductsXPozoneTableAdapter()
            Dim zones As ProductsXPozoneDataTable

            zones = zonesAdapter.GetProductsByZone("UK")
            For Each row As ProductsXPozoneRow In zones
                Dim myitem As New ListItem()
                myitem = CheckBoxListUK.Items.FindByValue(row.ProductID)
                myitem.Selected = True
            Next

            zones = zonesAdapter.GetProductsByZone("EU")
            For Each row As ProductsXPozoneRow In zones
                Dim myitem As New ListItem()
                myitem = CheckBoxListEU.Items.FindByValue(row.ProductID)
                myitem.Selected = True
            Next

            zones = zonesAdapter.GetProductsByZone("Z1")
            For Each row As ProductsXPozoneRow In zones
                Dim myitem As New ListItem()
                myitem = CheckBoxListZ1.Items.FindByValue(row.ProductID)
                myitem.Selected = True
            Next

            zones = zonesAdapter.GetProductsByZone("Z2")
            For Each row As ProductsXPozoneRow In zones
                Dim myitem As New ListItem()
                myitem = CheckBoxListZ2.Items.FindByValue(row.ProductID)
                myitem.Selected = True
            Next

        End If
    End Sub

    Protected Sub CheckBoxListUK_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListUK.SelectedIndexChanged
        Dim zonesAdapter As New ProductsXPozoneTableAdapter()
        Dim name As String = Request.Form("__EVENTTARGET")
        If name.IndexOf("CheckBoxList") <> -1 Then
            Dim last As Integer = name.LastIndexOf("$") + 1
            Dim index As Integer = Convert.ToInt32(name.Substring(last, name.Length - last))
            If CheckBoxListUK.Items(index).Selected Then
                zonesAdapter.InsertProductXZone(CheckBoxListUK.Items(index).Value, "UK")
                Literal1.Text &= "<div class='notification success png_bg'><a href='#' class=""close""><img src='/resources/images/icons/cross_grey_small.png' alt='close' /></a><div>" & CheckBoxListUK.Items(index).Text & " added to UK zone.</div></div>"
            Else
                zonesAdapter.DeleteProductXZone(CheckBoxListUK.Items(index).Value, "UK")
                Literal1.Text &= "<div class='notification success png_bg'><a href='#' class=""close""><img src='/resources/images/icons/cross_grey_small.png' alt='close' /></a><div>" & CheckBoxListUK.Items(index).Text & " removed from UK zone.</div></div>"
            End If
        End If
    End Sub

    Protected Sub CheckBoxListEU_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListEU.SelectedIndexChanged
        Dim zonesAdapter As New ProductsXPozoneTableAdapter()
        Dim name As String = Request.Form("__EVENTTARGET")
        If name.IndexOf("CheckBoxList") <> -1 Then
            Dim last As Integer = name.LastIndexOf("$") + 1
            Dim index As Integer = Convert.ToInt32(name.Substring(last, name.Length - last))
            If CheckBoxListEU.Items(index).Selected Then
                zonesAdapter.InsertProductXZone(CheckBoxListEU.Items(index).Value, "EU")
                Literal1.Text &= "<div class='notification success png_bg'><a href='#' class=""close""><img src='/resources/images/icons/cross_grey_small.png' alt='close' /></a><div>" & CheckBoxListEU.Items(index).Text & " added to EU zone.</div></div>"
            Else
                zonesAdapter.DeleteProductXZone(CheckBoxListEU.Items(index).Value, "EU")
                Literal1.Text &= "<div class='notification success png_bg'><a href='#' class=""close""><img src='/resources/images/icons/cross_grey_small.png' alt='close' /></a><div>" & CheckBoxListEU.Items(index).Text & " removed from EU zone.</div></div>"
            End If
        End If
    End Sub

End Class
