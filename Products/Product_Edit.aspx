<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" Debug="true" ValidateRequest="false" AutoEventWireup="false" CodeFile="Product_Edit.aspx.vb" Inherits="Product_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    
    <asp:FormView ID="FormView1" runat="server" RenderOuterTable="false"
    DataSourceID="SqlDataSource1" DefaultMode="Edit" DataKeyNames="ID" >

    <HeaderTemplate>

        <ul class="shortcut-buttons-set">
	        <li><a class="shortcut-button selected" href="Product_Edit.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/paper_content_pencil_48.png" width=48 height=48 alt="icon" /><br />Description</span></a></li>
	        <li><a class="shortcut-button" href="Product_Category.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/navigate_48.png" width=48 height=48 alt="icon" /><br />Categories</span></a></li>
            <li><a class="shortcut-button" href="Product_POZones.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/globe_48.png" width=48 height=48 alt="icon" /><br />PO Zones</span></a></li>
	        <li><a class="shortcut-button" href="Product_Choices.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/mouse_48.png" width=48 height=48 alt="icon" /><br />Choices</span></a></li>
	        <li><a class="shortcut-button" href="Product_Fields.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/app_48.png" width=48 height=48 alt="icon" /><br />Fields</span></a></li>
	        <li><a class="shortcut-button" href="Product_Images.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/image_48.png" width=48 height=48 alt="icon" /><br />Images</span></a></li>
        </ul>
        <div class="clear"></div>
        <div class="content-box" style="height:100%"><!-- Start Content Box -->    
	    <div class="content-box-header">
		    <h3>Edit Product: <%# Eval("Name") %></h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
    
    </HeaderTemplate>

        <EditItemTemplate>

	    <div class="content-box-content" style="min-height:600px">
       
        <fieldset class="align-left">
            <div style="height:100%">
            <div class="row">
                <label>Name:</label>
                <asp:TextBox ID="NameTextBox" cssclass="text-input medium-input" runat="server" required="required" Text='<%# Bind("Name") %>'  OnDataBinding="DecodeTextBox_DataBinding"/>
            </div>
            <div class="row">
                <label>Price:</label>
                <asp:TextBox ID="PriceTextBox" runat="server" cssclass="text-input small-input" required="required"  Text='<%# Bind("Price") %>' />
            </div>
            <div class="row">
                <label>SalePrice:</label>
            <asp:TextBox ID="SalePriceTextBox" runat="server" cssclass="text-input small-input" Text='<%# Bind("SalePrice") %>' />
            </div>
            <div class="row">
                <label>Desc Short:</label>
                <asp:TextBox ID="DescriptionShortTextBox" runat="server" cssclass="text-input medium-input" required="required" Text='<%# Bind("DescriptionShort") %>' OnDataBinding="DecodeTextBox_DataBinding" />
            </div>
            <div class="row">
                <label>Desc Med:</label>
                <asp:TextBox ID="DescriptionMediumTextBox" runat="server" cssclass="text-input medium-input" required="required" Text='<%# Bind("DescriptionMedium") %>'  OnDataBinding="DecodeTextBox_DataBinding"/>
              </div>
            <div class="row">
                <label>Desc Long:</label>
                <asp:TextBox ID="DescriptionLongTextBox" TextMode=MultiLine Height="200px" runat="server" required="required" cssclass="text-input textarea" Text='<%# Bind("DescriptionLong") %>' OnDataBinding="DecodeTextBox_DataBinding" />
            </div>
            <div class="row">
                <label>MetaTitle:</label>
                <asp:TextBox ID="MetaTitleTextBox" runat="server" cssclass="text-input medium-input" Text='<%# Bind("MetaTitle") %>'  OnDataBinding="DecodeTextBox_DataBinding"/>
            </div>
            <div class="row">
                <label>MetaDescription:</label>
                <asp:TextBox ID="MetaDescriptionTextBox" runat="server" cssclass="text-input medium-input" Text='<%# Bind("MetaDescription") %>' OnDataBinding="DecodeTextBox_DataBinding" />
            </div>
            <div class="row">
                <label>MetaKeywords:</label>
                <asp:TextBox ID="MetaKeywordsTextBox" runat="server" cssclass="text-input medium-input" Text='<%# Bind("MetaKeywords") %>'  OnDataBinding="DecodeTextBox_DataBinding"/>
             </div>
            <div class="row">
                <label>RewriteURL:</label>
                <asp:TextBox ID="RewriteURLTextBox" runat="server" cssclass="text-input medium-input" Text='<%# Bind("RewriteURL") %>' />  
            </div>
            <div class="row">
                <label>ImageFileName:</label>
                <asp:TextBox ID="ImageFileNameTextBox" runat="server" cssclass="text-input medium-input" Text='<%# Bind("ImageFileName") %>' />
            </div>
            </Div>
       </fieldset>


       <fieldset class="align-left">
            <div class="row">
                <label>Cost:</label>
               <asp:TextBox ID="CostTextBox" runat="server" cssclass="text-input small-input" Text='<%# Bind("Cost") %>' />
            </div>
            <div class="row">
                <label>SupplierID:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SupplierDataSource" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("SupplierID")%>'>
                </asp:DropDownList>
                
            </div>
            <div class="row">
                <label>SupplierSKU:</label>
                <asp:TextBox ID="SupplierSKUTextBox" runat="server" cssclass="text-input small-input" MaxLength="40"  Text='<%# Bind("SupplierSKU") %>' />
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

            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" ClientIDMode="Static" Text="Update" />

            </fieldset>

        </EditItemTemplate>
    </asp:FormView>

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

    <asp:SqlDataSource ID="SupplierDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        SelectCommand="adm_SuppliersAll_s" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>"  
        UpdateCommand="adm_Products_u" UpdateCommandType="StoredProcedure"
        SelectCommand="adm_Products_s" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="pid" Type="Int16" />
        </SelectParameters>
        <UpdateParameters>            
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
            <asp:Parameter Name="ID" Type="Int16" />
        </UpdateParameters>
    </asp:SqlDataSource>

<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        $("#MyForm").validator({
            onsubmit: false
        });

        $("#UpdateButton").click(function (evt) {
            // Validate the form and retain the result.
            var isValid = $("#MyForm").validator();

            // If the form didn't validate, prevent the
            //  form submission.
            if (!isValid)
                evt.preventDefault();
        });
    });
</script> 

</asp:Content>

