<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Sitemap.aspx.vb" Inherits="Sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Manage Categories</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetSubCategories" 
                TypeName="NAPDataSetTableAdapters.CategoriesTableAdapter">
                <SelectParameters>
                    <asp:Parameter DefaultValue="76" Name="ParentID" Type="Int16" />
                </SelectParameters>
            </asp:ObjectDataSource>

<asp:GridView ID="GridView1" runat="server"
        AllowSorting="True" AutoGenerateColumns="False"  
        DataSourceID="ObjectDataSource1" DataKeyNames="ID">

        <Columns>
            <asp:TemplateField HeaderText="Category" SortExpression="Name" ItemStyle-Wrap=false>
                <ItemTemplate>
                    <%--<a href='Category_Edit.aspx?pid=<%# Eval("ID") %>'><%# Eval("Name")%></a>--%>
                    <a href='Category_Product.aspx?cid=<%# Eval("ID") %>'> <%# Eval("Name")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MetaTitle" HeaderText="MetaTitle"  ItemStyle-Wrap=false/>
            <asp:BoundField DataField="TagLine" HeaderText="TagLine"  ItemStyle-Wrap=false/>
            <asp:BoundField DataField="URLPrefix" HeaderText="URLPrefix"  ItemStyle-Wrap=false/>
            <asp:BoundField DataField="RewriteURL" HeaderText="RewriteURL"  ItemStyle-Wrap=false/>

        </Columns>
    
</asp:GridView>




	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->


</asp:Content>



