<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Category_List_Subs.aspx.vb" Inherits="Category_List" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Manage Categories</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">

<asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="20"
        AllowSorting="True" AutoGenerateColumns="False"  
        DataSourceID="SqlDataSource1" DataKeyNames="ID">

        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Category Name" 
                SortExpression="Category Name" />
            <asp:TemplateField>
                <ItemTemplate>
                    <a href='Category_Edit.aspx?pid=<%# Eval("ID") %>'><%# Eval("Name")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MetaTitle" HeaderText="MetaTitle" 
                SortExpression="MetaTitle" />
            <asp:BoundField DataField="MetaDescription" HeaderText="MetaDescription" 
                SortExpression="MetaDescription" />
            <asp:BoundField DataField="MetaKeywords" HeaderText="MetaKeywords" 
                SortExpression="MetaKeywords" />
            <asp:BoundField DataField="RewriteURL" HeaderText="RewriteURL" 
                SortExpression="RewriteURL" />
            <asp:CheckBoxField DataField="ShowInMenu" HeaderText="ShowInMenu" 
                SortExpression="ShowInMenu" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
            <asp:BoundField DataField="SortOrder" HeaderText="SortOrder" 
                SortExpression="SortOrder" />
        </Columns>
    
</asp:GridView>




	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->


<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        SelectCommand="adm_CategoriesSub_s" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="1" Name="ParentID" 
            QueryStringField="pid" Type="Int16" />
    </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>



