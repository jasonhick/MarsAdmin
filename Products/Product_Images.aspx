<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master"  EnableViewState="true"  AutoEventWireup="false" CodeFile="Product_Images.aspx.vb" Inherits="Product_Images" %>

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
	        <li><a class="shortcut-button" href="Product_Fields.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/app_48.png" width=48 height=48 alt="icon" /><br />Fields</span></a></li>
	        <li><a class="shortcut-button selected" href="Product_Images.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/image_48.png" width=48 height=48 alt="icon" /><br />Images</span></a></li>
        </ul>
        <div class="clear"></div>


    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Edit Images: </h3>    
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">


            
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <LayoutTemplate>
                    <table ID="itemPlaceholderContainer"border="0">
                        <tr style="row-head">
                            <th colspan=2></th>
                            <th>Type</th>
                            <th>Size</th>
                            <th>Display Order</th>
                            <th>Label</th>
                            <th>Title</th>
                            <th>Filename</th>
                            <th></th>
                        </tr>
                        <tbody>
                            <tr ID="itemPlaceholder" runat="server"></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>



                <EditItemTemplate>
                    <tr class="edit-row">
                        <td></td>
                        <td>
                            <asp:DropDownList ID="DropDownListType" runat="server" SelectedValue='<%# Bind("Type")%>'>
                                <asp:ListItem>img</asp:ListItem>
                                <asp:ListItem>vid</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListSize" runat="server" SelectedValue='<%# Bind("Size") %>'>
                                <asp:ListItem>xs</asp:ListItem>
                                <asp:ListItem>s</asp:ListItem>
                                <asp:ListItem>m</asp:ListItem>
                                <asp:ListItem>l</asp:ListItem>
                                <asp:ListItem>xl</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListOrder" runat="server" SelectedValue='<%# Bind("DisplayOrder") %>'>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListLabel" runat="server" SelectedValue='<%# Bind("Label") %>'>
                                <asp:ListItem>a</asp:ListItem>
                                <asp:ListItem>b</asp:ListItem>
                                <asp:ListItem>c</asp:ListItem>
                                <asp:ListItem>d</asp:ListItem>
                                <asp:ListItem>e</asp:ListItem>
                                <asp:ListItem>f</asp:ListItem>
                                <asp:ListItem>g</asp:ListItem>
                                <asp:ListItem>h</asp:ListItem>
                                <asp:ListItem>i</asp:ListItem>
                                <asp:ListItem>j</asp:ListItem>
                                <asp:ListItem>k</asp:ListItem>
                                <asp:ListItem>l</asp:ListItem>
                                <asp:ListItem>m</asp:ListItem>
                                <asp:ListItem>n</asp:ListItem>
                                <asp:ListItem>o</asp:ListItem>
                                <asp:ListItem>p</asp:ListItem>
                                <asp:ListItem>q</asp:ListItem>
                                <asp:ListItem>r</asp:ListItem>
                                <asp:ListItem>s</asp:ListItem>
                                <asp:ListItem>t</asp:ListItem>
                                <asp:ListItem>u</asp:ListItem>
                                <asp:ListItem>v</asp:ListItem>
                                <asp:ListItem>w</asp:ListItem>
                                <asp:ListItem>x</asp:ListItem>
                                <asp:ListItem>y</asp:ListItem>
                                <asp:ListItem>z</asp:ListItem>
                            </asp:DropDownList> 
                        </td>
                        <td><asp:TextBox ID="TitleTextBox" runat="server" class="text-input" Text='<%# Bind("Title") %>' /></td>
                        <td><asp:TextBox ID="VideoURLTextBox" runat="server" class="text-input" Text='<%# Bind("Filename") %>' /></td>
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <tr>
                        <td></td>
                        <td>
                            <asp:DropDownList ID="DropDownListType" runat="server" SelectedValue='<%# Bind("Type")%>'>
                                <asp:ListItem>img</asp:ListItem>
                                <asp:ListItem>vid</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListSize" runat="server" SelectedValue='<%# Bind("Size") %>'>
                                <asp:ListItem>xs</asp:ListItem>
                                <asp:ListItem>s</asp:ListItem>
                                <asp:ListItem>m</asp:ListItem>
                                <asp:ListItem>l</asp:ListItem>
                                <asp:ListItem>xl</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListOrder" runat="server" SelectedValue='<%# Bind("DisplayOrder") %>'>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListLabel" runat="server" SelectedValue='<%# Bind("Label") %>'>
                                <asp:ListItem>a</asp:ListItem>
                                <asp:ListItem>b</asp:ListItem>
                                <asp:ListItem>c</asp:ListItem>
                                <asp:ListItem>d</asp:ListItem>
                                <asp:ListItem>e</asp:ListItem>
                                <asp:ListItem>f</asp:ListItem>
                                <asp:ListItem>g</asp:ListItem>
                                <asp:ListItem>h</asp:ListItem>
                                <asp:ListItem>i</asp:ListItem>
                                <asp:ListItem>j</asp:ListItem>
                                <asp:ListItem>k</asp:ListItem>
                                <asp:ListItem>l</asp:ListItem>
                                <asp:ListItem>m</asp:ListItem>
                                <asp:ListItem>n</asp:ListItem>
                                <asp:ListItem>o</asp:ListItem>
                                <asp:ListItem>p</asp:ListItem>
                                <asp:ListItem>q</asp:ListItem>
                                <asp:ListItem>r</asp:ListItem>
                                <asp:ListItem>s</asp:ListItem>
                                <asp:ListItem>t</asp:ListItem>
                                <asp:ListItem>u</asp:ListItem>
                                <asp:ListItem>v</asp:ListItem>
                                <asp:ListItem>w</asp:ListItem>
                                <asp:ListItem>x</asp:ListItem>
                                <asp:ListItem>y</asp:ListItem>
                                <asp:ListItem>z</asp:ListItem>
                            </asp:DropDownList> 
                        </td>
                        <td><asp:TextBox ID="TextBox1" runat="server" class="text-input" Text='<%# Bind("Title") %>' /></td>
                        <td><asp:TextBox ID="TextBox2" runat="server" class="text-input" Text='<%# Bind("FileName") %>' /></td>
                        <td>
                            <asp:Button ID="Button4" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="Button5" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>



                <ItemTemplate>
                    <tr>
                        <td><asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" /></td>
                        <td><asp:Image runat="server" ID="image" Width="25" Height="25" ImageUrl='<%# "/resources/images/prod/s/" + Eval ("filename") + "-" + Eval ("label") + ".jpg" %>'/></td>
                        <td><asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' /></td>
                        <td><asp:Label ID="SizeLabel" runat="server" Text='<%# Eval("Size") %>' /></td>
                        <td><asp:Label ID="DisplayOrderLabel" runat="server" Text='<%# Eval("DisplayOrder") %>' /></td>
                        <td><asp:Label ID="LabelLabel" runat="server" Text='<%# Eval("Label") %>' /></td>
                        <td><asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></td>
                        <td><asp:Label ID="FileNameLabel" runat="server" Text='<%# Eval("FileName") %>' /></td>
                        <td><asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Delete" /></td>
                    </tr></ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="alt-row"">
                        <td><asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" /></td>
                        <td><asp:Image runat="server" ID="image" Width="25" Height="25" ImageUrl='<%# "/resources/images/prod/s/" + Eval ("filename") + "-" + Eval ("label") + ".jpg" %>'/></td>
                        <td><asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' /></td>
                        <td><asp:Label ID="SizeLabel" runat="server" Text='<%# Eval("Size") %>' /></td>
                        <td><asp:Label ID="DisplayOrderLabel" runat="server" Text='<%# Eval("DisplayOrder") %>' /></td>
                        <td><asp:Label ID="LabelLabel" runat="server" Text='<%# Eval("Label") %>' /></td>
                        <td><asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></td>
                        <td><asp:Label ID="FileNameLabel" runat="server" Text='<%# Eval("FileName") %>' /></td>
                        <td><asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Delete" /></td>
                    </tr></AlternatingItemTemplate>


                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
            </asp:ListView>



                    
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NAPConnectionString %>" 
                DeleteCommand="adm_Assets_d" DeleteCommandType="StoredProcedure" 
                InsertCommand="adm_Assets_i" InsertCommandType="StoredProcedure" 
                SelectCommand="adm_AssetsByProductID" SelectCommandType="StoredProcedure" 
                UpdateCommand="adm_Assets_u" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductID" Type="Int16"/>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Size" Type="String" />
                    <asp:Parameter Name="Label" Type="String" />
                    <asp:Parameter Name="DisplayOrder" Type="Int16" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="FileName" Type="String" />
                    <asp:Parameter Name="VideoURL" Type="String" DefaultValue="" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="ID" QueryStringField="pid" 
                        Type="Int16" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Size" Type="String" />
                    <asp:Parameter Name="Label" Type="String" />
                    <asp:Parameter Name="DisplayOrder" Type="Int16" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="FileName" Type="String" />
                    <asp:Parameter Name="VideoURL" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->


</asp:Content>

