<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master"  EnableViewState="true"  AutoEventWireup="false" CodeFile="POZones_Product.aspx.vb" Inherits="POZones_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<style>
label {font-size:11px}
</style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Edit Postal Zones: <asp:Literal runat="server" ID="litProductName"></asp:Literal></h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>      
                <div class="align-left">
                    <h3>United Kingdom</h3>
                    <asp:CheckBoxList ID="CheckBoxListUK" runat="server" RepeatLayout="Flow" AutoPostBack="true" RepeatDirection="vertical" DataTextField="Name" DataValueField="ID" /> 
                </div>      
                <div class="align-left">
                    <h3>Europe</h3>
                    <asp:CheckBoxList ID="CheckBoxListEU" runat="server" RepeatLayout="Flow" AutoPostBack="true" RepeatDirection="vertical"  DataTextField="Name" DataValueField="ID" />  
                </div>      
                <div class="align-left">
                    <h3>Zone 1</h3>
                    <asp:CheckBoxList ID="CheckBoxListZ1" runat="server" RepeatLayout="Flow" AutoPostBack="true" RepeatDirection="vertical"  DataTextField="Name" DataValueField="ID" /> 
                </div>      
                <div class="align-left">
                    <h3>Zone 2</h3>
                    <asp:CheckBoxList ID="CheckBoxListZ2" runat="server" RepeatLayout="Flow" AutoPostBack="true" RepeatDirection="vertical"  DataTextField="Name" DataValueField="ID" /> 
                </div>  
                <div class="clear"></div>    
                <asp:Literal runat="server" ID="Literal1"></asp:Literal>
            </ContentTemplate>
        </asp:UpdatePanel>

       

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

<script type="text/javascript">
    function pageLoad() {

        $(".close").click(
			function () {
			    $(this).parent().fadeTo(400, 0, function () { // Links with the class "close" will close parent
			        $(this).slideUp(400);
			    });
			    return false;
			}
		);
    }
</script>

</asp:Content>

