<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" EnableEventValidation="false" CodeFile="PMC.aspx.vb" Inherits="PMC" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

     <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">

		    <div class="align-left"><h3>Personalised Memento Orders</h3></div>
            <div class="align-right"  style="margin-top:-7px; margin-right:-5px">
                <h3>Status:
                <asp:DropDownList ID="StatusDropDownList" runat="server" AutoPostBack="true">
                    <asp:ListItem>Waiting to be printed</asp:ListItem>
                    <asp:ListItem  Selected="True">Waiting to be picked</asp:ListItem>
                    <asp:ListItem>Waiting to be despatched</asp:ListItem>
                    <asp:ListItem>Despatched</asp:ListItem>
                </asp:DropDownList>
                </h3>
            </div>		
            <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div id="exporter" class="content-box-content">

            <div style="width:100%; text-align:left; height:35px; padding:15px 0 10px 0; margin-top:10px">
                <asp:Button ID="btnExportGrid" runat="server" Text="Export to Excel" OnClick="BtnExportGrid_Click" />
            </div>    

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <EmptyDataTemplate>
            Sorry, there are no orders at the moment.
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

            <asp:TemplateField HeaderText="OFFLINE_ACCOUNT_NUMBER">
                <ItemTemplate>NEEDAP</ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OrderID" HeaderText="ORDER_REF" />

            <asp:TemplateField HeaderText="S_PRIORITY"><ItemTemplate>1ST</ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="SHIP_TO_NAME">
                <ItemTemplate><%# Eval("ShipTitle")%> <%# Eval("ShipNameFirst")%> <%# Eval("ShipNameLast")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="S_ADDRESS1" ItemStyle-CssClass="ProperCase">
                <ItemTemplate><%# Eval("Company")%> <%# Eval("StreetLine1")%></ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="StreetLine2" HeaderText="S_ADDRESS2" ConvertEmptyStringToNull="true"/>
            <asp:BoundField DataField="StreetLine3" HeaderText="S_ADDRESS3" ConvertEmptyStringToNull="true"/>
            <asp:BoundField DataField="City" HeaderText="S_ADDRESS4" ConvertEmptyStringToNull="true"/>
            <asp:BoundField DataField="StateProv" HeaderText="S_COUNTY" ItemStyle-CssClass="UpperCase" ConvertEmptyStringToNull="true" />
            <asp:BoundField DataField="CountryName" HeaderText="S_COUNTRY" ItemStyle-CssClass="UpperCase" />
            <asp:BoundField DataField="PostCode" HeaderText="S_POSTCODE" ItemStyle-CssClass="UpperCase"/>
            
            <asp:TemplateField HeaderText="ITEM_CODE">
                <ItemTemplate>
                    <asp:HyperLink ID="pmcLink" runat="server" Target="_blank"
                    NavigateUrl='<%# String.Format("http://www.personalisedmemento.co.uk/browse.php/criteria-{0}", 
                    CheckSKU(Eval("SupplierSKU").ToString, Eval("OptionSKU").ToString)) %>'
                    Text='<%# CheckSKU(Eval("SupplierSKU").ToString, Eval("OptionSKU").ToString)%>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ITEM_NAME">
                <ItemTemplate>
                    <%# Eval("ProductName")%><%# CheckEmptyString(Eval("OptionName"))%> 
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="PERSONALISATION">
                <ItemTemplate>
                <%# GetFields(Eval("ProductID"), Eval("BasketItemID"))%>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="Qty" HeaderText="ITEM_QTY" />

            <asp:TemplateField HeaderText="MESSAGE">
                <ItemTemplate>
                    <%# GenWordDoc(Eval("Message"), Eval("OrderID"))%>
                </ItemTemplate>
            </asp:TemplateField>            

        </Columns>
    </asp:GridView>

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

    <asp:SqlDataSource ID="SqlDataSource1" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        runat="server" SelectCommand="adm_ThirdPartyOrders_s" 
        SelectCommandType="StoredProcedure"  >
        <SelectParameters> 
            <asp:ControlParameter ControlID="StatusDropDownList" 
                DefaultValue="Waiting to be picked" Name="Status" 
                PropertyName="SelectedValue" />
            <asp:Parameter Name="SupplierID" DefaultValue="128" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script type="text/javascript">
	    function jqCheckAll2(id, name) {
		    $("INPUT[@name=" + name + "][type='checkbox']").attr('checked', $('#' + id).is(':checked'));
	    }
    </script>

</asp:Content>
