<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" ValidateRequest="false" AutoEventWireup="false" CodeFile="Product_Add.aspx.vb" Inherits="Product_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box" style="height:100%"><!-- Start Content Box -->
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" RenderOuterTable="false"
        DataSourceID="SqlDataSource1" DefaultMode="Insert">

        <InsertItemTemplate>

	    <div class="content-box-header">
		    <h3>Add a New Product</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content" style="min-height:600px">

        <fieldset class="align-left">
            <div style="height:100%">
                <div class="row">
                    <label>Name:</label>
                    <asp:TextBox ID="NameTextBox" cssclass="text-input large-input" runat="server" Text='<%# Bind("Name") %>' />
                </div>
                <div class="row">
                    <label>Price:</label>
                    <asp:TextBox ID="PriceTextBox" runat="server" cssclass="text-input small-input" Text='<%# Bind("Price") %>' />
                </div>
                <div class="row">
                    <label>SalePrice:</label>
                <asp:TextBox ID="SalePriceTextBox" runat="server" cssclass="text-input small-input" Text='<%# Bind("SalePrice") %>' />
                </div>
                <div class="row">
                    <label>Desc Short:</label>
                    <asp:TextBox ID="DescriptionShortTextBox" runat="server" cssclass="text-input large-input" Text='<%# Bind("DescriptionShort") %>' />
                </div>
                <div class="row">
                    <label>Desc Med:</label>
                    <asp:TextBox ID="DescriptionMediumTextBox" runat="server" cssclass="text-input large-input" Text='<%# Bind("DescriptionMedium") %>' />
                  </div>
                <div class="row">
                    <label>Desc Long:</label>
                    <asp:TextBox ID="DescriptionLongTextBox" TextMode=MultiLine Height="200px" runat="server" cssclass="text-input textarea" Text='<%# Bind("DescriptionLong") %>' />
                </div>
                <div class="row">
                    <label>MetaTitle:</label>
                    <asp:TextBox ID="MetaTitleTextBox" runat="server" cssclass="text-input large-input" Text='<%# Bind("MetaTitle") %>' />
                </div>
                <div class="row">
                    <label>MetaDescription:</label>
                    <asp:TextBox ID="MetaDescriptionTextBox" runat="server" cssclass="text-input large-input" Text='<%# Bind("MetaDescription") %>' />
                </div>
                <div class="row">
                    <label>MetaKeywords:</label>
                    <asp:TextBox ID="MetaKeywordsTextBox" runat="server" cssclass="text-input large-input" Text='<%# Bind("MetaKeywords") %>' />
                 </div>
                <div class="row">
                    <label>RewriteURL:</label>
                    <asp:TextBox ID="RewriteURLTextBox" runat="server" cssclass="text-input medium-input" Text='<%# Bind("RewriteURL") %>' />  
                </div>
                <div class="row">
                    <label>ImageFileName:</label>
                    <asp:TextBox ID="ImageFileNameTextBox" runat="server" cssclass="text-input medium-input" Text='<%# Bind("ImageFileName") %>' />
                </div>
            </div>
       </fieldset>

       <fieldset class="align-left">
            <div class="row">
                <label>Cost:</label>
               <asp:TextBox ID="CostTextBox" runat="server" cssclass="text-input small-input" Text='<%# Bind("Cost") %>' />
            </div>
            <div class="row">
                <label>SupplierID:</label>
                <asp:TextBox ID="SupplierIDTextBox" runat="server" cssclass="text-input small-input" Text='<%# Bind("SupplierID") %>' />
            </div>
            <div class="row">
                <label>SupplierSKU:</label>
                <asp:TextBox ID="SupplierSKUTextBox" runat="server" cssclass="text-input small-input"  Text='<%# Bind("SupplierSKU") %>' />
            </div>
            <div class="row">
                <label>HasVariants:</label>
                <asp:CheckBox ID="HasVariantsCheckBox" runat="server" Checked='<%# Bind("HasVariants") %>' />
            </div>
            <div class="row">
                <label>IsPersonalised:</label>
                <asp:CheckBox ID="IsPersonalisedCheckBox" runat="server" Checked='<%# Bind("IsPersonalised") %>' />
            </div>
            <div class="row">
                <label>IsExpress:</label>
                <asp:CheckBox ID="IsExpressCheckBox" runat="server" Checked='<%# Bind("IsExpress") %>' />
            </div>
            <div class="row">
                <label>IsWrappable:</label>
                <asp:CheckBox ID="IsWrappableCheckBox" runat="server" Checked='<%# Bind("IsWrappable") %>' />
            </div>
            <div class="row">
                <label>ShipSeparately:</label>
                <asp:CheckBox ID="ShipSeparatelyCheckBox" runat="server" Checked='<%# Bind("ShipSeparately") %>' />
            </div>
            <div class="row">
                <label>WeightGM:</label>
                <asp:TextBox ID="WeightGMTextBox" runat="server" cssclass="text-input small-input" Text='<%# Bind("WeightGM") %>' />
            </div>
            <div class="row">
                <label>Active:</label>
                <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
            </div>
            </fieldset>
            
        </InsertItemTemplate>
        <FooterTemplate>
        <div class="clear"></div>

        <asp:LinkButton ID="InsertButton" CssClass="button" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
        </FooterTemplate>
    </asp:FormView>

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        InsertCommand="adm_Products_i" InsertCommandType="StoredProcedure" 
        SelectCommand="adm_Products_s" SelectCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="SalePrice" Type="Decimal" />
            <asp:Parameter Name="Cost" Type="Decimal" />
            <asp:Parameter Name="SupplierID" Type="Int16" />
            <asp:Parameter Name="SupplierSKU" Type="String" />
            <asp:Parameter Name="HasVariants" Type="Boolean" />
            <asp:Parameter Name="IsPersonalised" Type="Boolean" />
            <asp:Parameter Name="IsExpress" Type="Boolean" />
            <asp:Parameter Name="IsWrappable" Type="Boolean" />
            <asp:Parameter Name="ShipSeparately" Type="Boolean" />
            <asp:Parameter Name="WeightGM" Type="Int16" />
            <asp:Parameter Name="DescriptionShort" Type="String" />
            <asp:Parameter Name="DescriptionMedium" Type="String" />
            <asp:Parameter Name="DescriptionLong" Type="String" />
            <asp:Parameter Name="MetaTitle" Type="String" />
            <asp:Parameter Name="MetaDescription" Type="String" />
            <asp:Parameter Name="MetaKeywords" Type="String" />
            <asp:Parameter Name="RewriteURL" Type="String" />
            <asp:Parameter Name="ImageFileName" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="pid" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>





