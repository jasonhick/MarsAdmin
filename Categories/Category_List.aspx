<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Category_List.aspx.vb" Inherits="Category_List" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Manage Categories</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategories" 
                TypeName="NAPDataSetTableAdapters.CategoriesTableAdapter">
            </asp:ObjectDataSource>

<asp:GridView ID="GridView1" runat="server" AllowPaging="False"
        AllowSorting="True" AutoGenerateColumns="False"  
        DataSourceID="ObjectDataSource1" DataKeyNames="ID">

        <Columns>
            <asp:TemplateField HeaderText="Category" SortExpression="Name">
                <ItemTemplate>
                    <a href='Category_Add.aspx?mode=edit&id=<%# Eval("ID") %>'><%# Eval("Name")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <a href='Category_Product.aspx?cid=<%# Eval("ID") %>'>View Products</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MetaTitle" HeaderText="MetaTitle"/>
            <asp:BoundField DataField="RewriteURL" HeaderText="RewriteURL" />
            <asp:CheckBoxField DataField="ShowInMenu" HeaderText="ShowInMenu" /> 
            <asp:CheckBoxField DataField="Active" HeaderText="Active" /> 
            <asp:BoundField DataField="SortOrder" HeaderText="SortOrder"  SortExpression="SortOrder" /> 
        </Columns>
    
</asp:GridView>

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

</asp:Content>



