Imports System
Imports System.Configuration
Imports System.Collections
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Public Class CategoriesDB

    '#--------------------------------------------
    '### Function: GetSearchCategories
    '#--------------------------------------------  
    Public Function GetCategories() As SqlDataReader

        '# instantiate objects
        Dim myConnection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("NAPConnectionString").ConnectionString)
        Dim myCommand As SqlCommand = New SqlCommand("adm_Categories_s", myConnection)

        '# set command as a sp
        myCommand.CommandType = CommandType.StoredProcedure

        '# execute the command
        myConnection.Open()
        Dim result As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)

        '# return the result
        Return result

        '# close the connection
        myConnection.Close()

    End Function

End Class
