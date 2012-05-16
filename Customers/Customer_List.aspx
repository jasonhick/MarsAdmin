<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Customer_List.aspx.vb" Inherits="Customers_Customer_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Manage Customers</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">
            
            
            <asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="20"
                AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                 AlternatingRowStyle-CssClass="alt-row">
                <EmptyDataTemplate>
                    Search for a customer by entering your search terms above.
                    Fields accepted: Email, First name, Last name.
                </EmptyDataTemplate>
                <Columns>
                
                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <a href='Customer_Edit.aspx?cid=<%# Eval("ID") %>'>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="NamePrefix">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NamePrefix") %>'></asp:TextBox>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NameLast") %>'></asp:TextBox>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("NameFirst") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NamePrefix") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NameLast") %>'></asp:Label>,
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("NameFirst") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telephone" SortExpression="PhoneNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password" SortExpression="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IsSubscribed" SortExpression="IsSubscribed">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                Checked='<%# Bind("IsSubscribed") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                Checked='<%# Bind("IsSubscribed") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

                <PagerTemplate>
                    <div class="pagination" style="align:center">
                      <asp:LinkButton CommandName="Page" CommandArgument="First" ID="LinkButton1" runat="server">&lt;&lt; First</asp:LinkButton>
                      <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="LinkButton2" runat="server">&lt; Prev</asp:LinkButton>
                      [Records <%= GridView1.PageIndex * GridView1.PageSize %> - <%= GridView1.PageIndex * GridView1.PageSize + GridView1.PageSize - 1 %>]
                      <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="LinkButton3" runat="server">Next &gt;</asp:LinkButton>
                      <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="LinkButton4" runat="server">Last &gt;&gt;</asp:LinkButton>          
                    </div>
                </PagerTemplate>

            </asp:GridView>


	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
        SelectCommand="adm_CustomerSearch_s" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="SearchTextBox" Name="q" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="SearchForCustomer" 
        TypeName="NAPDataSetTableAdapters.CustomerSearchTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="SearchTextBox" Name="q" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </asp:Content>

