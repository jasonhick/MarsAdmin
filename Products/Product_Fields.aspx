<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master"  EnableViewState="true"  AutoEventWireup="false" CodeFile="Product_Fields.aspx.vb" Inherits="Product_Fields" %>
<%@ Register Assembly="Html5Asp" Namespace="Html5Asp" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

        <ul class="shortcut-buttons-set">
	        <li><a class="shortcut-button" href="Product_Edit.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/paper_content_pencil_48.png" width=48 height=48 alt="icon" /><br />Description</span></a></li>
	        <li><a class="shortcut-button" href="Product_Category.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/navigate_48.png" width=48 height=48 alt="icon" /><br />Categories</span></a></li>
            <li><a class="shortcut-button" href="Product_POZones.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/globe_48.png" width=48 height=48 alt="icon" /><br />PO Zones</span></a></li>
	        <li><a class="shortcut-button" href="Product_Choices.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/mouse_48.png" width=48 height=48 alt="icon" /><br />Choices</span></a></li>
	        <li><a class="shortcut-button selected" href="Product_Fields.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/app_48.png" width=48 height=48 alt="icon" /><br />Fields</span></a></li>
	        <li><a class="shortcut-button" href="Product_Images.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/image_48.png" width=48 height=48 alt="icon" /><br />Images</span></a></li>
        </ul>
        <div class="clear"></div>

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Edit Personalised Fields: <asp:Literal runat="server" ID="litProductName"></asp:Literal></h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content" style="height:360px">


        <fieldset class="align-left">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID" DataSourceID="ObjectDataSource1">
                <EmptyDataTemplate>
                    <h3>There are no personalised fields for this product.</h3>
                </EmptyDataTemplate>
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID"/>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Type" HeaderText="Type" />
                    <asp:BoundField DataField="MaxLength" HeaderText="MaxLength" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Label" HeaderText="Label" />
                    <asp:CheckBoxField DataField="Validate" HeaderText="Validate"  ItemStyle-CssClass="text-center" />
                    <asp:CheckBoxField DataField="Active" HeaderText="Active"  ItemStyle-CssClass="text-center" />
                </Columns>
            </asp:GridView>
        </fieldset>

        <fieldset class="align-left" style="width:320px; margin-left:60px">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="FieldViewDataSource" DefaultMode="ReadOnly">

        <EditItemTemplate>
            <div class="row-alt"><label class="alt">ID:</label><asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>'/></div>
            <div class="row"><label>ProductID:</label><asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>'  cssclass="text-input small-input"/></div>
            <div class="row"><label>Name:</label><asp:TextBox ID="NameTextBox" runat="server" MaxLength="20" Text='<%# Bind("Name") %>'  cssclass="text-input medium-input"/></div>
            <div class="row"><label>Type:</label><asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>'  cssclass="text-input small-input"/></div>
            <div class="row"><label>MaxLength:</label><asp:TextBox ID="MaxLengthTextBox" runat="server" Text='<%# Bind("MaxLength") %>'  cssclass="text-input small-input"/></div>
            <div class="row-alt"><label>Validate:</label><asp:CheckBox ID="ValidateCheckBox" runat="server" Checked='<%# Bind("Validate") %>'/></div>
            <div class="row"><label>ErrorMessage:</label><asp:TextBox ID="ErrorMessageTextBox"  MaxLength="30" runat="server" Text='<%# Bind("ErrorMessage") %>'  cssclass="text-input medium-input"/></div>
            <div class="row"><label>Label:</label><asp:TextBox ID="LabelTextBox" runat="server"  MaxLength="30" Text='<%# Bind("Label") %>'  cssclass="text-input medium-input"/></div>
            <div class="row-alt"><label>Active:</label><asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>'/></div>
            <div class="row"><label>DefaultValue:</label><asp:TextBox ID="DefaultValueTextBox" runat="server" Text='<%# Bind("DefaultValue") %>'  cssclass="text-input medium-input"/></div>
            <div class="row">
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />&nbsp;
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </div>
        </EditItemTemplate>

        <InsertItemTemplate>
            <div class="row"><label>ProductID:</label><asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' cssclass="text-input small-input"/></div>
            <div class="row"><label>Name:</label><asp:TextBox ID="NameTextBox" runat="server" MaxLength="20" Text='<%# Bind("Name") %>'  cssclass="text-input small-input"/></div>
            <div class="row"><label>Type:</label><asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>'  cssclass="text-input small-input"/></div>
            <div class="row"><label>MaxLength:</label><asp:TextBox ID="MaxLengthTextBox" runat="server" Text='<%# Bind("MaxLength") %>'  cssclass="text-input small-input"/></div>
            <div class="row-alt"><label>Validate:</label><asp:CheckBox ID="ValidateCheckBox" runat="server" Checked='<%# Bind("Validate") %>'  cssclass="text-input small-input"/></div>
            <div class="row"><label>ErrorMessage:</label><asp:TextBox ID="ErrorMessageTextBox" MaxLength="30" runat="server" Text='<%# Bind("ErrorMessage") %>'  cssclass="text-input small-input"/></div>
            <div class="row"><label>Label:</label><asp:TextBox ID="LabelTextBox" runat="server"  MaxLength="30" Text='<%# Bind("Label") %>'  cssclass="text-input small-input"/></div>
            <div class="row-alt"><label>Active:</label><asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>'  cssclass="text-input small-input"/></div>
            <div class="row"><label>DefaultValue:</label><asp:TextBox ID="DefaultValueTextBox" runat="server" Text='<%# Bind("DefaultValue") %>'  cssclass="text-input small-input"/></div>
            <div class="row">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />  
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </div>
        </InsertItemTemplate>
        
        <ItemTemplate>
            <div class="row-alt"><label>ID:</label><asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' Enabled=false  cssclass="text-input small-input"/></div>
            <div class="row"><label>ProductID:</label><asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' Enabled=false cssclass="text-input small-input"/></div>
            <div class="row"><label>Name:</label><asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' Enabled=false cssclass="text-input medium-input"/></div>
            <div class="row"><label>Type:</label><asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' Enabled=false cssclass="text-input small-input"/></div>
            <div class="row"><label>MaxLength:</label><asp:TextBox ID="MaxLengthTextBox" runat="server" Text='<%# Bind("MaxLength") %>' Enabled=false cssclass="text-input small-input"/></div>
            <div class="row-alt"><label>Validate:</label><asp:CheckBox ID="ValidateCheckBox" runat="server" Checked='<%# Bind("Validate") %>' Enabled=false/></div>
            <div class="row"><label>ErrorMessage:</label><asp:TextBox ID="ErrorMessageTextBox" runat="server" Text='<%# Bind("ErrorMessage") %>' Enabled=false cssclass="text-input medium-input"/></div>
            <div class="row"><label>Label:</label><asp:TextBox ID="LabelTextBox" runat="server" Text='<%# Bind("Label") %>' Enabled=false cssclass="text-input medium-input"/></div>
            <div class="row-alt"><label>Active:</label><asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' Enabled=false cssclass="text-input"/></div>
            <div class="row"><label>DefaultValue:</label><asp:TextBox ID="DefaultValueTextBox" runat="server" Text='<%# Bind("DefaultValue") %>' Enabled=false cssclass="text-input medium-input"/></div>
            <div class="row">
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </div>
        </ItemTemplate>

    </asp:FormView>
            
            </fieldset>

	    </div>
    </div>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="{0}" SelectMethod="GetFieldsByProduct" 
        TypeName="NAPDataSetTableAdapters.FieldsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="pid" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="FieldViewDataSource" runat="server" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="{0}" SelectMethod="GetSingleField" 
        TypeName="NAPDataSetTableAdapters.FieldsTableAdapter" UpdateMethod="Update">
        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="Int16" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="MaxLength" Type="Int16" />
            <asp:Parameter Name="Validate" Type="Boolean" />
            <asp:Parameter Name="ErrorMessage" Type="String" />
            <asp:Parameter Name="Label" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="DefaultValue" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="ProductID" Type="Int16" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="MaxLength" Type="Int16" />
            <asp:Parameter Name="Validate" Type="Boolean" />
            <asp:Parameter Name="ErrorMessage" Type="String" />
            <asp:Parameter Name="Label" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="DefaultValue" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>


</asp:Content>

