Partial Class Orders_List
    Inherits BasePage

    Dim _totalPrice As Decimal = 0
    Dim _totalOrders As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            DateFrom.Text = DateTime.Today.Date.AddMonths(-1).ToString("dd/MM/yyyy")
            DateTo.Text = DateTime.Today.Date.ToString("dd/MM/yyyy")
        Else
            ObjectDataSource1.SelectParameters(0).DefaultValue = 1
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub OrderIDSearchBoxGo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OrderIDSearchBoxGo.Click
        ObjectDataSource1.FilterExpression = ""
        ObjectDataSource1.FilterParameters.Clear()
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim _dateFrom As Date = DateFrom.Text
        'Dim _dateTo As Date = DateTo.Text
        'OrderIDSearchBox.Text = ""
        ObjectDataSource1.SelectParameters(0).DefaultValue = 1
        'ObjectDataSource1.FilterExpression = "Status='{0}' AND DateCreated >= '{1} 00:00:00' AND DateCreated <='{2} 23:59:59'"
        'ObjectDataSource1.FilterParameters.Add("StatusDropDownList", StatusDropDownList.SelectedValue)
        'ObjectDataSource1.FilterParameters.Add("DateFrom", _dateFrom.ToString("yyyy/MM/dd"))
        'ObjectDataSource1.FilterParameters.Add("DateTo", _dateTo.ToString("yyyy/MM/dd"))
        GridView1.DataBind()
    End Sub
    Protected Sub StatusDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles StatusDropDownList.SelectedIndexChanged
        ObjectDataSource1.SelectParameters(0).DefaultValue = 1
        GridView1.DataBind()
    End Sub
    Sub PrintOrders(ByVal Sender As Object, ByVal E As EventArgs)
        Dim arrOrders As Array
        Dim myOrders As New Orders()
        arrOrders = Split(Request("myOrders"), ",")
        Dim myEnum As System.Collections.IEnumerator = arrOrders.GetEnumerator()
        While myEnum.MoveNext()
            myOrders.UpdateOrderStatus(myEnum.Current, "Waiting to be picked", "Y", "N")
        End While
        GridView1.DataBind()
    End Sub
    Sub ProcessOrders(ByVal Sender As Object, ByVal E As EventArgs)
        Dim arrOrders As Array
        Dim myOrders As New Orders()
        arrOrders = Split(Request("myOrders"), ",")
        Dim myEnum As System.Collections.IEnumerator = arrOrders.GetEnumerator()
        While myEnum.MoveNext()
            myOrders.UpdateOrderStatus(myEnum.Current, "Waiting to be despatched", "N", "N")
        End While
        GridView1.DataBind()
    End Sub
    Sub DespatchOrders(ByVal Sender As Object, ByVal E As EventArgs)
        Dim arrOrders As Array
        Dim myOrders As New Orders()
        arrOrders = Split(Request("myOrders"), ",")
        Dim myEnum As System.Collections.IEnumerator = arrOrders.GetEnumerator()
        While myEnum.MoveNext()
            myOrders.UpdateOrderStatus(myEnum.Current, "Despatched", "N", "Y")
            myOrders.SendDespatchEmail(myEnum.Current)
        End While
        GridView1.DataBind()
    End Sub
    Sub Code10(ByVal Sender As Object, ByVal E As EventArgs)
        Dim arrOrders As Array
        Dim myOrders As New Orders()
        arrOrders = Split(Request("myOrders"), ",")
        Dim myEnum As System.Collections.IEnumerator = arrOrders.GetEnumerator()
        While myEnum.MoveNext()
            myOrders.UpdateOrderStatus(myEnum.Current, "Code 10", "N", "N")
        End While
        GridView1.DataBind()
    End Sub
    Sub CancelOrders(ByVal Sender As Object, ByVal E As EventArgs)
        Dim arrOrders As Array
        Dim myOrders As New Orders()
        arrOrders = Split(Request("myOrders"), ",")
        Dim myEnum As System.Collections.IEnumerator = arrOrders.GetEnumerator()
        While myEnum.MoveNext()
            myOrders.UpdateOrderStatus(myEnum.Current, "Cancelled", "N", "N")
        End While
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim dataItem As GridViewRow = DirectCast(e.Row, GridViewRow)
            _totalPrice += (DataBinder.Eval(dataItem.DataItem, "SubTotal") + DataBinder.Eval(dataItem.DataItem, "ShipCharge"))
            _totalOrders += 1
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim avgUnitPrice As Decimal = _totalPrice / CType(_totalOrders, Decimal)
            lblOrderCount.Text = "Orders: " & _totalOrders.ToString()
            lblTotal.Text = "Total: " & _totalPrice.ToString("c")
            lblAvg.Text = "Avg: " & avgUnitPrice.ToString("c")
        End If
    End Sub

    Protected Sub GridView1_DataBinding(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.DataBinding
        _totalPrice = 0
        _totalOrders = 0
    End Sub

End Class
