Imports NAPDataSetTableAdapters
Imports NAPDataSet

Partial Class Category_Add
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Select Case Request.QueryString("mode")
                Case "edit"
                    FormView1.ChangeMode(FormViewMode.Edit)
                Case "read"
                    FormView1.ChangeMode(FormViewMode.ReadOnly)
                Case Else
                    FormView1.ChangeMode(FormViewMode.Insert)
            End Select

        End If

    End Sub

    'Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
    '    For i As Integer = 0 To e.NewValues.Count - 1
    '        If e.NewValues(i) IsNot Nothing Then
    '            e.NewValues(i) = Server.HtmlDecode(e.NewValues(i).ToString())
    '        End If
    '    Next
    'End Sub

    Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As FormViewInsertedEventArgs)
        Response.Redirect("Category_List.aspx")
    End Sub

    Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As FormViewUpdatedEventArgs)
        Response.Redirect("Category_List.aspx")
    End Sub

    Protected Sub DecodeTextBox_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
        DirectCast(sender, TextBox).Text = HttpUtility.HtmlDecode(DirectCast(sender, TextBox).Text)
    End Sub

End Class
