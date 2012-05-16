<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master"  EnableViewState="true"  AutoEventWireup="false" CodeFile="Product_Reviews.aspx.vb" Inherits="Product_Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

        <ul class="shortcut-buttons-set"> <!-- Replace the icons URL's with your own -->
	        <li><a class="shortcut-button" href="Product_Edit.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/glyph/Edit_32d.png" alt="icon" /><br />Description</span></a></li>
	        <li><a class="shortcut-button" href="Product_Category.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/glyph/Options_32d.png" alt="icon" /><br />Categories</span></a></li>
	        <li><a class="shortcut-button" href="Product_Choices.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/glyph/list_32d.png" alt="icon" /><br />Choices</span></a></li>
	        <li><a class="shortcut-button" href="Product_Fields.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/glyph/fields_32d.png" alt="icon" /><br />Fields</span></a></li>
	        <li><a class="shortcut-button" href="Product_Images.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/glyph/image_32d.png" alt="icon" /><br />Images</span></a></li>
	        <li><a class="shortcut-button" href="Product_Reviews.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/glyph/comment_48.png" alt="icon" /><br />Reviews</span></a></li>
        </ul>
        <div class="clear"></div>


    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Edit Review: </h3>    
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">


	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->


</asp:Content>

