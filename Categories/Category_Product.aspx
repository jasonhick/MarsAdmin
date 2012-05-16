<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" EnableViewState="false"  AutoEventWireup="false" CodeFile="Category_Product.aspx.vb" Inherits="Category_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<style type="text/css">
.added {color:Green; font-weight:bold;background-color: yellow;}
.removed {color:#fff; font-weight:bold;background-color: red;}

#missing{margin:0 3px 0 3px}
#missing ul , #missing ul li
{
    list-style-image:none;
    list-style-type:none;
    background:none
}

#missing ul li
{
background-color:#eee;
border: solid 1px #ccc;
color:#222;
display:block;
font-size:11px;
margin-bottom:-1px;
padding:5px 5px;
text-decoration:none   
}

#missing ul li:first-child
{
    -moz-border-radius:7px 7px 0 0;
    -webkit-border-radius:7px 7px 0 0;
    border-radius:7px 7px 0 0;
}

#missing ul li:last-child
{
    -moz-border-radius:0 0 7px 7px;
    -webkit-border-radius:0 0 7px 7px;
    border-radius:0 0 7px 7px;
}

</style>


<div class="content-box"><!-- Start Content Box -->
	<div class="content-box-header">
		<h3>Edit Products in : <asp:Literal runat="server" ID="litProductName"></asp:Literal></h3>    
		<div class="clear"></div>
	</div> <!-- End .content-box-header -->
    <div class="content-box-content">
    
    
            
<div class="align-left content-box">

    	<div class="content-box-header">
		<h3>Products to add</h3>
	    </div>

    <div class="align-left" style="margin:20px 0 10px 5px">
    <h5>Text Search:</h5>
    <input type="text" name="search" value="" id="prodSearch" class="text-input small-input" />
    </div>
    <div class="align-right" style="margin:20px 20px 10px 10px">
        <h5>Filter by Supplier:</h5>
        <asp:DropDownList ID="SupplierList" runat="server" AutoPostBack="True" AppendDataBoundItems="True" 
            DataSourceID="SuppliersDataSource" DataTextField="Name" DataValueField="ID">
            <asp:ListItem Selected="True" Value="" >(Show All)</asp:ListItem>
        </asp:DropDownList>
    </div>
    
    
    <div class="clear"></div>
    <div id="missing" style="width:440px; overflow:auto">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
            <HeaderTemplate>
            <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li><asp:checkbox ID="ProductID" ClientIDMode="Predictable" runat="server" value='<%# Container.DataItem("ProductID")%>' />
                <asp:Label id="label" AssociatedControlId="ProductID" Text='<%# Container.DataItem("ProductName")%>' runat="server" /></li>
            </ItemTemplate>
            <FooterTemplate>
            </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>

    <asp:Button ID="Button1" runat="server" Text="Add selected products to category >>" />
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</div>


    <div class="align-left content-box">
        <div class="content-box-header"><h3>Active Products</h3></div>
        <div class="align-left" style="margin:20px 0 10px 5px">
        <h5>Search for a product:</h5>
        <asp:TextBox TextMode="SingleLine" ClientIDMode="Static" id="activeProdSearch" class="text-input medium-input" runat="server" />
        </div>
        <div class="clear"></div>
        <asp:ListView ID="lvwActiveProducts" DataKeyNames="ProductID" runat="server" ItemPlaceholderID="itemPlaceHolder" DataSourceID="ObjectDataSource1">
            <LayoutTemplate>
                <table style="width:480px" id="DataList1">
                    <thead>
                        <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Featured</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("ProductID") %></td>
                    <td><%# Eval("ProductName")%></td>
                    <td><asp:CheckBox id="ProductID" runat="server" value='<%# Eval("ProductID")%>' 
                    AutoPostBack="true" Checked='<%# Convert.ToBoolean(Eval("IsFeaturedOnHomePage")) %>'
                    OnCheckedChanged="Item_CheckedChanged"
                    /></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

    </div>

    <div class="clear"></div>
    </div>
</div>



<script type="text/javascript">
<!--
    
    $(document).ready(function () {
        $('input#prodSearch').quicksearch('ul li');
        $('input#activeProdSearch').quicksearch('#DataList1 tbody tr');


        $('#missing').css({ 'height': (($(window).height()) - 270) + 'px' });

        $(window).resize(function () {
            $('#missing').css({ 'height': (($(window).height()) - 270) + 'px' });
        });

    });

//-->
</script>


<asp:SqlDataSource ID="SuppliersDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
    SelectCommand="adm_SuppliersActive_s" SelectCommandType="StoredProcedure">
</asp:SqlDataSource>

<asp:ObjectDataSource ID="ObjectDataSource1" runat="server"  
    OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetProductsByCategory" 
    TypeName="NAPDataSetTableAdapters.ProductsXCategoriesTableAdapter">
    <SelectParameters>
        <asp:QueryStringParameter Name="CategoryID" QueryStringField="cid" 
            Type="Int16" />
    </SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetMissingProducts" 
    TypeName="NAPDataSetTableAdapters.ProductsXCategoriesTableAdapter"
        FilterExpression="SupplierID={0}">
    <SelectParameters>
        <asp:QueryStringParameter Name="CategoryID" QueryStringField="cid" 
            Type="Int16" />
    </SelectParameters>
    <FilterParameters>
        <asp:ControlParameter ControlID="SupplierList" PropertyName="SelectedValue" />
    </FilterParameters>
</asp:ObjectDataSource>


</asp:Content>

