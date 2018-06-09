<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><decorator:title default="Profile Builder" /></title>
	
	<!-- Bootstrap -->
	<link rel="chrome-webstore-item" href="https://chrome.google.com/webstore/detail/omcncfnpmcabckcddookmnajignpffnh">
    
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">	
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="css/jasny-bootstrap.min.css" rel="stylesheet" media="screen">	
    <link href="css/jasny-bootstrap-responsive.min.css" rel="stylesheet" media="screen">
     <link href="css/progress-checker.css" rel="stylesheet" media="screen">
    <link href="css/main.css" rel="stylesheet">  
    <link href="css/bootstrap-editable.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
    
    <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> -->
    <script type="text/javascript" src="js/jquery-latest.js"></script>
	<!--<script type="text/javascript" src="js/bootstrap.min.js"></script>-->
	<script type="text/javascript" src="js/bootstrap_customized.js"></script>
	<script type="text/javascript" src="js/jasny-bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-jtemplates.js"></script>
	<script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
	
	<!-- For tag cloud -->
	<!--[if lt IE 9]><script type="text/javascript" src="js/excanvas.js"></script><![endif]-->
	<script type="text/javascript" src="js/tagcanvas.min.js"></script>
	
	<!-- arrange layout -->
	<script type="text/javascript" src="js/masonry.pkgd.min.js"></script>
		
	<!-- For redirect -->
	<script type="text/javascript" src="js/jquery.redirect.min.js"></script>
	
	<!-- x-editable (bootstrap version) -->
	<script src="js/bootstrap-editable.min.js"></script>
	


	
	
</head>
<body>
	<!-- Top navigation bar -->
	<div class="navbar navbar-static-top navbar-inverse">
		<div class="navbar-inner">
			<div class="row">
				<div class="span10 nav-offset">		      
	 				<ul class="nav">
		            	<li id="li_home">
		                	<a href="./index.jsp"><strong>Home</strong></a>
		              	</li>
			        	
		            </ul>
		        </div>
    		</div>
		</div>
	</div>
	
	
	
	<!-- 
	<progress id="top-progress-bar" value="0" max="100" style="display:none;"></progress> -->
	
	<!-- separator -->
	<div style="height:10px;"></div>
	
	<!-- Page Content -->
    <decorator:body />
    
    <div style="height: 220px; clear:both;"></div>
    
    <!-- Footer -->
    <!-- 
    <footer class="footer">
    	<div class="navbar navbar-fixed-bottom">
			<div class="navbar-inner">
				<div class="row">
					<div class="span10 other-offset">
						<div style="height:9px;"></div>						
						Copyright © 2010-2012 Illinois at Singapore Pte Ltd. All Rights Reserved. 
					</div>
				</div>
			</div>
		</div>
    </footer>
     -->    
</body>
</html>