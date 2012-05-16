<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Supplier_List.aspx.vb" Inherits="Suppliers_Supplier_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Manage Suppliers</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">


            <asp:GridView ID="GridView1" runat="server" AutoGenerateEditButton="True"
                DataKeyNames="ID" DataSourceID="ObjectDataSource1" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                        SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="ContactTel" HeaderText="ContactTel" 
                        SortExpression="ContactTel" />
                </Columns>

            </asp:GridView>


        </div>
    </div>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"  
        OldValuesParameterFormatString="{0}" SelectMethod="GetSuppliersAll" 
        TypeName="NAPDataSetTableAdapters.SuppliersTableAdapter" 
        InsertMethod="InsertSupplier" UpdateMethod="UpdateSupplier">
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Int16" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContactTel" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int16" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContactTel" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>

</asp:Content>

