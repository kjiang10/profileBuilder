<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>

<body>

<div id="divoutput" style="margin-left:30%;">


</div>


<button id="printbtn" class="btn btn-primary" style="margin-left:50%" onclick="PrintElem('divoutput')">Print</button>

<script src="js/constants.js?version=1.8"></script>



<script>
$(document).ready(function() {
	var all_data=localStorage.getItem("selectedData"); 
	console.log("get data")
	console.log(all_data);
	
	all_data=JSON.parse(all_data);
	
	var fullname=localStorage.getItem("fullname"); 
	console.log(fullname);
	
	var fields=Object.keys(all_data);
	console.log("output fields")
	console.log(fields);
	var data=[];
	var basic=[];
	var basic_attr=["Contact-Information","ContactInformation","Current-Position","CurrentPosition","CurrentAffiliation","Current-Affiliation"];
	var pp=fields.includes("GoogleScholar-Picture");
	if (pp){
		pic=all_data["GoogleScholar-Picture"];
	}
	else{
		pic="img/default_profile.png";
		
	}
	var index = fields.indexOf("GoogleScholar-Picture");
	if (index > -1) {
		fields.splice(index, 1);
	}
	document.getElementById('divoutput').innerHTML = document.getElementById('divoutput').innerHTML +"<h3>"+fullname+"</h3>";
	document.getElementById('divoutput').innerHTML = document.getElementById('divoutput').innerHTML +"<img style='border:3px solid black;margin-left:30%' src="+pic+">";
	
	for(var k=0;k<fields.length;k++){
		if (basic_attr.includes(fields[k]))
		{
			if (all_data[fields[k]].length>0){
				row={};
				row["Name"]=fields[k];
				row["data"]=all_data[fields[k]];
				basic.push(row);
			}
			
		}
		else{
		if (all_data[fields[k]].length>0){
			row={};
			row["Name"]=fields[k];
			row["data"]=all_data[fields[k]];
			data.push(row);
		}
		}
	}
	console.log(data);
	
	
	$.ajax({
		url: 'templates/outputprofile1.tpl',
		async: false,
		type: 'POST'
	})
	.done(function(template) {
		var $commentsContainer = $('#divoutput');
	    var old = $commentsContainer.html();
		$('#divoutput').setTemplate(template);
		$('#divoutput').processTemplate(basic);
		$('#divoutput').prepend(old);
		
	});
	
	$.ajax({
		url: 'templates/outputprofile1.tpl',
		async: false,
		type: 'POST'
	})
	.done(function(template) {
		var $commentsContainer = $('#divoutput');
	    var old = $commentsContainer.html();
		$('#divoutput').setTemplate(template);
		$('#divoutput').processTemplate(data);
		$('#divoutput').prepend(old);
		
	});

});
</script>
<script>
function PrintElem(elem)
{
    var mywindow = window.open('', 'PRINT', 'height=400,width=600');

    mywindow.document.write('<html><head><title>' + document.title  + '</title>');
    mywindow.document.write('</head><body >');
    mywindow.document.write('<h1>' + document.title  + '</h1>');
    mywindow.document.write(document.getElementById(elem).innerHTML);
    mywindow.document.write('</body></html>');

    mywindow.document.close(); // necessary for IE >= 10
    mywindow.focus(); // necessary for IE >= 10*/

    mywindow.print();
    mywindow.close();

    return true;
}
</script>
</body>
</html>