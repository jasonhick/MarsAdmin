Imports NAPDataSetTableAdapters
Imports NAPDataSet

Partial Class Product_POZones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            Dim zonesAdapter As New ProductsXPozoneTableAdapter()
            Dim zones As ProductsXPozoneDataTable
            zones = zonesAdapter.GetZonesByProductID(Request.QueryString("pid"))

            For Each row As ProductsXPozoneRow In zones
                Dim myitem As New ListItem()
                myitem = CheckBoxList1.Items.FindByValue(row.POZone.ToUpper)
                myitem.Selected = True
                litProductName.Text = row.Name
            Next
        End If
    End Sub

    Protected Sub CheckBoxList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList1.SelectedIndexChanged

        Dim zonesAdapter As New ProductsXPozoneTableAdapter()

        Dim name As String = Request.Form("__EVENTTARGET")
        If name.IndexOf("CheckBoxList") <> -1 Then
            Dim last As Integer = name.LastIndexOf("$") + 1
            Dim index As Integer = Convert.ToInt32(name.Substring(last, name.Length - last))

            If CheckBoxList1.Items(index).Selected Then
                zonesAdapter.InsertProductXZone(Request.QueryString("pid"), CheckBoxList1.Items(index).Value)
                Literal1.Text &= "<div class='notification success png_bg'><a href='#' class=""close""><img src='/resources/images/icons/cross_grey_small.png' alt='close' /></a><div>Product added to zone: " & CheckBoxList1.Items(index).Value & " </div></div>"
            Else
                zonesAdapter.DeleteProductXZone(Request.QueryString("pid"), CheckBoxList1.Items(index).Value)
                Literal1.Text &= "<div class='notification success png_bg'><a href='#' class=""close""><img src='/resources/images/icons/cross_grey_small.png' alt='close' /></a><div>Product removed from zone: " & CheckBoxList1.Items(index).Value & " </div></div>"
            End If

        End If

    End Sub

End Class
