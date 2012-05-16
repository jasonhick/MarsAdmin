Imports System
Imports System.Data
Imports System.Configuration
Imports System.IO
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Public Class GridViewExportUtil2

    Public Shared Sub ExportCSV(ByVal filename As Object, ByVal gvExport As GridView)
        Dim sw As New StringWriter
        ' Add header row 
        sw.Write(GetCSVLine(gvExport.HeaderRow.Cells) & vbCrLf)
        For i = 0 To gvExport.Rows.Count - 1

            For j = 0 To gvExport.Columns.Count - 1
                '# check for template fields

                If gvExport.Rows(i).Cells(j).Text = String.Empty Then
                    Dim ctl As DataBoundLiteralControl = _
                    TryCast(gvExport.Rows(i).Cells(j).Controls(0), DataBoundLiteralControl)
                    If ctl IsNot Nothing Then
                        sw.Write("""" & ctl.Text.Trim & """" & ",")
                    Else

                        '# check for other types of controls inside the templatefield
                        Dim ctl2 As HyperLink = _
                        TryCast(gvExport.Rows(i).Cells(j).Controls(1), HyperLink)
                        sw.Write("""" & ctl2.Text & """,")

                    End If

                Else
                    '# write out bound fields
                    '# trim out the &nbsp;'s from empty cells
                    If gvExport.Rows(i).Cells(j).Text = "&nbsp;" Then
                        sw.Write(Chr(34) & gvExport.Rows(i).Cells(j).Text.Replace("&nbsp;", "") & Chr(34) & ",")
                    Else
                        sw.Write(Chr(34) & gvExport.Rows(i).Cells(j).Text.Trim & Chr(34) & ",")
                    End If
                End If
            Next

            sw.WriteLine()
        Next
        'Create file
        Dim w As System.IO.TextWriter = New System.IO.StreamWriter(filename, False, Encoding.Default)
        w.Write(sw.ToString())
        w.Flush()
        w.Close()

    End Sub

    Private Shared Function GetCSVLine(ByVal cellsToAdd As TableCellCollection) As String
        Dim line As String = [String].Empty
        Dim isFirst As Boolean = True
        For Each cell As TableCell In cellsToAdd
            If Not isFirst Then
                line += ","
            End If
            isFirst = False

            line += cell.Text
        Next
        Return line
    End Function

    'Export Gridview Data to Excel File and Save Excel file to Server Folder Rather than
    'allowing user to Open or Save it.
    Public Shared Sub ExportToFolder(ByVal fileName As String, ByVal gv As GridView)
        Dim sb As New System.Text.StringBuilder()
        Using sw As New StringWriter(sb)

            sb.AppendLine("<style>br {mso-data-placement:same-cell}</style>")

            Using htw As New HtmlTextWriter(sw)

                '  Create a form to contain the grid
                Dim table As New Table()
                table.GridLines = gv.GridLines

                '  add the header row to the table
                If gv.HeaderRow IsNot Nothing Then
                    GridViewExportUtil2.PrepareControlForExport(gv.HeaderRow)
                    table.Rows.Add(gv.HeaderRow)
                End If
                '  add each of the data rows to the table
                For Each row As GridViewRow In gv.Rows
                    GridViewExportUtil2.PrepareControlForExport(row)
                    row.VerticalAlign = VerticalAlign.Top
                    table.Rows.Add(row)
                Next
                '  add the footer row to the table
                If gv.FooterRow IsNot Nothing Then
                    GridViewExportUtil2.PrepareControlForExport(gv.FooterRow)
                    table.Rows.Add(gv.FooterRow)
                End If
                '  render the table into the htmlwriter
                table.RenderControl(htw)
                'Create file
                Dim w As System.IO.TextWriter = New System.IO.StreamWriter(fileName, False, Encoding.Default)
                w.Write(sb.ToString())
                w.Flush()
                w.Close()
            End Using
        End Using
    End Sub

    'Export LIstVIew Data to Excel File and Save Excel file to Server Folder Rather than
    'allowing user to Open or Save it.
    Public Shared Sub ExportLvToExcel(ByVal lvExport As ListView, ByVal FileName As String)

        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        lvExport.RenderControl(htw)
        sw.WriteLine()

        Dim w As System.IO.TextWriter = New System.IO.StreamWriter(FileName, False, Encoding.Default)
        w.Write(sw.ToString())
        w.Flush()
        w.Close()

    End Sub

    Public Shared Sub Export(ByVal fileName As String, ByVal gv As GridView)
        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.AddHeader("content-disposition", String.Format("attachment; filename={0}", fileName))
        HttpContext.Current.Response.ContentType = "application/ms-excel"
        Dim sw As StringWriter = New StringWriter
        Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)

        '  Create a form to contain the grid
        Dim table As Table = New Table
        table.GridLines = gv.GridLines
        '  add the header row to the table
        If (Not (gv.HeaderRow) Is Nothing) Then
            GridViewExportUtil2.PrepareControlForExport(gv.HeaderRow)
            table.Rows.Add(gv.HeaderRow)
        End If
        '  add each of the data rows to the table
        For Each row As GridViewRow In gv.Rows
            GridViewExportUtil2.PrepareControlForExport(row)
            table.Rows.Add(row)
        Next
        '  add the footer row to the table
        If (Not (gv.FooterRow) Is Nothing) Then
            GridViewExportUtil2.PrepareControlForExport(gv.FooterRow)
            table.Rows.Add(gv.FooterRow)
        End If
        '  render the table into the htmlwriter
        table.RenderControl(htw)
        '  render the htmlwriter into the response
        HttpContext.Current.Response.Write(sw.ToString)
        HttpContext.Current.Response.End()
    End Sub


    ' Replace any of the contained controls with literals
    Private Shared Sub PrepareControlForExport(ByVal control As Control)
        Dim i As Integer = 0
        Do While (i < control.Controls.Count)
            Dim current As Control = control.Controls(i)
            If (TypeOf current Is LinkButton) Then
                control.Controls.Remove(current)
                control.Controls.AddAt(i, New LiteralControl(CType(current, LinkButton).Text))
            ElseIf (TypeOf current Is ImageButton) Then
                control.Controls.Remove(current)
                control.Controls.AddAt(i, New LiteralControl(CType(current, ImageButton).AlternateText))
            ElseIf (TypeOf current Is HyperLink) Then
                control.Controls.Remove(current)
                control.Controls.AddAt(i, New LiteralControl(CType(current, HyperLink).Text))
            ElseIf (TypeOf current Is DropDownList) Then
                control.Controls.Remove(current)
                control.Controls.AddAt(i, New LiteralControl(CType(current, DropDownList).SelectedItem.Text))
            ElseIf (TypeOf current Is CheckBox) Then
                control.Controls.Remove(current)
                '#control.Controls.AddAt(i, New LiteralControl(CType(current, CheckBox).Checked))
                'TODO: Warning!!!, inline IF is not supported ?
            End If
            If current.HasControls Then
                GridViewExportUtil2.PrepareControlForExport(current)
            End If
            i = (i + 1)
        Loop
    End Sub


End Class
