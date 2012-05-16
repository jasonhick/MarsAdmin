<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Customer_Notes.aspx.vb" Inherits="Customer_Notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Customer Detail</h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">

        <ul class="shortcut-buttons-set">
	        <li><a class="shortcut-button" href="Customer_Edit.aspx?cid=<%= Request.Querystring("cid") %>"><span><img src="/resources/images/glyph/Edit_32d.png" alt="icon" /><br />Detail</span></a></li>
	        <li><a class="shortcut-button" href="Customer_Orders.aspx?cid=<%= Request.Querystring("cid") %>"><span><img src="/resources/images/glyph/Options_32d.png" alt="icon" /><br />Orders</span></a></li>
	        <li><a class="shortcut-button" href="Customer_Notes.aspx?cid=<%= Request.Querystring("cid") %>"><span><img src="/resources/images/glyph/list_32.png" alt="icon" /><br />Notes</span></a></li>
        </ul>
            
	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

</asp:Content>

