<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Order_Detail.aspx.vb" Inherits="Orders_Order_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="OrderID" 
        RenderOuterTable="False"   DataSourceID="SqlDataSource1">
        <EditItemTemplate>

    <fieldset class="align-left">
    
            <div class="row">
                <label>Name:</label>
                <asp:TextBox ID="BillTitleTextBox" runat="server" Text='<%# Bind("BillTitle") %>' />
            </div>
            <div class="row">
                <label>BillCompany:</label>
                <asp:TextBox ID="BillNameFirstTextBox" runat="server" Text='<%# Bind("BillNameFirst") %>' MaxLength="15" />
            </div>
            <div class="row">
                <label>BillCompany:</label>
                <asp:TextBox ID="BillNameLastTextBox" runat="server" Text='<%# Bind("BillNameLast") %>' maxlength="20"/>
            </div>
            <div class="row">
                <label>BillCompany:</label>
            <asp:TextBox ID="BillCompanyTextBox" runat="server" 
                Text='<%# Bind("BillCompany") %>' />
            </div>
            <div class="row">
                <label>BillLine1:</label>
            <asp:TextBox ID="BillLine1TextBox" runat="server" 
                Text='<%# Bind("BillLine1") %>' />
            </div>
            <div class="row">
                <label>BillLine2:</label>
            <asp:TextBox ID="BillLine2TextBox" runat="server" 
                Text='<%# Bind("BillLine2") %>' />
            </div>
            <div class="row">
                <label>
            BillLine3:</label>
            <asp:TextBox ID="BillLine3TextBox" runat="server" 
                Text='<%# Bind("BillLine3") %>' />
            </div>
            <div class="row">
                <label>
            BillCity:</label>
            <asp:TextBox ID="BillCityTextBox" runat="server" 
                Text='<%# Bind("BillCity") %>' />
            </div>
            <div class="row">
                <label>
            BillState:</label>
            <asp:TextBox ID="BillStateTextBox" runat="server" 
                Text='<%# Bind("BillState") %>' />
            </div>
            <div class="row">
                <label>
            BillPostcode:</label>
            <asp:TextBox ID="BillPostcodeTextBox" runat="server" 
                Text='<%# Bind("BillPostcode") %>' />
            </div>
            <div class="row"><label>
            BillCountry:</label>
            <asp:TextBox ID="BillCountryTextBox" runat="server" 
                Text='<%# Bind("BillCountry") %>' />


            </fieldset>



    <fieldset class="align-left">
            <div class="row"><label>ShipTitle:</label>
            <asp:TextBox ID="ShipTitleTextBox" runat="server" Text='<%# Bind("ShipTitle") %>' />
            </div>
            <div class="row"><label>ShipNameFirst:</label>
            <asp:TextBox ID="ShipNameFirstTextBox" runat="server" Text='<%# Bind("ShipNameFirst") %>' />
            </div>
            <div class="row"><label>ShipNameLast:</label>
            <asp:TextBox ID="ShipNameLastTextBox" runat="server" Text='<%# Bind("ShipNameLast") %>' />
            </div>
            <div class="row"><label>ShipCompany:</label>
            <asp:TextBox ID="ShipCompanyTextBox" runat="server" Text='<%# Bind("ShipCompany") %>' />
            </div>
            <div class="row"><label>ShipLine1:</label>
            <asp:TextBox ID="ShipLine1TextBox" runat="server" Text='<%# Bind("ShipLine1") %>' />
            </div>
            <div class="row"><label>ShipLine2:</label>
            <asp:TextBox ID="ShipLine2TextBox" runat="server" Text='<%# Bind("ShipLine2") %>' />
            </div>
            <div class="row"><label>ShipLine3:</label>
            <asp:TextBox ID="ShipLine3TextBox" runat="server" Text='<%# Bind("ShipLine3") %>' />
            </div>
            <div class="row"><label>ShipCity:</label>
            <asp:TextBox ID="ShipCityTextBox" runat="server" Text='<%# Bind("ShipCity") %>' />
            </div>
            <div class="row"><label>ShipState:</label>
            <asp:TextBox ID="ShipStateTextBox" runat="server" Text='<%# Bind("ShipState") %>' />
            </div>
            <div class="row"><label>ShipPostcode:</label>
            <asp:TextBox ID="ShipPostcodeTextBox" runat="server" Text='<%# Bind("ShipPostcode") %>' />
            </div>
            <div class="row"><label>ShipCountry:</label>
            <asp:TextBox ID="ShipCountryTextBox" runat="server" Text='<%# Bind("ShipCountry") %>' />
 </fieldset>

     <fieldset class="align-left">
            Message:
            <asp:TextBox ID="MessageTextBox" runat="server" Text='<%# Bind("Message") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />     
     </fieldset>



        </EditItemTemplate>

        <ItemTemplate>
            OrderID:
            <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
            <br />
            CustomerID:
            <asp:Label ID="CustomerIDLabel" runat="server" 
                Text='<%# Bind("CustomerID") %>' />
            <br />
            BillingID:
            <asp:Label ID="BillingIDLabel" runat="server" Text='<%# Bind("BillingID") %>' />
            <br />
            ShippingID:
            <asp:Label ID="ShippingIDLabel" runat="server" 
                Text='<%# Bind("ShippingID") %>' />
            <br />
            Status:
            <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
            <br />
            WP_LastEvent:
            <asp:Label ID="WP_LastEventLabel" runat="server" 
                Text='<%# Bind("WP_LastEvent") %>' />
            <br />
            SubTotal:
            <asp:Label ID="SubTotalLabel" runat="server" Text='<%# Bind("SubTotal") %>' />
            <br />
            ShipCharge:
            <asp:Label ID="ShipChargeLabel" runat="server" 
                Text='<%# Bind("ShipCharge") %>' />
            <br />
            ShipMethodID:
            <asp:Label ID="ShipMethodIDLabel" runat="server" 
                Text='<%# Bind("ShipMethodID") %>' />
            <br />
            ShipMethod:
            <asp:Label ID="ShipMethodLabel" runat="server" 
                Text='<%# Bind("ShipMethod") %>' />
            <br />
            IsSurprise:
            <asp:CheckBox ID="IsSurpriseCheckBox" runat="server" 
                Checked='<%# Bind("IsSurprise") %>' Enabled="false" />
            <br />
            CampaignID:
            <asp:Label ID="CampaignIDLabel" runat="server" 
                Text='<%# Bind("CampaignID") %>' />
            <br />
            VoucherCode:
            <asp:Label ID="VoucherCodeLabel" runat="server" 
                Text='<%# Bind("VoucherCode") %>' />
            <br />
            VoucherCodeID:
            <asp:Label ID="VoucherCodeIDLabel" runat="server" 
                Text='<%# Bind("VoucherCodeID") %>' />
            <br />
            VoucherCodeAmount:
            <asp:Label ID="VoucherCodeAmountLabel" runat="server" 
                Text='<%# Bind("VoucherCodeAmount") %>' />
            <br />
            ClickID:
            <asp:Label ID="ClickIDLabel" runat="server" Text='<%# Bind("ClickID") %>' />
            <br />
            AffiliateID:
            <asp:Label ID="AffiliateIDLabel" runat="server" 
                Text='<%# Bind("AffiliateID") %>' />
            <br />
            DateCreated:
            <asp:Label ID="DateCreatedLabel" runat="server" 
                Text='<%# Bind("DateCreated") %>' />
            <br />
            DatePrinted:
            <asp:Label ID="DatePrintedLabel" runat="server" 
                Text='<%# Bind("DatePrinted") %>' />
            <br />
            DateShipped:
            <asp:Label ID="DateShippedLabel" runat="server" 
                Text='<%# Bind("DateShipped") %>' />
            <br />
            BillTitle:
            <asp:Label ID="BillTitleLabel" runat="server" Text='<%# Bind("BillTitle") %>' />
            <br />
            BillNameFirst:
            <asp:Label ID="BillNameFirstLabel" runat="server" 
                Text='<%# Bind("BillNameFirst") %>' />
            <br />
            BillNameLast:
            <asp:Label ID="BillNameLastLabel" runat="server" 
                Text='<%# Bind("BillNameLast") %>' />
            <br />
            BillCompany:
            <asp:Label ID="BillCompanyLabel" runat="server" 
                Text='<%# Bind("BillCompany") %>' />
            <br />
            BillLine1:
            <asp:Label ID="BillLine1Label" runat="server" Text='<%# Bind("BillLine1") %>' />
            <br />
            BillLine2:
            <asp:Label ID="BillLine2Label" runat="server" Text='<%# Bind("BillLine2") %>' />
            <br />
            BillLine3:
            <asp:Label ID="BillLine3Label" runat="server" Text='<%# Bind("BillLine3") %>' />
            <br />
            BillCity:
            <asp:Label ID="BillCityLabel" runat="server" Text='<%# Bind("BillCity") %>' />
            <br />
            BillState:
            <asp:Label ID="BillStateLabel" runat="server" Text='<%# Bind("BillState") %>' />
            <br />
            BillPostcode:
            <asp:Label ID="BillPostcodeLabel" runat="server" 
                Text='<%# Bind("BillPostcode") %>' />
            <br />
            BillCountry:
            <asp:Label ID="BillCountryLabel" runat="server" 
                Text='<%# Bind("BillCountry") %>' />
            <br />
            ShipTitle:
            <asp:Label ID="ShipTitleLabel" runat="server" Text='<%# Bind("ShipTitle") %>' />
            <br />
            ShipNameFirst:
            <asp:Label ID="ShipNameFirstLabel" runat="server" 
                Text='<%# Bind("ShipNameFirst") %>' />
            <br />
            ShipNameLast:
            <asp:Label ID="ShipNameLastLabel" runat="server" 
                Text='<%# Bind("ShipNameLast") %>' />
            <br />
            ShipCompany:
            <asp:Label ID="ShipCompanyLabel" runat="server" 
                Text='<%# Bind("ShipCompany") %>' />
            <br />
            ShipLine1:
            <asp:Label ID="ShipLine1Label" runat="server" Text='<%# Bind("ShipLine1") %>' />
            <br />
            ShipLine2:
            <asp:Label ID="ShipLine2Label" runat="server" Text='<%# Bind("ShipLine2") %>' />
            <br />
            ShipLine3:
            <asp:Label ID="ShipLine3Label" runat="server" Text='<%# Bind("ShipLine3") %>' />
            <br />
            ShipCity:
            <asp:Label ID="ShipCityLabel" runat="server" Text='<%# Bind("ShipCity") %>' />
            <br />
            ShipState:
            <asp:Label ID="ShipStateLabel" runat="server" Text='<%# Bind("ShipState") %>' />
            <br />
            ShipPostcode:
            <asp:Label ID="ShipPostcodeLabel" runat="server" 
                Text='<%# Bind("ShipPostcode") %>' />
            <br />
            ShipCountry:
            <asp:Label ID="ShipCountryLabel" runat="server" 
                Text='<%# Bind("ShipCountry") %>' />
            <br />
            Message:
            <asp:Label ID="MessageLabel" runat="server" Text='<%# Bind("Message") %>' />
            <br />


             <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"   
                   CommandName="Edit" Text="Edit" /> 

        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        SelectCommand="SELECT * FROM [vw_Orders] WHERE ([OrderID] = @OrderID)" UpdateCommand="Update BillTitle, BillNameFirst, BillNameLast, BillCompany, BillLine1, BillLine2, BillLine3, BillCity, BillState, BillPostcode, BillCountry, ShipTitle, ShipNameFirst, ShipNameLast, ShipCompany, ShipLine1, ShipLine2, ShipLine3, ShipCity, ShipState, ShipPostcode, ShipCountry, Message FROM vw_Orders
WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="OrderID" QueryStringField="oid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OrderID" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

