<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Navbar.aspx.vb" Inherits="Navbar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <base target="maincontent" href="MarsAdmin"/>
		<title>Needapresent Admin</title>
		<!-- Reset Stylesheet -->
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" /> 
		<!-- Main Stylesheet -->
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
		<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
		<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />	
		<!-- Colour Schemes
		Default colour scheme is green. Uncomment prefered stylesheet to use it.
		<link rel="stylesheet" href="/resources/css/blue.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/resources/css/red.css" type="text/css" media="screen" />  
		-->
		<!-- Internet Explorer Fixes Stylesheet -->
		<!--[if lte IE 7]>
			<link rel="stylesheet" href="/resources/css/ie.css" type="text/css" media="screen" />
		<![endif]-->

		
	</head>
  
	<body id="navbar">
		
<div id="sidebar"><div id="sidebar-wrapper"> <!-- Sidebar with logo and menu -->
			
			<h1 id="sidebar-title"><a href="#">Needapresent Admin</a></h1>
		  
			<!-- Logo (221px wide) -->
			<a href="#"><img id="logo" src="/resources/images/logo.png" alt="Simpla Admin logo" /></a>
			
			<ul id="main-nav">  <!-- Accordion Menu -->
				
                <li><a href="Dashboard.aspx" class="nav-top-item current no-submenu">Dashboard</a></li>
				<li><a href="/Orders/Order_List.aspx" class="nav-top-item no-submenu">Orders</a></li>
				<li>
					<a href="/Customers/Customer_List.aspx" class="nav-top-item no-submenu">Customers</a>
				</li>				
				<li>
					<a class="nav-top-item">Products</a>
					<ul>
						<li><a href="/Products/Product_Add.aspx">Add a New Product</a></li>
						<li><a href="/Products/Product_List.aspx">Manage Products</a></li>
                        <li><a href="/Products/Product_Stock.aspx">Stock Levels</a></li>
                        <li><a href="/Products/POZones_Product.aspx">Postal Zones</a></li>
					</ul>
				</li>
                <li><a class="nav-top-item">Categories</a>
					<ul>
                        <li><a href="/Categories/Category_List.aspx">View Categories</a></li>
						<li><a href="/Categories/Category_Add.aspx">New Category</a></li>
                        <li><a href="/Categories/Sitemap.aspx">Sitemap</a></li>
					</ul>
                </li>
				<li>
					<a class="nav-top-item">Supppliers</a>
					<ul>
						<li><a href="/Suppliers/Supplier_Add.aspx">Add a New Supplier</a></li>
						<li><a href="/Suppliers/Supplier_List.aspx">Manage Suppliers</a></li>
					</ul>
				</li>
				<li>
					<a class="nav-top-item">Third Party Orders</a>
					<ul>
                        <li><a href="/ThirdParty/SweetJars.aspx">Sweet Jars</a></li>
                        <li><a href="/ThirdParty/Crowther.aspx" title="Mini Pitches, Star of Fame, Teddy Bears, $ Notes">Crowther</a></li>
                        <!-- <li><a href="/ThirdParty/Crucial.aspx" title="Doormats">Crucial</a></li> //-->
                        <li><a href="/ThirdParty/Delightful.aspx" title="Hand Made Signs">Delightful</a></li>
                        <li><a href="/ThirdParty/GiftRepublic.aspx">Gift Republic</a></li>
                        <li><a href="/ThirdParty/GourmetPizza.aspx">Gourmet Pizza</a></li>
                        <li><a href="/ThirdParty/InThePaper.aspx" title="Football Dressing Room, Football Magazine Cover">In The Paper</a></li>
						<li><a href="/ThirdParty/Intervino2.aspx" title="Champagne, Wine, Whisky & Brandy">Intervino</a></li>
                        <li><a href="/ThirdParty/MapMarketing.aspx" title="Traveller Map, Aerial Photo, Photo Jigsaws">Map Marketing</a></li>
                        <li><a href="/ThirdParty/PMC.aspx" title="Engraved Products">PMC</a></li>
                        <li><a href="/ThirdParty/WeatherStone.aspx" title="Weather Stones">Weather Stone</a></li>
                        
                        
					</ul>
				</li>

			</ul> <!-- End #main-nav -->
		</div></div> <!-- End #sidebar -->

<script type="text/javascript" src="/resources/scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/resources/scripts/simpla.jquery.configuration.js"></script>
		
</body> 
</html>

