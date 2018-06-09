<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Sort and select data</title>
</head>

<body>
<form method="GET">
<div>
<h3>Select a template</h3>
</div>
</form>

<div id="pageone" class="checkbox-wrapper">
<input type="checkbox" name="value"/><br/>
 <a href="#myPopup" data-rel="popup" data-position-to="window">
    <img src="img/template.png" alt="Template" style="width:200px;"></a>

    <div data-role="popup" id="myPopup">
      <a href="#pageone" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a><img src="img/template.png" style="width:600px;height:400px;" alt="Template">
    </div>
</div>
<button id="nextbtn" class="btn btn-primary" style="margin-left:50%;width:120px;">Next step</button>

<script src="js/constants.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	


<script>
$(document).ready(function() {
	var all_data=localStorage.getItem("selectedData"); 
	console.log("get data")
	console.log(all_data);
	
	console.log(JSON.parse(all_data));
	
	$('#nextbtn').click( function () {
		window.location.href="OnlineProfile.jsp";
	});

});
</script>
</body>
</html>