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
    
          <h4 class="modal-title">Add attribute</h4>
        <div class="modal-body">
         <div id="field">
			<p>
			Name of attribute: <input type="text" id="nameattr" required>
			Description: <textarea id="description" rows="2" cols="50"> </textarea><br/>
			Source: <textarea id="source" rows="2" cols="50"> </textarea><br/>
			Field Name: <input type="text" class="fieldname" placeholder="Enter field name"> Field Type:<select placeholder="Select data type" class="fieldtype">
			    <option value="" disabled selected>Select data type</option>
			    <option value="text">text</option>
			    <option value="date">date</option>
			    <option value="email">email</option>
			    <option value="month">month</option>
			    <option value="number">number</option>
			    <option value="range">range</option>
			    <option value="tel">tel</option>
			    <option value="time">time</option>
			    <option value="url">url</option>
			  </select>
			  <span class="remove" onclick="removefield(this);">Remove</span>
			  </p>
			</div>
			  <p>
			  <button id="btnfield" class="btn btn-primary" onclick="addnewfield()">Add More Field</button>
			  </p>
			  
		</div>
        	<button id="btnAddNew" class="btn btn-primary" onclick="addnewattribute()">Add New Attribute</button>
 
        
  


<script src="js/constants.js"></script>
<script>	
	function addnewattribute(){
		var attrname=document.getElementById('nameattr').value;
		var description=document.getElementById('description').value;
		var source=document.getElementById('source').value;
		//var source="Manual";
		var listname=document.getElementsByClassName("fieldname");
		var listtype=document.getElementsByClassName("fieldtype");
		var colsname=[];
		
		console.log(listname);
		console.log(listtype);
		
		all_data={};
		all_data["attribute"]=attrname;
		all_data["Description"]=description;
		all_data["Source"]=source;
		all_data["fields"]=[];
		dict[attrname]={};
		for(var i=0;i<listname.length;i++){
			row={};
			row["Name"]=listname[i].value;
			row["type"]=listtype[i].value;
			all_data["fields"].push(row);
			colsname.push(listname[i].value);
			dict[attrname][listname[i].value]=listtype[i].value;
		}
		
		console.log(all_data);
		
		$.ajax({
		    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
		    type: "post",//request type, can be GET
		    cache: false,//do not cache returned data
		    data: {"record":JSON.stringify(all_data),"task":"insertnewattribute"},//data to be sent to the server
		    //dataType: "json"//type of data returned
		}).done(function() {
			console.log("Insert new attribute successful");
			alert("New attribute inserted");
			window.location.reload(false); 
		    });
	}
	
	function addnewfield(){
		var newdiv = document.getElementById('field');
		 $("#field").append('<br/><p>'+'Field Name: '+'<input type="text" class="fieldname" placeholder="Enter field name"/>'+' Field Type:'+'<select placeholder="Select data type" class="fieldtype"><option value="" disabled selected>Select data type</option><option value="text">text</option><option value="date">date</option><option value="email">email</option><option value="month">month</option><option value="number">number</option><option value="range">range</option><option value="tel">tel</option><option value="time">time</option><option value="url">url</option></select><span class="remove" onclick="removefield(this);">Remove</span></p>');
	}
	
	function removefield(element){
		console.log("function called");
		$(element).parent('p').remove();
	}
	
</script>

	
</body>
</html>