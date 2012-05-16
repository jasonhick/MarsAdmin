<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Customer_Edit.aspx.vb" Inherits="Customer_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box column3-left">
	    <div class="content-box-header">
		    <h3>Customer Detail</h3>
		    <div class="clear"></div>
	    </div>
	    <div class="content-box-content">
            <fieldset class="align-left">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID"   
                    DataSourceID="ObjectDataSource1" DefaultMode="ReadOnly">
                    <EditItemTemplate>
                        <div class="row"><label>ID:</label><asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' /></div>
                        <div class="row"><label>Email:</label><asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' cssclass="text-input small-input"/></div>
                        <div class="row"><label>Password:</label><asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' cssclass="text-input small-input"/></div>
                        <div class="row"><label>IsSubscribed:</label><asp:CheckBox ID="IsSubscribedCheckBox" runat="server" Checked='<%# Bind("IsSubscribed") %>' /></div>
                        <div class="row"><label>IsLocked:</label><asp:CheckBox ID="IsLockedCheckBox" runat="server" Checked='<%# Bind("IsLocked") %>' /></div>
                        <div class="row"><label>FailedLoginCount:</label><asp:TextBox ID="FailedLoginCountTextBox" runat="server" Text='<%# Bind("FailedLoginCount") %>'  cssclass="text-input small-input"/></div>
                        <div class="row"><label>LastLoginDate:</label><asp:TextBox ID="LastLoginDateTextBox" runat="server" Text='<%# Bind("LastLoginDate") %>' cssclass="text-input small-input"/></div>
                        <div class="row"><label>DateCreated:</label><asp:TextBox ID="DateCreatedTextBox" runat="server" Text='<%# Bind("DateCreated") %>' cssclass="text-input small-input"/></div>
                        <div class="row"><label>IPAddress:</label><asp:TextBox ID="IPAddressTextBox" runat="server" Text='<%# Bind("IPAddress") %>' cssclass="text-input small-input"/></div>
                        <div class="row"><label>OLDID:</label><asp:TextBox ID="OLDIDTextBox" runat="server" Text='<%# Bind("OLDID") %>'  cssclass="text-input small-input"/></div>
                        <div class="row"><label>ThirdPartyFlag:</label><asp:TextBox ID="ThirdPartyFlagTextBox" runat="server" Text='<%# Bind("ThirdPartyFlag") %>' cssclass="text-input small-input"/></div>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />&nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="row"><label>ID:</label><asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' /></div>
                        <div class="row"><label>Email:</label><asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>'/></div>
                        <div class="row"><label>Password:</label><asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' /></div>
                        <div class="row"><label>IsSubscribed:</label><asp:CheckBox ID="IsSubscribedCheckBox" runat="server" Checked='<%# Bind("IsSubscribed") %>' Enabled="false" /></div>
                        <div class="row"><label>IsLocked:</label><asp:CheckBox ID="IsLockedCheckBox" runat="server" Checked='<%# Bind("IsLocked") %>' Enabled="false" /></div>
                        <div class="row"><label>FailedLoginCount:</label><%# Eval("FailedLoginCount")%></div>
                        <div class="row"><label>LastLoginDate:</label><asp:Label ID="LastLoginDateLabel" runat="server" Text='<%# Bind("LastLoginDate") %>'/></div>
                        <div class="row"><label>DateCreated:</label><asp:Label ID="DateCreatedLabel" runat="server" Text='<%# Bind("DateCreated") %>'/></div>
                        <div class="row"><label>IPAddress:</label><asp:Label ID="IPAddressLabel" runat="server" Text='<%# Bind("IPAddress") %>'/></div>
                        <div class="row"><label>OLDID:</label><asp:Label ID="OLDIDLabel" runat="server" Text='<%# Bind("OLDID") %>'/></div>
                        <div class="row"><label>ThirdPartyFlag:</label><asp:Label ID="ThirdPartyFlagLabel" runat="server" Text='<%# Bind("ThirdPartyFlag") %>' /></div>
                        <div class="row">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </fieldset>
        <div class="clear"></div>
	    </div>
    </div>

	<div class="content-box column3-mid">
		<div class="content-box-header">
			<h3>Customer Orders</h3>
		</div><!-- End .content-box-header -->
		<div class="content-box-content">

            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="OrderID" DataSourceID="odsCustomerOrders">
                <Columns>



                    <asp:TemplateField ItemStyle-CssClass="ProperCase">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnSelect" CommandName="select" ImageUrl="~/resources/images/icons/magnifier.png" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID"/>
                    <asp:TemplateField HeaderText="Billing" ItemStyle-CssClass="ProperCase">
                        <ItemTemplate>
                            <%# Eval("BillTitle") %> <%# Eval("BillNameFirst") %> <%# Eval("BillNameLast") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipping" ItemStyle-CssClass="ProperCase">
                        <ItemTemplate>
                            <%# Eval("ShipTitle")%> <%# Eval("ShipNameFirst")%> <%# Eval("ShipNameLast")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <%# FormatCurrency(Eval("SubTotal") + Eval("ShipCharge"), 2)%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Status" HeaderText="Status" 
                        SortExpression="Status" />
                    <asp:BoundField DataField="VoucherCode" HeaderText="Voucher"/>
                    <asp:BoundField DataField="DateCreated" HeaderText="Created"  DataFormatString="{0:dd/MM/yy HH:mm}" SortExpression="DateCreated" />
                    <asp:TemplateField HeaderText="Printed">
                        <ItemTemplate>
                            <a href='/Orders/Receipt.aspx?oid=<%# Eval("OrderID") %>' target="_new"><img src='<%# CheckIsSurpriseIcon(Eval("IsSurprise")) %>' border='0' alt="Print"/></a>
                            <%# Eval("DatePrinted", "{0:dd/MM/yy HH:mm}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DateShipped" HeaderText="Shipped" DataFormatString="{0:dd/MM/yy HH:mm}" SortExpression="DateShipped" />
                </Columns>
            </asp:GridView>

		</div>
	</div>

	<div class="content-box column3-right">
		<div class="content-box-header">
			<h3>Order Notes</h3>
            <asp:DropDownList ID="NoteTypeList" runat="server" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="" >(Show All)</asp:ListItem>
                <asp:ListItem Value="1"> - Phone Call</asp:ListItem>
                <asp:ListItem Value="2"> - Email</asp:ListItem>
                <asp:ListItem Value="3"> - Payment Message</asp:ListItem>
                <asp:ListItem Value="4"> - Order Error</asp:ListItem>
                <asp:ListItem Value="5"> - HTML Order Detail</asp:ListItem>
                <asp:ListItem Value="6"> - XML Response</asp:ListItem>
                <asp:ListItem Value="7"> - General Note</asp:ListItem>
            </asp:DropDownList>
		</div><!-- End .content-box-header -->
		<div class="content-box-content">
            <asp:GridView ID="gvOrderNotes" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID" DataSourceID="odsNotes">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Type" HeaderText="Type"/>
                    <asp:TemplateField HeaderText="Note">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Note") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DateCreated" HeaderText="Created" />
                    <asp:BoundField DataField="DateModified" HeaderText="Modified"  />
                    <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" />
                </Columns>
            </asp:GridView>
		</div>
	</div>



    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="{0}" SelectMethod="GetCustomer"  
        TypeName="NAPDataSetTableAdapters.CustomersTableAdapter" UpdateMethod="Update">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="cid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="IsSubscribed" Type="Boolean" />
            <asp:Parameter Name="IsLocked" Type="Boolean" />
            <asp:Parameter Name="FailedLoginCount" Type="Int32" />
            <asp:Parameter Name="LastLoginDate" Type="DateTime" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="IPAddress" Type="String" />
            <asp:Parameter Name="OLDID" Type="Int32" />
            <asp:Parameter Name="ThirdPartyFlag" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsCustomerOrders" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetOrdersByCustomerID" 
        TypeName="NAPDataSetTableAdapters.vw_OrderListSummaryTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="CustomerID" QueryStringField="cid" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="odsNotes" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="{0}" SelectMethod="GetNotes" 
        TypeName="NAPDataSetTableAdapters.NotesTableAdapter" UpdateMethod="Update"
        filterexpression="NoteTypeID={0}">
            <FilterParameters>
                <asp:ControlParameter ControlID="NoteTypeList" PropertyName="SelectedValue" />
            </FilterParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="NoteTypeID" Type="Int32" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="DateModified" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvOrders" Name="OrderID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="NoteTypeID" Type="Int32" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="DateModified" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>

</asp:Content>

