<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" EnableViewState="false" AutoEventWireup="false" CodeFile="Order_List.aspx.vb" Inherits="Orders_List" %>
<%@ Register Assembly="Html5Asp" Namespace="Html5Asp" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <!-- dateinput styling --> 
<style type="text/css">
/* the input field */
.date 
{
	border:1px solid #ccc;
	font-size:.8em;
	padding:4px;
	text-align:center;
	width:80px;
	-moz-box-shadow:0 0 10px #eee inset;
	-webkit-box-shadow:0 0 10px #eee inset;
}

/* calendar root element */
#calroot {
	/* place on top of other elements. set a higher value if nessessary */
	z-index:10000;
	
	margin-top:-1px;
	width:198px;
	padding:2px;
	background-color:#fff;
	font-size:11px;
	border:1px solid #ccc;
	
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	
	-moz-box-shadow: 0 0 15px #666;
	-webkit-box-shadow: 0 0 15px #666;	
}

/* head. contains title, prev/next month controls and possible month/year selectors */
#calhead {	
	padding:2px 0;
	height:22px;
} 

#caltitle {
	font-size:14px;
	color:#0150D1;	
	float:left;
	text-align:center;
	width:155px;
	line-height:20px;
	text-shadow:0 1px 0 #ddd;
}

#calnext, #calprev {
	display:block;
	width:20px;
	height:20px;
	background:transparent url(prev.gif) no-repeat scroll center center;
	float:left;
	cursor:pointer;
}

#calnext {
	background-image:url(next.gif);
	float:right;
}

#calprev.caldisabled, #calnext.caldisabled {
	visibility:hidden;	
}

/* year/month selector */
#caltitle select {
	font-size:10px;	
}

/* names of the days */
#caldays {
	height:14px;
	border-bottom:1px solid #ddd;
}

#caldays span {
	display:block;
	float:left;
	width:28px;
	text-align:center;
}

/* container for weeks */
#calweeks {
	background-color:#fff;
	margin-top:4px;
}

/* single week */
.calweek {
	clear:left;
	height:22px;
}

/* single day */
.calweek a {
	display:block;
	float:left;
	width:27px;
	height:20px;
	text-decoration:none;
	font-size:11px;
	margin-left:1px;
	text-align:center;
	line-height:20px;
	color:#666;
	-moz-border-radius:3px;
	-webkit-border-radius:3px; 		
} 

/* different states */
.calweek a:hover, .calfocus {
	background-color:#ddd;
}

/* sunday */
a.calsun {
	color:red;		
}

/* offmonth day */
a.caloff {
	color:#ccc;		
}

a.caloff:hover {
	background-color:rgb(245, 245, 250);		
}


/* unselecteble day */
a.caldisabled {
	background-color:#efefef !important;
	color:#ccc	!important;
	cursor:default;
}

/* current day */
#calcurrent {
	background-color:#498CE2;
	color:#fff;
}

/* today */
#caltoday {
	background-color:#333;
	color:#fff;
}    

</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

     <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3 class="align-left">Manage Orders</h3>


        <div class="align-right" style="margin-top:-7px; margin-right:-5px">
	        <!-- HTML5 date input --> 
	        <div style="float:left; margin-right:30px">
                <h3>From:<asp:TextBox ID="DateFrom" ClientIDMode="Static" class="date" runat="server" />
                &nbsp;&nbsp;
                To:<asp:TextBox ID="DateTo" ClientIDMode="Static" class="date" runat="server" />
                </h3>
            </div>
            <div style="float:right">
                <h3>Status:
                <asp:DropDownList ID="StatusDropDownList" runat="server" AutoPostBack="true">
                    <asp:ListItem>Waiting payment</asp:ListItem>
                    <asp:ListItem Selected="True">Waiting to be printed</asp:ListItem>
                    <asp:ListItem>Waiting to be picked</asp:ListItem>
                    <asp:ListItem>Waiting to be despatched</asp:ListItem>
                    <asp:ListItem>Despatched</asp:ListItem>
                    <asp:ListItem>Code 10</asp:ListItem>
                    <asp:ListItem Value="">-------------------</asp:ListItem>
                    <asp:ListItem>FWD to PayPal</asp:ListItem>
                    <asp:ListItem>Sent for 3D verification</asp:ListItem>   
                    <asp:ListItem>Refused</asp:ListItem>
                    <asp:ListItem>PAYPALFAIL</asp:ListItem>
                    <asp:ListItem>Cancelled</asp:ListItem>
                </asp:DropDownList>
                </h3>
            </div>
        </div>

		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">


        <div style="float:left">
            <asp:TextBox ID="OrderIDSearchBox" runat="server"></asp:TextBox>
            <asp:Button id="OrderIDSearchBoxGo" runat="server" Text="Search"/>
        </div>

        <div class="clear"></div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="OrderID" DataSourceID="ObjectDataSource1"
                AlternatingRowStyle-CssClass="alt-row"
                ShowFooter="false">

                <FooterStyle CssClass="GridView_Footer" />

                <EmptyDataTemplate>
                    There are no orders in this section.
                </EmptyDataTemplate>
                
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                               <input type="checkbox" name="checkAll" id="checkAll" onclick="jqCheckAll2( this.id, 'myOrders' )"/>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <input type="checkbox" name="myOrders" value="<%# Eval("OrderID") %>" >
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href='/Orders/Receipt.aspx?oid=<%# Eval("OrderID") %>' target="_new" ><img src='<%# CheckIsSurpriseIcon(Eval("IsSurprise")) %>' border='0'/></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:hyperlinkfield DataTextField="OrderID" DataNavigateUrlFields="OrderID" navigateurl="/Orders/Receipt.aspx" DataNavigateUrlFormatString="Receipt.aspx?oid={0}" headertext="Order No." target="_new" />
                    <asp:BoundField DataField="DateCreated" HeaderText="Created"  DataFormatString="{0:dd/MM/yy HH:mm}" SortExpression="DateCreated" />
                    <asp:TemplateField HeaderText="Billing" ItemStyle-CssClass="ProperCase">
                        <ItemTemplate>
                            <a href='/Customers/Customer_Edit.aspx?cid=<%# Eval("CustomerID") %>'>
                            <%# Eval("BillTitle") %> <%# Eval("BillNameFirst") %> <%# Eval("BillNameLast") %>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipping" ItemStyle-CssClass="ProperCase">
                        <ItemTemplate>
                            <%# Eval("ShipTitle")%> <%# Eval("ShipNameFirst")%> <%# Eval("ShipNameLast") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <%# FormatCurrency(Eval("SubTotal") + Eval("ShipCharge"), 2)%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ShipMethod" HeaderText="Ship Via" SortExpression="ShipMethod" />
                    <asp:BoundField DataField="CampaignID" HeaderText="CampaignID"/>
                    <asp:BoundField DataField="VoucherCode" HeaderText="Voucher"/>
                    <asp:BoundField DataField="VoucherCodeAmount" HeaderText="Amount" SortExpression="VoucherCodeAmount"  DataFormatString="{0:c}" />
                    <asp:BoundField DataField="AffiliateID" HeaderText="AffID" />
                    
                    <asp:BoundField DataField="DatePrinted" HeaderText="Printed" DataFormatString="{0:dd/MM/yy HH:mm}" SortExpression="DatePrinted" />
                    <asp:BoundField DataField="DateShipped" HeaderText="Shipped" DataFormatString="{0:dd/MM/yy HH:mm}" SortExpression="DateShipped" />

                </Columns>

            </asp:GridView>


<div id="orderTotals" class="align-right">
    <asp:Label ID="lblOrderCount" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblTotal" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblAvg" runat="server"></asp:Label>    
</div>    

<div class="align-left" style="margin-top:20px">
    <h3>&nbsp;Bulk Actions:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" Visible="false">
            <asp:ListItem>--------------</asp:ListItem>
            <asp:ListItem Value="print">&nbsp;-&nbsp;Print Orders</asp:ListItem>
            <asp:ListItem Value="process">&nbsp;-&nbsp;Process Orders</asp:ListItem>
            <asp:ListItem Value="despatch">&nbsp;-&nbsp;Despatch Orders</asp:ListItem>
        </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="DO IT!" />
    </h3>
</div>


<div class="clear"></div>

	    </div><!-- End .content-box-content -->
    </div><!-- End .content-box -->



        <div style="width:100%; text-align:center; height:35px; padding:15px 0 10px 0; margin-top:10px">
		<input type="button" style="margin-right:50px" id="btnPrint" name="btnPrint" onclick="printOrders();" onserverclick="PrintOrders" runat="server" value="Print Selected Orders"/>
		<input type="button" style="margin-right:50px" id="btnProcess" name="btnProcess" onserverclick="ProcessOrders"  runat="server" value="Process Selected Orders"/>
		<input type="button" style="margin-right:50px" id="btnDespatch" name="btnDespatch" onserverclick="DespatchOrders"  runat="server" value="Despatch Selected Orders"/>
		<input type="button" style="margin-right:50px" id="btnCode10" name="btnCode10" onserverclick="Code10"  runat="server" value="Code 10"/>
        <input type="button" style="margin-right:50px" id="Button2" name="btnCancel" onserverclick="CancelOrders"  runat="server" value="Cancel Order"/>
        </div>
    

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetOrders"
        TypeName="NAPDataSetTableAdapters.vw_OrderListSummaryTableAdapter"
        OldValuesParameterFormatString="{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="OrderIDSearchBox" DefaultValue="0" Name="ID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DateFrom" Name="DateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="DateTo" Name="DateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="StatusDropDownList" Name="Status" PropertyName="Text" Type="String" />
            </SelectParameters>
    </asp:ObjectDataSource>


    <script type="text/javascript">

	    function jqCheckAll2(id, name) {
		    $("INPUT[@name=" + name + "][type='checkbox']").attr('checked', $('#' + id).is(':checked'));
	    }

	    function printOrders() {
	        field = document.forms[0].myOrders;
	        var tmp = "";
	        var pos;
	        for (var i = 0; i < field.length; i++) {
	            if (field[i].checked) {
	                pos = field[i].value.indexOf("|") + 1
	                tmp += field[i].value.substring(pos) + ","
	            }
	        }
	        window.open("Receipt.aspx?oid=" + (tmp.substring(0, tmp.length - 1)))
	        //return true;
	    }    

	    $(".date").dateinput({
            format:'dd/mm/yy',
            selectors:false
        });

	</script> 

</asp:Content>

