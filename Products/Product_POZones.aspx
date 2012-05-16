<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master"  EnableViewState="true"  AutoEventWireup="false" CodeFile="Product_POZones.aspx.vb" Inherits="Product_POZones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <ul class="shortcut-buttons-set">
	        <li><a class="shortcut-button" href="Product_Edit.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/paper_content_pencil_48.png" width=48 height=48 alt="icon" /><br />Description</span></a></li>
	        <li><a class="shortcut-button" href="Product_Category.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/navigate_48.png" width=48 height=48 alt="icon" /><br />Categories</span></a></li>
            <li><a class="shortcut-button selected" href="Product_POZones.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/globe_48.png" width=48 height=48 alt="icon" /><br />PO Zones</span></a></li>
	        <li><a class="shortcut-button" href="Product_Choices.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/mouse_48.png" width=48 height=48 alt="icon" /><br />Choices</span></a></li>
	        <li><a class="shortcut-button" href="Product_Fields.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/app_48.png" width=48 height=48 alt="icon" /><br />Fields</span></a></li>
	        <li><a class="shortcut-button" href="Product_Images.aspx?pid=<%= Request.Querystring("pid") %>"><span><img src="/resources/images/icons/image_48.png" width=48 height=48 alt="icon" /><br />Images</span></a></li>
        </ul>
        <div class="clear"></div>

    <div class="content-box"><!-- Start Content Box -->
	    <div class="content-box-header">
		    <h3>Edit Postal Zones: <asp:Literal runat="server" ID="litProductName"></asp:Literal></h3>
		    <div class="clear"></div>
	    </div> <!-- End .content-box-header -->
	    <div class="content-box-content">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>            
                <asp:CheckBoxList ID="CheckBoxList1" runat="server"
                RepeatLayout="table" AutoPostBack="true" RepeatDirection="vertical"> 
                    <asp:ListItem Value="UK"><b>UK</b></asp:ListItem>
                    <asp:ListItem Value="EU"><b>Europe</b> - Albania, Armenia, Austria, Azerbaijan, Bosnia And Herzegowina, Belgium, Bulgaria, Belarus, Switzerland, Cyprus, Czech Republic, Germany, Denmark, Estonia, Spain, Finland, Faroe Islands, France, Georgia, Gibraltar, Greenland, Greece, Croatia , Hungary, Irish Republic, Iceland, Italy, Kazakhstan, Liechtenstein, Lithuania, Luxembourg, Latvia, Monaco, Moldova, Macedonia (Former Yugoslav Rep.), Malta, Netherlands, Norway, Poland, Portugal, Romania, Russian, Sweden, Slovenia, Slovakia, San Marino, Tajikistan, Turkmenistan, Turkey, Ukraine, Uzbekistan, Vatican City State, Yugoslavia.</asp:ListItem>
                    <asp:ListItem Value="Z1"><b>Zone 1</b> - Afghanistan, Algeria, Angola, Anguilla, Antigua & Barbuda, Argentina, Aruba, Bahamas, Bahrain, Bangladesh, Barbados, Belize, Benin, Bermuda, Bhutan, Bolivia, Botswana, Brazil, British Indian Ocean, Brunei Darussalam, Burkina Faso, Burundi, Cambodia, Cameroon, Canada, Cape Verde, Cayman Islands, Central African Republic, Chad, Chile, Christmas Island, Cocos (Keeling) Islands, Colombia, Comoros, Congo, Costa Rica, Cote D'Ivoire, Cuba, Djibouti, Dominica, Dominican Republic, Ecuador, Egypt, El Salvador, Equatorial Guinea, Eritrea, Ethiopia, Falkland Islands, French Guiana, Gabon, Gambia, Ghana, Grenada, Guatemala, Guinea, Guinea-Bissau, Guyana, Haiti, Honduras, Hong Kong, India, Indonesia, Iran, Iraq, Israel, Jamaica, Jordan, Kenya, Kuwait, Lebanon, Lesotho, Liberia, Libyan, Macau, Madagascar, Malawi, Malaysia, Maldives, Mali, Mauritania, Mauritius, Mexico, Montserrat, Morocco, Mozambique, Myanmar, Namibia, Nepal, Netherlands Antilles, Nicaragua, Niger, Nigeria, Oman, Pakistan, Panama, Paraguay, Peru, Puerto Rico, Qatar, Reunion, Rwanda, Saint Kitts And Nevis, Saint Lucia, Saint Vincent And The Grenadines, Sao Tome And Principe, Saudi Arabia, Senegal, Seychelles, Sierra Leone, Singapore, Somalia, South Africa, Sri Lanka, St. Helena, St. Pierre And Miquelon, Sudan, Suriname, Swaziland, Syrian, Tanzania, Thailand, Togo, Trinidad And Tobago, Tunisia, Turks And Caicos Islands, Uganda, United Arab Emirates, United States of America, Uruguay, Venezuela, Virgin Islands (British), Virgin Islands (U.S.), Yemen, Zambia, Zimbabwe.</asp:ListItem>
                    <asp:ListItem Value="Z2"><b>Zone 2</b> - American Samoa, Antarctica, Australia, China, East Timor, Fiji, French Polynesia, French Southern Territories, Guam, Japan, Kiribati, Korea, Dem Rep, Korea, Republic, Marshall Islands, Micronesia, Mongolia, Nauru Island, New Caledonia, New Zealand, Norfolk Island, Northern Mariana Islands, Papua New Guinea, Philippines, Pitcairn Island, Samoa, Solomon Islands, Taiwan, Tonga, Tuvalu, Vanuatu, Wallis And Futuna Islands.</asp:ListItem>
                    <asp:ListItem Value="BF"><b>BFPO</b></asp:ListItem>
                </asp:CheckBoxList>
                <asp:Literal runat="server" ID="Literal1"></asp:Literal>
            </ContentTemplate>
        </asp:UpdatePanel>

	    </div> <!-- End .content-box-content -->
    </div> <!-- End .content-box -->

<a href="POZones_Product.aspx">Switch</a>

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

