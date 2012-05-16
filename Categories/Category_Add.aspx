<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" ValidateRequest="false" AutoEventWireup="false" CodeFile="Category_Add.aspx.vb" Inherits="Category_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">

/* error message */
.error {
	height:15px;
	background-color:#FFFE36;
	font-size:11px;
	border:1px solid #E1E16D;
	padding:4px 10px;
	color:#000;
	display:none;	
	
	-moz-border-radius:4px;
	-webkit-border-radius:4px; 
	-moz-border-radius-bottomleft:0;
	-moz-border-radius-topleft:0;	
	-webkit-border-bottom-left-radius:0; 
	-webkit-border-top-left-radius:0;
	
	-moz-box-shadow:0 0 6px #ddd;
	-webkit-box-shadow:0 0 6px #ddd;	
}

.error p {
	margin:0;		
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box" style="height:100%"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Add a New Category</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
        <div class="content-box-content" style="min-height:600px">
            
    <asp:FormView ID="FormView1" runat="server"  RenderOuterTable="False"
     DataKeyNames="ID" DataSourceID="SqlDataSource1"
     OnItemInserted="FormView1_ItemInserted"
     OnItemUpdated="FormView1_ItemUpdated"
     DefaultMode="Insert">
        <InsertItemTemplate>
            <fieldset>
                <div class="row">
                    <label>Category Name:</label>
                    <asp:TextBox ID="NameTextBox" cssclass="text-input medium-input" runat="server" MaxLength="30" required="required" Text='<%# Bind("Name") %>' />
                </div>
                <div class="row">
                    <label>Meta Title:</label>
                    <asp:TextBox ID="MetaTitleTextBox" cssclass="text-input large-input" runat="server" MaxLength="120" required="required" Text='<%# Bind("MetaTitle") %>' />
                </div>
                <div class="row">
                    <label>Meta Description:</label>
                    <asp:TextBox ID="MetaDescriptionTextBox" cssclass="text-input large-input" runat="server" MaxLength="500" required="required" Text='<%# Bind("MetaDescription") %>' />
                </div>
                <div class="row">
                    <label>Meta Keywords:</label>
                    <asp:TextBox ID="MetaKeywordsTextBox" cssclass="text-input large-input" runat="server" MaxLength="500" required="required" Text='<%# Bind("MetaKeywords") %>' />
                </div>
                <div class="row">
                    <label>H1 Page Heading:</label>
                    <asp:TextBox ID="TagLineTextBox" cssclass="text-input large-input" runat="server" MaxLength="50" required="required" Text='<%# Bind("TagLine") %>' />
                </div>
                <div class="row">
                    <label>Page Description:</label><br />
                    <asp:TextBox ID="DescriptionTextBox" TextMode="MultiLine" Rows=7 Columns=50 cssclass="text-input large-input" required="required" runat="server" Text='<%# Bind("Description") %>' />
                </div>
                <div class="row">
                    <label>Page Bottom Text:</label>
                    <asp:TextBox ID="PageBottomDescriptionTextBox" TextMode="MultiLine" Rows=7 Columns=50 cssclass="text-input large-input" runat="server" Text='<%# Bind("PageBottomDescription") %>' />
                </div>
                <div class="row">
                    <label>URL Prefix:</label>
                    <asp:TextBox ID="URLPrefixTextBox" cssclass="text-input medium-input" runat="server" MaxLength="30" required="required" Text='<%# Bind("URLPrefix") %>' /> <small>e.g. birthday-presents</small>
                </div>
                <div class="row">
                    <label>URL:</label>
                    <asp:TextBox ID="RewriteURLTextBox" cssclass="text-input medium-input" runat="server" MaxLength="50" required="required" Text='<%# Bind("RewriteURL") %>' /><small>e.g. 21st-birthday-presents.aspx</small>
                </div>
                <div class="row">
                    <asp:Button ID="InsertButton" CssClass="button" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                </div>

            </fieldset>
        </InsertItemTemplate>

        <EditItemTemplate>
            <fieldset>
                <div class="row">
                    <label>Category Name:</label><asp:TextBox ID="NameTextBox" cssclass="text-input medium-input" runat="server" Text='<%# Bind("Name") %>' />
                </div>
                <div class="row">
                    <label>Meta Title:</label><asp:TextBox ID="MetaTitleTextBox" cssclass="text-input large-input" runat="server" Text='<%# Bind("MetaTitle") %>' />
                </div>
                <div class="row">
                    <label>Meta Description:</label><asp:TextBox ID="MetaDescriptionTextBox" cssclass="text-input large-input" runat="server" Text='<%# Bind("MetaDescription") %>' />
                </div>
                <div class="row">
                    <label>Meta Keywords:</label><asp:TextBox ID="MetaKeywordsTextBox" cssclass="text-input large-input" runat="server" Text='<%# Bind("MetaKeywords") %>' />
                </div>
                <div class="row">
                    <label>H1 Page Heading:</label><asp:TextBox ID="TagLineTextBox" cssclass="text-input large-input" runat="server" Text='<%# Bind("TagLine") %>' />
                </div>
                <div class="row">
                    <label>Page Description:</label><asp:TextBox ID="DescriptionTextBox" TextMode="MultiLine" Rows=7 Columns=50 cssclass="text-input large-input" runat="server" Text='<%# Bind("Description") %>' OnDataBinding="DecodeTextBox_DataBinding" />
                </div>
                <div class="row">
                    <label>Page Bottom Text:</label><asp:TextBox ID="PageBottomDescriptionTextBox" TextMode="MultiLine" Rows=7 Columns=50 cssclass="text-input large-input" runat="server" Text='<%# Bind("PageBottomDescription") %>' OnDataBinding="DecodeTextBox_DataBinding" />
                </div>
                <div class="row">
                    <label>URL Prefix:</label><asp:TextBox ID="URLPrefixTextBox" cssclass="text-input medium-input" runat="server" Text='<%# Bind("URLPrefix") %>' /> <small>e.g. birthday-presents</small>
                </div>
                <div class="row">
                    <label>URL:</label><asp:TextBox ID="RewriteURLTextBox" cssclass="text-input medium-input" runat="server" Text='<%# Bind("RewriteURL") %>' /><small>e.g. 21st-birthday-presents.aspx</small>
                </div>
                <div class="row">
                    <asp:LinkButton ID="UpdateButton" CssClass="button" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                </div>
            </fieldset>
        </EditItemTemplate>

        <FooterTemplate>
        </FooterTemplate>

    </asp:FormView>

</div> <!-- End .content-box-content -->
</div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        InsertCommand="adm_Category_i" InsertCommandType="StoredProcedure" 
        UpdateCommand="adm_Category_u" UpdateCommandType="StoredProcedure" 
        SelectCommand="adm_Category_s" SelectCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="PageBottomDescription" Type="String" />
            <asp:Parameter Name="TagLine" Type="String" />
            <asp:Parameter Name="MetaTitle" Type="String" />
            <asp:Parameter Name="MetaDescription" Type="String" />
            <asp:Parameter Name="MetaKeywords" Type="String" />
            <asp:Parameter Name="URLPrefix" Type="String" />
            <asp:Parameter Name="RewriteURL" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="PageBottomDescription" Type="String" />
            <asp:Parameter Name="TagLine" Type="String" />
            <asp:Parameter Name="MetaTitle" Type="String" />
            <asp:Parameter Name="MetaDescription" Type="String" />
            <asp:Parameter Name="MetaKeywords" Type="String" />
            <asp:Parameter Name="URLPrefix" Type="String" />
            <asp:Parameter Name="RewriteURL" Type="String" />        
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="id" QueryStringField="id" 
                Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>


<script language="javascript" type="text/javascript">
    $("#myForm").validator({
        position: 'top right' ,
        offset: [15, -100]
    });
</script> 

</asp:Content>





