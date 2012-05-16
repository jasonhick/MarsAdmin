<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" EnableEventValidation="false" CodeFile="Crowther.aspx.vb" Inherits="Crowther" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
    <div class="content-box-header">

	    <div class="align-left"><h3>Russell Crowther Orders</h3></div>

        <div class="align-right"  style="margin-top:-7px; margin-right:-5px">
            <h3>Status:
            <asp:DropDownList ID="StatusDropDownList" runat="server" AutoPostBack="true">
                <asp:ListItem>Waiting to be printed</asp:ListItem>
                <asp:ListItem selected="True">Waiting to be picked</asp:ListItem>
                <asp:ListItem>Waiting to be despatched</asp:ListItem>
                <asp:ListItem>Despatched</asp:ListItem>
            </asp:DropDownList>
            </h3>
        </div>
        		
        <div class="clear"></div>
    </div> <!-- End .content-box-header -->
    <div id="exporter" class="content-box-content">


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <input type="checkbox" name="checkAll" id="checkAll" onclick="jqCheckAll2(this.id,'myOrders')"/>
                </HeaderTemplate>
                <ItemTemplate>
                    <input id="chkSelect" name="chkOrders" type="checkbox" runat="server" value='<%# Eval("OrderID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
            <asp:BoundField DataField="DateCreated"  DataFormatString="{0:dd/MM/yyyy}" HeaderText="Order Date" />
            <asp:TemplateField HeaderText="Delivery Name" ItemStyle-CssClass="ProperCase">
                <ItemTemplate><%# Eval("ShipTitle")%> <%# Eval("ShipNameFirst")%> <%# Eval("ShipNameLast")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DeliveryAddress1" ItemStyle-CssClass="ProperCase">
                <ItemTemplate><%# Eval("Company")%> <%# Eval("StreetLine1")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DeliveryAddress2" ItemStyle-CssClass="ProperCase">
                <ItemTemplate><%# Eval("StreetLine2")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DeliveryAddress3" ItemStyle-CssClass="ProperCase">
                <ItemTemplate><%# Eval("StreetLine3")%> <%# Eval("City")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DeliveryAddress4" ItemStyle-CssClass="ProperCase">
                <ItemTemplate><%# Eval("StateProv")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PostCode" ItemStyle-CssClass="UpperCase">
                <ItemTemplate><%# Eval("PostCode")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delivery Type">      
                <ItemTemplate>1-3 Days</ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product">
                <ItemTemplate><%# Eval("ProductName")%><%# CheckEmptyString(Eval("OptionName"))%></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Qty" HeaderText="Qty" />
            <asp:TemplateField HeaderText="Personalisation">
                <ItemTemplate><%# GetItemFields(Eval("BasketItemID"))%></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Message" HeaderText="Needapresent Gift Message" HtmlEncode="false" />
        </Columns>
    </asp:GridView>

            <div style="width:100%; text-align:center; height:35px; padding:15px 0 10px 0; margin-top:10px">
                <asp:Button ID="btnEmailOrders" runat="server" Text="Email Orders" />
    		    <input type="button" style="margin-right:50px" id="btnProcess" name="btnProcess" onserverclick="ProcessOrders"  runat="server" value="Process Selected Orders"/>
            </div>     

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

    <script type="text/javascript">
        function jqCheckAll2(id, name) {
            $("INPUT[@name=" + name + "][type='checkbox']").attr('checked', $('#' + id).is(':checked'));
        }
    </script>

    <asp:SqlDataSource ID="SqlDataSource1" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        runat="server" SelectCommand="adm_ThirdPartyOrders_s" 
        SelectCommandType="StoredProcedure" >
        <SelectParameters> 
            <asp:ControlParameter ControlID="StatusDropDownList" 
                DefaultValue="Waiting to be picked" Name="Status" 
                PropertyName="SelectedValue" />
            <asp:Parameter Name="SupplierID" DefaultValue="85" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
