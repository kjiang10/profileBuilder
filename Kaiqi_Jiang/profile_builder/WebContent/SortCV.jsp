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
<h3>Sort and select data for your CV</h3>
<div id="selectcv">


</div>

</div>
</form>

<button id="nextbtn" class="btn btn-primary" style="margin-left:50%">Next step</button>

<script src="js/constants.js?version=1.9>"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jqc-1.12.4/dt-1.10.13/cr-1.3.2/datatables.min.js"></script>

<script>
$(document).ready(function() {
	var all_tables=[];
	var attributes=[];
	username=sessionStorage.getItem("username");
	$.ajax({
	    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
	    type: "post",//request type, can be GET
	    cache: false,//do not cache returned data
	    data: {"username":username,"task":"getresume"},//data to be sent to the server
	    dataType: "json"//type of data returned
	}).done(function(response) {
		response=response[0];
		unfattributes=Object.keys(response);
		for (var i=0;i<unfattributes.length;i++){
			var foo = getParameterByName(unfattributes[i]);
			if (foo=="selected"){
				attributes.push(unfattributes[i]);
			}		
		}
		var div=document.getElementById("selectcv");
		for (var k=0;k<attributes.length;k++){
			div.innerHTML=div.innerHTML+'<h2>'+attributes[k]+'</h2>';
			for (var i=0;i<response[attributes[k]]["fields"].length;i++){
				div.innerHTML=div.innerHTML+'<a class="toggle-vis'+attributes[k]+'" data-column="'+i+'">'+response[attributes[k]]["fields"][i]+'</a>--';
			}			
			div.innerHTML=div.innerHTML+'<br/><table id='+attributes[k]+' class="display" width="100">';
		}
		for (var k=0;k<attributes.length;k++){
			cols=[];
			dataSet=[];
			data=[];
			cols,dataSet=getdata(response[attributes[k]]);
			table=maptotable(attributes[k],dataSet,cols);
			all_tables.push(table);
		}
		
    });
	 
	
	console.log("Outside");
	console.log(all_tables);
	 
	$('#nextbtn').click( function () {
		console.log("Inside function");
		console.log(all_tables);
		all_data={};
		for(var i=0;i<all_tables.length;i++)
		{
			all_data[attributes[i]]=[];
			console.log(all_tables[i].rows('.selected').data().length);	
			len=all_tables[i].rows('.selected').data().length;
			for (var j=0;j<len;j++){
				console.log(all_tables[i].rows('.selected').data()[j]);
				row=[];
				var k=0;
				all_tables[i].columns().every( function () {
					console.log("Column header", $(this.header()).text() );
					console.log("Column visibility", this.visible() );
					if(this.visible()){
						row.push(all_tables[i].rows('.selected').data()[j][k])
					}
					k=k+1;
				});
				console.log(row);
				all_data[attributes[i]].push(row);
			}
		}
		console.log(all_data);
		localStorage.setItem("selectedData", JSON.stringify(all_data)); 
		console.log("localstorage");
		
		window.location.href="TemplateSelection.jsp";
		//post("TemplateSelection.jsp",all_data);
    } );
	
	
	function post(path, params, method) {
	    method = method || "post"; // Set method to post by default if not specified.

	    // The rest of this code assumes you are not using a library.
	    // It can be made less wordy if you use one.
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);

	    for(var key in params) {
	        if(params.hasOwnProperty(key)) {
	        	console.log(key);
	        	console.log(params[key]);
	            var hiddenField = document.createElement("input");
	            hiddenField.setAttribute("type", "hidden");
	            hiddenField.setAttribute("name", key);
	            hiddenField.setAttribute("value", params[key]);

	            form.appendChild(hiddenField);
	         }
	    }

	    document.body.appendChild(form);
	    form.submit();
	}
	
	

})
</script>

<script>

function getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function getdata(response){
	cols=[];
	data=[];
	for (var k=0;k<response["fields"].length;k++){
		row={};
		row["title"]=response["fields"][k];
		cols.push(row);
	}
	
	for (var k=0;k<response["data"].length;k++){
		row=[];
		for (var j=0;j<response["fields"].length;j++){
			
			row.push(response["data"][k][response["fields"][j]]["value"]);		
		
		}
		data.push(row);
	}

	
	
	return cols,data;
}

function maptotable(attrname,data,cols){	
	var table=$('#'+attrname).DataTable({
        data: data,
        columns:cols,
        "autoWidth": false,
        colReorder: true
    });
	
	$('#'+attrname+' tbody').on('click', 'tr', function () {
        $(this).toggleClass('selected');
  	});
	
	 $('a.toggle-vis'+attrname).on( 'click', function (e) {
	        e.preventDefault();
	 
	        // Get the column API object
	        var column = table.column( $(this).attr('data-column') );
	 
	        // Toggle the visibility
	        column.visible( ! column.visible() );
	    } );
	
	
	 return table;
	 
	 
	
	 
	   
}

</script>
</body>
</html>