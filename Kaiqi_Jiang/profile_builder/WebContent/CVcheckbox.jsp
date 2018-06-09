<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attributes selection</title>
</head>

<body>
<form action="sortcv" method="get">
<div align="center" style="padding-left:200px; text-align:left;">
<h3>Select the attributes for your CV</h3>
<div id="selectcv" align="center" style="padding-left:200px; text-align:left;">

</div>
<button class="btn btn-primary" type="submit">Next step</button>
</div>
</form>



<script src="js/constants.js?version=1.11"></script>
<script>
$(document).ready(function() {
	username=sessionStorage.getItem("username");
	console.log(username);
	$.ajax({
	    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
	    type: "post",//request type, can be GET
	    cache: false,//do not cache returned data
	    data: {"username":username,"task":"getresume"},//data to be sent to the server
	    dataType: "json"//type of data returned
	}).done(function(response) {
		response=response[0];
		console.log(response);
		var attributes=Object.keys(response);
		console.log(attributes);
		var container = document.getElementById('selectcv');
		for(var k=0;k<attributes.length;k++){
			container.innerHTML = container.innerHTML +'<input type="checkbox" name="'+attributes[k]+'" value="selected" id="chk_'+attributes[k]+'"> '+attributes[k]+'</input><br/>';
		}
		
    });
})
</script>

	
</body>
</html>