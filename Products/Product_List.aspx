<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Product_List.aspx.vb" Inherits="Product_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Manage Products</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">

            <h3>Filter by Supplier:
            <asp:DropDownList ID="SupplierList" runat="server" AutoPostBack="True" 
                DataSourceID="SuppliersDataSource" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                <asp:ListItem Selected="True" Value="" >(Show All)</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="ActiveCheckBox" Text="Active" Checked="true" runat="server" AutoPostBack="true" />
            </h3>

<asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="20"
        AllowSorting="True" AutoGenerateColumns="False"  
        DataSourceID="LinqDataSource2" DataKeyNames="ID" AlternatingRowStyle-CssClass="alt-row">

        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID"/>
            <asp:TemplateField HeaderText="Product Name" SortExpression="Name">
                <ItemTemplate>
                    <a href='Product_Edit.aspx?pid=<%# Eval("ID") %>'><%# Eval("Name") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Supplier">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Supplier.Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2"
                            DataSourceID="SupplierDataSource"
                            DataTextField="Name"
                            DataValueField="ID"
                            SelectedValue='<%# Bind("SupplierID") %>'
                            runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SupplierSKU" HeaderText="SKU" />
            <asp:BoundField DataField="ImageFileName" HeaderText="ImageFileName" />
            <asp:BoundField DataField="RewriteURL" HeaderText="RewriteURL" />
        </Columns>



    <PagerTemplate>
        <div class="pagination" style="align:center">
          <asp:LinkButton CommandName="Page" CommandArgument="First" ID="LinkButton1" runat="server">&lt;&lt; First</asp:LinkButton>
          <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="LinkButton2" runat="server">&lt; Prev</asp:LinkButton>
          [Records <%= GridView1.PageIndex * GridView1.PageSize %> - <%= GridView1.PageIndex * GridView1.PageSize + GridView1.PageSize - 1 %>]
          <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="LinkButton3" runat="server">Next &gt;</asp:LinkButton>
          <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="LinkButton4" runat="server">Last &gt;&gt;</asp:LinkButton>          
        </div>
    </PagerTemplate>
    
</asp:GridView>




	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->


    <asp:LinqDataSource ID="LinqDataSource1" runat="server"
        ContextTypeName="NAPDataContext" EntityTypeName="" 
        TableName="Products" 
        Where="SupplierID == @SupplierID &amp;&amp; Active == @Active" 
        OrderBy="Name">
        <WhereParameters>
            <asp:ControlParameter ControlID="SupplierList" Name="SupplierID" 
                PropertyName="SelectedValue" Type="Int16" DefaultValue="*" />
            <asp:ControlParameter ControlID="ActiveCheckBox" DefaultValue="True" 
                Name="Active" PropertyName="Checked" Type="Boolean" />
        </WhereParameters>
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="LinqDataSource2" runat="server"
        ContextTypeName="NAPDataContext" EntityTypeName="" 
        TableName="Products" 
        Where="Active == @Active" OrderBy="ID Desc">
        <WhereParameters>
            <asp:ControlParameter ControlID="ActiveCheckBox" DefaultValue="True" 
                Name="Active" PropertyName="Checked" Type="Boolean" />
        </WhereParameters>
    </asp:LinqDataSource>


    <asp:SqlDataSource ID="SuppliersDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        SelectCommand="adm_SuppliersActive_s" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

</asp:Content>

