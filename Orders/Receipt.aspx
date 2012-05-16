<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Receipt.aspx.vb" Inherits="Orders_Receipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
	<style type="text/css">
	body {font-family:Tahoma; font-size:11px; color:#333333; line-height:15px;}
	td {font-family:Tahoma; color:#333333; line-height:11px;}		
	#billing {position:absolute; width:300px; height:115px;top:76px; left:10px; text-transform:uppercase}
	#shipping {position:absolute; width:300px; height:115px; top:76px; left:390px; text-transform:uppercase}
	#deliverylabel {width:345px; height:170px; padding:5px; position:absolute; left:8px; top:828px; text-transform:uppercase; font-size:12px}
	#deliverylabel img {width:120px;height:120px;border:none; float:right; margin-bottom:25px}
	#deliverylabel span{float:left;line-height:16px}
	#messagelabel {width:345px; height:170px; padding:5px; border:none; margin:0; text-align:center; position:absolute; left:367px; top:870px}
	#messagelabel td {font-family:Journal, tahoma, arial; font-size:2.3em; font-weight:bold; vertical-align:middle; text-align:center;line-height:22px}
	h4 {font-size:1em; text-transform:capitalize;margin-bottom:5px}
	#address {clear:both; font-size:9px; text-transform:capitalize}
	tbody td {text-align:left; vertical-align:top; padding-top:5px; padding-bottom:5px; vertical-align:top}
	tfoot td {text-align:right; vertical-align:top; height:20px; padding:2px; font-weight:bold}
	td.decimal{text-align:right}
	td.number{text-align:center; vertical-align:middle}
	#notes {position:absolute;top:755px; left:20px}
	.left {text-align:left}
	td.small {font-size:.8em}
	.prodname{font-size:13px}
	.prodqty{font-size:16px; font-weight:bold; vertical-align:top; text-align:center}
	.floatright{float:right}
	.floatleft{float:left}
	</style>	    
</head>
<body>
    <form id="form1" runat="server">
    
 	<asp:ListView ID="lvwOrders" runat="server" ItemPlaceholderID="itemPlaceHolder" DataKeyNames="OrderID">
   
        <LayoutTemplate>
               <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
        </LayoutTemplate>

        <ItemTemplate>
			<div style="position:relative; page-break-before:always;">
			<!--- BILLING ADDRESS //--->
			<div id="billing">
				<H4>billing address</H4>
				<div contenteditable="true">
				<%#Eval("BillTitle")%>&nbsp;<%#Eval("BillNameFirst") %>&nbsp;<%#Eval("BillNameLast") %><br />
				<%#CheckEmptyLine(Eval("BillCompany"))%>
				<%#CheckEmptyLine(Eval("BillLine1"))%>
				<%#CheckEmptyLine(Eval("BillLine2"))%>
				<%#CheckEmptyLine(Eval("BillLine3"))%>
				<%#Eval("BillCity")%><%#CheckState(Eval("BillState"))%>
				<%#CheckCountry(Eval("BillCountry"))%>
				<%#Eval("BillPostcode")%>				
				</div>	
			</div>	
			<!--- SHIPPING ADDRESS //--->
			<div id="shipping">
				<H4>delivery address</H4>
				<div contenteditable="true">
					<%#Eval("ShipTitle")%>&nbsp;<%#Eval("ShipNameFirst")%>&nbsp;<%#Eval("ShipNameLast")%><br />
					<%#CheckEmptyLine(Eval("ShipCompany"))%>
					<%#CheckEmptyLine(Eval("ShipLine1"))%>
					<%#CheckEmptyLine(Eval("ShipLine2"))%>
					<%#CheckEmptyLine(Eval("ShipLine3"))%>
					<%#Eval("ShipCity")%><%#CheckState(Eval("ShipState"))%>
					<%#CheckCountry(Eval("ShipCountry"))%>
					<%#Eval("ShipPostcode")%>
				</div>	
			</div>
			
			<table width="680" cellpadding="0" cellspacing="0" border="0" style="position:absolute; left:14px; top:225px; z-index:10">
				<thead>
					<tr><td valign="middle" colspan="4" height="18"><b>Order No:&nbsp;<%#Eval("OrderID")%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Date:</b>&nbsp;<%#Eval("DateCreated")%></td></tr>
					<tr>
						<td width="5%" class="number" height="18"><b>Qty</b></TD>
						<td width="70%"><b>Item</b></TD>
						<td width="17%" class="decimal"><b>Each (&pound;)</b></TD>
						<td width="8%" class="decimal"><b>Total (&pound;)</b></TD>
					</tr>
				</thead>
				
								
				<!-- BASKET ITEMS //-->
				<asp:ListView ID="lvwItems" runat="server" ItemPlaceholderID="itemPlaceHolder2" DataSourceID="objItems">
					<LayoutTemplate>                       
						<asp:PlaceHolder ID="itemPlaceHolder2" runat="server" />                    
					</LayoutTemplate>                 
					<ItemTemplate>                       
						<tr>
							<td class="prodqty"><%#Eval("Qty")%></td>
							<td> 
								<span class="prodname"><%#Eval("Name")%><%#CheckOptionName(Eval("OptionName"))%></span>
								<%#CheckIsWrapepd(Eval("IsWrapped"))%>
								<%#CheckShipSep(Eval("ShipSeparately"))%>
								<%#GetItemFields(Eval("ID"))%>
							</td>
							<td class="decimal"><%#DataBinder.Eval(Container.DataItem, "Price", "{0:C2}")%></td>
							<td class="decimal" ><%#DataBinder.Eval(Container.DataItem, "LineTotal", "{0:C2}")%></td>
						</tr>
					</ItemTemplate>
					<EmptyDataTemplate>
						There are no items for this order!
					</EmptyDataTemplate>
				</asp:ListView>
				<asp:SqlDataSource ID="objItems" ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" runat="server" SelectCommand="basketitems_s" SelectCommandType="StoredProcedure" > 
					<SelectParameters>                       
						<asp:Parameter Name="BasketID" />                    
					</SelectParameters>                 
				</asp:SqlDataSource>	
	
				<tfoot>
					<tr>
						<td></td>
						<td colspan='2' class="decimal">Subtotal:</td>
						<td><%#DataBinder.Eval(Container.DataItem, "Subtotal", "{0:C2}")%></td>
					</tr>
					<%#DisplayVoucherRow(Eval("VoucherCodeAmount"))%>
					<tr>
						<td colspan='3' class="decimal">Delivery (<%# Eval("ShipMethod") %>):</td>
						<td><%#DataBinder.Eval(Container.DataItem, "ShipCharge", "{0:C2}")%></td>
					</tr>
					<tr>
						<td colspan='3' class="decimal">Total:</td>
						<td><%#FormatCurrency(Eval("ShipCharge") + Eval("Subtotal") + Eval("VoucherCodeAmount"), 2)%></td>
					</tr>
					<tr>
						<td colspan='3' class="small decimal">Vat @20%: <%#CalculateVAT(Eval("ShipCharge") + Eval("Subtotal"))%></td>
						<td width="9%" class="small decimal" nowrap>Net: <%#CalculateNet(Eval("ShipCharge") + Eval("Subtotal"))%></td>
					</tr>
				</tfoot>
				
			</table> 			
			
			<div style='position:absolute; padding:10px; line-height:4em; top:400px; left:14px;z-index:5; display:<%#CheckIsSurprise(Eval("IsSurprise"))%>'>
			<span style="font-size:5em; font-weight:bold; color:#cccccc">DO NOT SEND INVOICE</span>
			</div>

			<div style="position:absolute; padding:10px; line-height:4em; top:200px; left:35px;z-index:5;font-size:5em; font-weight:bold; color:#cccccc"><%#ShowShipMethod(Eval("ShipMethodID"), Eval("ShipMethod"))%></div>

			<!--- MESSAGE & PACKED BY //--->
			<div style="position:absolute; top:730px; left:14px;"><b>Your order was packed by:</b></div>
			<div style="position:absolute; top:730px; left:350px;"><small><b>N.B.</b> Items marked "Sent separately" are sent to you direct from the supplier.</small></div>	

			<!--- COMPANY ADDRESS //--->
			<div style="position:absolute; top:770px; left:0px;">
				<span style="font-size:9px">Needapresent.com, The Leathermarket, 11-13 Weston St, London, SE1 3ER&nbsp;&nbsp;&nbsp;Tel: 020 3239 1996&nbsp;&nbsp;&nbsp;Email: help@needapresent.com&nbsp;&nbsp;&nbsp;VAT No: 802733748&nbsp;&nbsp;&nbsp;Co. Reg: 4928138</span>
			</div>
			
			<!--- DELIVERY LABEL //--->
			<div id="deliverylabel" >
			<asp:Image id="onePixel" runat="server" ImageUrl="/resources/images/1pixel.gif" />
				<span contenteditable="true">
					<%#Eval("ShipTitle")%>&nbsp;<%#Eval("ShipNameFirst")%>&nbsp;<%#Eval("ShipNameLast")%><br />
					<%#CheckEmptyLine(Eval("ShipCompany"))%>
					<%#CheckEmptyLine(Eval("ShipLine1"))%>
					<%#CheckEmptyLine(Eval("ShipLine2"))%>
					<%#CheckEmptyLine(Eval("ShipLine3"))%>
					<%#Eval("ShipCity")%><br />
					<%#CheckEmptyLine(Eval("ShipState"))%>
					<%#CheckCountry(Eval("ShipCountry"))%>
					<%#Eval("ShipPostcode")%>
				</span>
				
				<div id="address"><div class="floatleft" contenteditable="true"><b>Order No. <%#Eval("OrderID")%></b></div>
				<div class="floatright" style="margin-right:20px; text-transform:uppercase"><b><%#ShowShipMethod(Eval("ShipMethodID"), Eval("ShipMethod"))%></b></div>
				<br clear="left"/>Needapresent.com, The Leathermarket, 11-13 Weston St, London SE1 3ER</div>
			</div>

			<!--- MESSAGE LABEL //--->
			<table id="messagelabel"><tr><td height=165 width=340><div contenteditable="true"><%#CheckMessage(Eval("Message"), Eval("BillNameFirst"), Eval("ShipNameFirst"))%></div></td></tr></table>
			</div>
		</ItemTemplate>
	</asp:ListView>
 
    </form>
    
<script language="javascript" type="text/javascript">
    window.focus()
</script>    
    
</body>
</html>
