<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MapMarketing.aspx.vb" Inherits="MMOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
    <div class="content-box-header">

	    <div class="align-left"><h3>Map Marketing Orders</h3></div>

        <div class="align-right"  style="margin-top:-7px; margin-right:-5px">
            <h3>Status:
            <asp:DropDownList ID="StatusDropDownList" runat="server" AutoPostBack="true">
                <asp:ListItem>Waiting to be printed</asp:ListItem>
                <asp:ListItem Selected="True">Waiting to be picked</asp:ListItem>
                <asp:ListItem>Waiting to be despatched</asp:ListItem>
                <asp:ListItem>Despatched</asp:ListItem>
            </asp:DropDownList>
            </h3>
        </div>
        		
        <div class="clear"></div>
    </div> <!-- End .content-box-header -->
    <div id="exporter" class="content-box-content">


         <asp:ListView ID="listView1" DataKeyNames="OrderID" runat="server" ItemPlaceholderID="itemPlaceHolder">
            <LayoutTemplate>
                <table>
                    <thead>
                        <tr>
                            <th scope="col">DATE</th>
                            <th scope="col">ORDERNUM</th>
                            <th scope="col">NAME</th>
                            <th scope="col">ADDRESS1</th>
                            <th scope="col">ADDRESS2</th>
                            <th scope="col">ADDRESS3</th>
                            <th scope="col">ADDRESS4</th>
                            <th scope="col">ADDRESS5</th>
                            <th scope="col">ADDRESS6</th>
                            <th scope="col">CODE</th>
                            <th scope="col">DESCRIPT</th>
                            <th scope="col">PERSON1</th>
                            <th scope="col">PERSON2</th>
                            <th scope="col">PERSON3</th>
                            <th scope="col">PERSON4</th>
                            <th scope="col">PERSON5</th>
                            <th scope="col">PERSON6</th>
                            <th scope="col">PERSON7</th>
                            <th scope="col">PERSON8</th>
                            <th scope="col">PERSON9</th>
                            <th scope="col">PERSON10</th>
                            <th scope="col">MESSAGE ATTACHED</th>
		                </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                <td><%# Eval("DateCreated")%></td>
                <td><%# Eval("OrderID")%></td>
                <td><%# Eval("ShipTitle")%> <%# Eval("ShipNameFirst")%> <%# Eval("ShipNameLast")%></td>
                <td><%# Eval("Company")%> <%# Eval("StreetLine1")%></td>
                <td><%# Eval("StreetLine2")%></td>
                <td><%# Eval("StreetLine3")%> </td>
                <td><%# Eval("City")%></td>
                <td><%# Eval("StateProv")%></td>
                <td><%# Eval("PostCode")%></td>
                <td></td>
                <td><%# CheckSKU(Eval("SupplierSKU").ToString, Eval("OptionSKU").ToString)%></td>
                <td><%# GetMapFields(Eval("BasketItemID"))%></td>
                <td><%# GenWordDoc(Eval("Message"), Eval("OrderID").ToString) %></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>



            <div style="width:100%; text-align:center; height:35px; padding:15px 0 10px 0; margin-top:10px">
                <asp:Button ID="btnExportGrid" runat="server" Text="Export to Excel" OnClick="BtnExportGrid_Click" />
    		    <input type="button" style="margin-right:50px" id="btnProcess" name="btnProcess" onserverclick="ProcessOrders"  runat="server" value="Process Selected Orders"/>
	    	    <input type="button" style="margin-right:50px" id="btnCode10" name="btnCode10" onserverclick="Code10"  runat="server" value="Code 10"/>
            </div>     

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

    <asp:SqlDataSource ID="SqlDataSource1" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        runat="server" SelectCommand="adm_ThirdPartyOrders_s" 
        SelectCommandType="StoredProcedure" >
        <SelectParameters> 
            <asp:ControlParameter ControlID="StatusDropDownList" 
                DefaultValue="Waiting to be picked" Name="Status" 
                PropertyName="SelectedValue" />
            <asp:Parameter Name="SupplierID" DefaultValue="122" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>

