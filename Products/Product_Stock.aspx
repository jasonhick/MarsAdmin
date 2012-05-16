<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Product_Stock.aspx.vb" Inherits="Product_Stock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Stock Levels</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">

            <h3>Filter by Supplier:
            <asp:DropDownList ID="SupplierList" runat="server" AutoPostBack="True" AppendDataBoundItems="True" 
                DataSourceID="SuppliersDataSource" DataTextField="Name" DataValueField="ID">
                <asp:ListItem Selected="True" Value="" >(Show All)</asp:ListItem>
            </asp:DropDownList>
            </h3>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="50" 
                            AllowSorting="True" SortedAscendingHeaderStyle-CssClass="SortedAscendingHeader"
                            AutoGenerateColumns="False" DataKeyNames="ID"  AlternatingRowStyle-CssClass="alt-row"
                           PagerSettings-Position="TopAndBottom" DataSourceID="ObjectDataSource1">

                <Columns>
                    <asp:BoundField DataField="ProductName" ControlStyle-Width="200px" HeaderText="Product Name" SortExpression="ProductName" ReadOnly="true" />
                    <asp:BoundField DataField="ChoiceName" ControlStyle-Width="100px" HeaderText="Choice Name" SortExpression="ChoiceName"  ReadOnly="true"/>
            
                    <asp:TemplateField HeaderText="Stock Level" ControlStyle-Width="100px" SortExpression="StockLevel">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("StockLevel") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" Width="50px" runat="server" Text='<%# Bind("StockLevel") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ButtonType="Image" EditImageUrl="~/resources/images/glyph/pencil_16.png" UpdateImageUrl="~/resources/images/glyph/save_16.png" CancelImageUrl="~/resources/images/glyph/close_16.png" />

                    <asp:BoundField DataField="SupplierName" ControlStyle-Width="100px" ReadOnly="true" HeaderText="Supplier" SortExpression="SupplierName" />
                    <asp:BoundField DataField="ContactTel" ControlStyle-Width="100px" ReadOnly="true" HeaderText="Contact Tel" />
                    <asp:BoundField DataField="DateModified" ControlStyle-Width="100px" ReadOnly="true" HeaderText="Date Modified" SortExpression="DateModified" />
                </Columns>

                <PagerTemplate>
                    <div class="pagination" style="text-align:center">
                      <asp:LinkButton CommandName="Page" CommandArgument="First" ID="LinkButton1" runat="server">&lt;&lt; First</asp:LinkButton>
                      <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="LinkButton2" runat="server">&lt; Prev</asp:LinkButton>
                      <%= GridView1.PageIndex %> [Records <%= GridView1.PageIndex * GridView1.PageSize%> - <%= GridView1.PageIndex * GridView1.PageSize + GridView1.PageSize - 1%>]
                      <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="LinkButton3" runat="server">Next &gt;</asp:LinkButton>
                      <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="LinkButton4" runat="server">Last &gt;&gt;</asp:LinkButton>          
                    </div>
                </PagerTemplate>
    
            </asp:GridView>

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->


    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetStockLevels"
        UpdateMethod="UpdateStockLevel"
        TypeName="NAPDataSetTableAdapters.StockLevelsTableAdapter"
          filterexpression="SupplierID={0}">
            <FilterParameters>
                <asp:ControlParameter ControlID="SupplierList" PropertyName="SelectedValue" />
            </FilterParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="StockLevel" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="SuppliersDataSource" runat="server" 
        SelectMethod="GetSuppliersActive"
        TypeName="NAPDataSetTableAdapters.SuppliersTableAdapter">
    </asp:ObjectDataSource>
    
</asp:Content>