<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master"  EnableViewState="true"  AutoEventWireup="false" CodeFile="Product_Choices.aspx.vb" Inherits="Product_Choices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

        <ul class="shortcut-buttons-set">
	        <li><a class="shortcut-button" href="Product_Edit.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/paper_content_pencil_48.png" width=48 height=48 alt="icon" /><br />Description</span></a></li>
	        <li><a class="shortcut-button" href="Product_Category.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/navigate_48.png" width=48 height=48 alt="icon" /><br />Categories</span></a></li>
            <li><a class="shortcut-button" href="Product_POZones.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/globe_48.png" width=48 height=48 alt="icon" /><br />PO Zones</span></a></li>
	        <li><a class="shortcut-button selected" href="Product_Choices.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/mouse_48.png" width=48 height=48 alt="icon" /><br />Choices</span></a></li>
	        <li><a class="shortcut-button" href="Product_Fields.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/app_48.png" width=48 height=48 alt="icon" /><br />Fields</span></a></li>
	        <li><a class="shortcut-button" href="Product_Images.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/image_48.png" width=48 height=48 alt="icon" /><br />Images</span></a></li>
        </ul>
        <div class="clear"></div>

        <div class="content-box"><!-- Start Content Box -->
	        <div class="content-box-header">
		        <h3>Edit Choices: <asp:Literal runat="server" ID="litProductName"></asp:Literal></h3>
		        <div class="clear"></div>
	        </div> <!-- End .content-box-header -->
	        <div class="content-box-content">

                <fieldset class="align-left">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID" DataSourceID="ObjectDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="LabelText" HeaderText="LabelText"/>
                        <asp:BoundField DataField="DisplayType" HeaderText="Type"/>
                        <asp:BoundField DataField="DisplayOrder" HeaderText="Order"/>
                        <asp:CheckBoxField DataField="Validate" HeaderText="Validate"/>
                        <asp:CheckBoxField DataField="Active" HeaderText="Active"/>
                        <asp:CommandField ShowSelectButton="True" SelectImageUrl="~/resources/images/icons/magnifier.png" ButtonType=Image />
                    </Columns>
                </asp:GridView>

                </fieldset>


                <fieldset class="align-left" style="margin-left:60px">
                
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ID" DataSourceID="ObjectDataSource2" ShowFooter="True" >
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"/>
                            <asp:BoundField DataField="ChoiceID" HeaderText="ChoiceID" InsertVisible="true" ReadOnly="True"/>
                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                </InsertItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SKU">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxSKU" runat="server" Text='<%# Bind("SupplierSKU") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelSKU" runat="server" Text='<%# Bind("SupplierSKU") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                </InsertItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Order" SortExpression="DisplayOrder">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DisplayOrder") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DisplayOrder") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' 
                                        Enabled="false" />
                                </ItemTemplate>
                                <InsertItemTemplate>
                                </InsertItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ButtonType="Image"
                                ShowEditButton="true" 
                                EditImageUrl="~/resources/images/icons/pencil.png" EditText="Edit" 
                                UpdateImageUrl="~/resources/images/icons/disk.png" UpdateText="Update" 
                                CancelImageUrl="~/resources/images/icons/stop.png" CancelText="Cancel" 
                                InsertText="" InsertVisible="False" ShowInsertButton="True" />
                        </Columns>

                    </asp:GridView> 
                
                </fieldset>

                <div class="clear"></div>

	        </div> <!-- End .content-box-content -->
        </div> <!-- End .content-box -->
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="{0}" 
        SelectMethod="GetChoicesByProductID" 
        TypeName="NAPDataSetTableAdapters.ChoicesTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="Int16" />
            <asp:Parameter Name="LabelText" Type="String" />
            <asp:Parameter Name="DisplayType" Type="String" />
            <asp:Parameter Name="DisplayOrder" Type="Byte" />
            <asp:Parameter Name="ErrorMessage" Type="String" />
            <asp:Parameter Name="Validate" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="pid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="ProductID" Type="Int16" />
            <asp:Parameter Name="LabelText" Type="String" />
            <asp:Parameter Name="DisplayType" Type="String" />
            <asp:Parameter Name="DisplayOrder" Type="Byte" />
            <asp:Parameter Name="ErrorMessage" Type="String" />
            <asp:Parameter Name="Validate" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="{0}" 
        SelectMethod="GetOptionsByChoiceID" 
        TypeName="NAPDataSetTableAdapters.ChoiceOptionsTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ChoiceID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="DisplayOrder" Type="Byte" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="SupplierSKU" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ChoiceID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="DisplayOrder" Type="Byte" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="SupplierSKU" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>

</asp:Content>

