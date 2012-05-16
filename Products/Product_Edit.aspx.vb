
Partial Class Product_Edit
    Inherits System.Web.UI.Page


    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        'If FormView1.CurrentMode = FormViewMode.[ReadOnly] Then
        'If FormView1.CurrentMode = FormViewMode.Edit Then
        Dim tb As TextBox = FormView1.FindControl("DescriptionLongTextBox")
        tb.Text = Server.HtmlDecode(tb.Text)
        'End If
    End Sub

    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        For i As Integer = 0 To e.NewValues.Count - 1
            If e.NewValues(i) IsNot Nothing Then
                e.NewValues(i) = Server.HtmlDecode(e.NewValues(i).ToString())
            End If
        Next
    End Sub

    Protected Sub DecodeTextBox_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
        DirectCast(sender, TextBox).Text = HttpUtility.HtmlDecode(DirectCast(sender, TextBox).Text)
    End Sub

End Class
