<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	

	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Edit attributes</title>
	

	
	



</head>
<body>



<div id="mainMenu" class="mainMenu">
 
  <a href="#"><img src="img/editImageHover.png" id="editImage" width="40px" height="40px"  onmouseover="editImageHover();" onmouseout="editImageUnhover();" onclick="editImageClicked()"/></a>
  	<div id ="editImageDescription">general info</div>
  	  
  <a href="#"><img src="img/addAttribute.png" id="addAttribute" width="40px" height="40px"  onmouseover="addAttributeHover();" onmouseout="addAttributeUnhover();" onclick="addAttributeClicked()"/></a>
  	<div id ="addAttributeDescription">add attributes</div>
  <a href="#"><img src="img/importAttribute.png" id="importAttribute" width="40px" height="40px" onmouseover="importAttributeHover();" onmouseout="importAttributeUnhover();" onclick="importAttributeClicked()"/></a>
    <div id ="importAttributeDescription">import attributes</div>
  <a href="#"><img src="img/editAttribute.png" id="editAttribute" width="40px" height="40px" onmouseover="editAttributeHover();" onmouseout="editAttributeUnhover();" onclick="editAttributeClicked()"/></a>
  	<div id ="editAttributeDescription">edit attributes</div>

  <a href="#"><img src="img/saveAttribute.png" id="saveAttribute" width="40px" height="40px" onmouseover="saveAttributeHover();" onmouseout="saveAttributeUnhover();" onclick="saveAttributeClicked()"/></a>
    <div id ="saveAttributeDescription">save attributes</div>
    
</div>




<div id="popupMenu">
  <a href="#"><img src="img/cat_1.png" id="cat_1" width="100px" height="100px" onclick="expand_cat_1()"/></a>
  <a href="#"><img src="img/cat_2.png" id="cat_2" width="100px" height="100px" onclick="expand_cat_2()"/></a>
  <a href="#"><img src="img/cat_3.png" id="cat_3" width="100px" height="100px" onclick="expand_cat_3()"/></a>
</div>

<div id="cat_1_menu" class = "cat_menu">
  <a href="#"><img src="img/cat_1_1.png" id="cat_1_1" width="100px" height="100px" onclick="create_cat_1_1()"/></a>
  <a href="#"><img src="img/cat_1_2.png" id="cat_1_2" width="100px" height="100px" onclick="create_cat_1_2()"/></a>
</div>

<div id="cat_2_menu" class = "cat_menu">
  <a href="#"><img src="img/cat_2_1.png" id="cat_2_1" width="100px" height="100px" onclick="create_cat_2_1()"/></a>
  <a href="#"><img src="img/cat_2_2.png" id="cat_2_2" width="100px" height="100px" onclick="create_cat_2_2()"/></a>
</div>

<div id="cat_3_menu" class = "cat_menu">
  <a href="#"><img src="img/cat_3_1.png" id="cat_3_1" width="100px" height="100px" onclick="create_cat_3_1()"/></a>
  <a href="#"><img src="img/cat_3_2.png" id="cat_3_2" width="100px" height="100px" onclick="create_cat_3_2()"/></a>
  <a href="#"><img src="img/cat_3_3.png" id="cat_3_3" width="100px" height="100px" onclick="create_cat_3_3()"/></a>
</div>

<script>

/* This simply provides choices of module type
*/
var module_type_gen = 
	["title_content_fixed",
	 "title_content_flexible"
	];


/*
 * This class helps keep track of the location of the attributes
 * depends on which templates the user chooses
 * module_type the type of module provided
 * title_x the distance from the title to the left margin
 * title_y the distance from the title to the top margin
 * content_x the distance from the content to the left margin
 * content_y the distance from the content to the top margin
*/
var Location_class = function(){
	this.module_type = "";
	this.title_x = -1;
	this.title_y = -1;
	this.content_x = -1;
	this.content_y = -1;
}
/*
 * This function will get the module type
*/
Location_class.prototype.get_module_type = function(){
	return this.module_type;
}
/*
 * This function will set the module type to the provided value
 * @param type module_type
*/
Location_class.prototype.set_module_type = function(type){
	this.module_type = type;
}
/*
 * This function will get the coordinate
*/
Location_class.prototype.get_coord = function(){
	return [this.title_x, this.title_y, this.content_x, this.content_y];
}
/*
 * This function will set the coordinate to the provided value
 * t_x the distance from the title to the left margin
 * t_y the distance from the title to the top margin
 * c_x the distance from the content to the left margin
 * c_y the distance from the content to the top margin
*/
Location_class.prototype.set_coord = function(t_x, t_y, c_x, c_y){
	this.title_x = t_x;
	this.title_y = t_y;
	this.content_x = c_x;
	this.content_y = c_y;
}

/*
 * This class helps keep track of the attribute added
 * name the value user enters
 * identifier the random key generates to keep track of the element
*/

var Attribute_class = function(){
	this.attribute_name = "";
	this.attribute_order = 0; // the position in the output interface list
	this.location = new Location_class(); // this will be something related to template
}
/*
 * This function will get the name inside the attribute
*/
Attribute_class.prototype.get_name = function(){
	return this.attribute_name;
}
/*
 * This function will get the identifier inside the attribute
*/
Attribute_class.prototype.get_identifier = function(){
	return this.attribute_identifier;
}
/*
 * This function will set the name inside the attribute
 * @param name the pending name
*/
Attribute_class.prototype.set_name = function(name){
	this.attribute_name = name;
}
/*
 * This function will set the identifier inside the attribute
 * @param identifier the pending identifier
*/
Attribute_class.prototype.set_identifier = function(identifier){
	this.attribute_identifier = identifier;
}

/*
 * This class helps keep track of the all the attributes that have been created
 * list the list that matches the attribute
*/
var Attribute_class_list = function(){
	this.list = [];
}
/*
 * This function will get the name inside the attribute
*/
Attribute_class_list.prototype.get_list = function(){
	return this.list;
}
/*
 * This function will get the attribute in the target position
 * @param pos the target position
*/
Attribute_class_list.prototype.get_attribute = function(pos){
	return (this.list)[pos];
}

/*
 * This function will add a new attribute to the attribute list
 * @param new_attribute_name the new attribute name
*/
Attribute_class_list.prototype.add_attribute = function(new_attribute_name){
	var new_attribute = new Attribute_class();
	new_attribute.set_name(new_attribute_name);
	new_attribute.set_identifier(guid());
	this.list.push(new_attribute);
}
/*
 * This function will determine if the attribute list has the selected attribute
 * @param selected_attribute_name the selected attribute name
*/
Attribute_class_list.prototype.find_attribute = function(selected_attribute_name){
	for (var i = 0; i < this.list.length; i ++) {
	    if((this.list)[i].get_name() === selected_attribute_name){
	    	return [true, i];
	    }
	}
	return [false, -1];
}
/*
 * This function will delete the specified attribute
 * @param selected_attribute_name the selected attribute name
*/
Attribute_class_list.prototype.delete_attribute = function(selected_attribute_name){
	var delete_tuple = (this.find_attribute(selected_attribute_name));
	if(delete_tuple[0]){ // if the list has the attribute
		//console.log(this.get_attribute(delete_tuple[1]));
		this.get_list().splice(delete_tuple[1], 1);
	}
}
var all_attribute = new Attribute_class_list(); // the global variable of all the current attribute





/*
 * This is a test function for attributes implementation
*/

function attribute_test(){
	var test_list = new Attribute_class_list();
	test_list.add_attribute("hello");
	test_list.add_attribute("nice");
	console.log(test_list.get_attribute(0));
	console.log(test_list.get_attribute(1));
	test_list.delete_attribute("hello");
	console.log(test_list.get_attribute(0));
	console.log(test_list.get_attribute(1));
	test_list.delete_attribute("nice");
	console.log(test_list.get_attribute(0));
	console.log(test_list.get_attribute(1));
	console.log("done_test");
}


function addschema(){
	if ($(".tblsearch tr.searchselected").html() == "undefined"){
		alert("Select a schema to add");
	}
	else{
		//var attributename=document.getElementById("inputsearch").value;
		var attributename=$(".tblsearch tr.searchselected").closest('table').attr('id').replace("tblsearch_","");
		var passName=document.getElementById("name").innerText;
		//attributename=attributename.replace("tblsearch_","");
		var fields=[];
		var type=[];
		
		var res =$(".tblsearch tr.searchselected").find("td:first").text();
		var res = res.split("Fields:Source: "); 
		var source=res[1];
		
		console.log(source);
		
		$(".tblsearch tr.searchselected td:not(:first-child)").each(function(){
				var res = $(this).html().split("<br>"); 
				fields.push(res[0]);
				type.push(res[1]);
		})
		
		
		if (source=="Manual"){
		var attributes=[attributename];
	   	
	   	$.ajax({
			url: 'templates/edit_attribute_left.tpl',
			async: false,
			type: 'GET'
		})
		.done(function(template) {
			var $commentsContainer = $('#divadditionalattribute');
		    var old = $commentsContainer.html();
			$('#divadditionalattribute').setTemplate(template);
			$('#divadditionalattribute').processTemplate(attributes);
			$('#divadditionalattribute').prepend(old);
			
		});
	   	$.ajax({
			url: 'templates/edit_attribute_right.tpl',
			async: false,
			type: 'GET'
		})
		.done(function(template) {
			var $commentsContainer = $('#divadditionalattributeright');
		    var old = $commentsContainer.html();
			$('#divadditionalattributeright').setTemplate(template);
			$('#divadditionalattributeright').processTemplate(attributes);
			$('#divadditionalattributeright').prepend(old);
			
		});
	   	
	   	var datas={};
		datas['Name']=attributename;
		
		datas['fields']=fields;
		
		datas['data']=[];
		var row={};
		for(var i=0;i<datas['fields'].length;i++){
			var key=datas['fields'][i];
			row[key]={}
			row[key]['value']='';	
			row[key]['type']=type[i];	
			
		}
		datas['data'].push(row);
	
		console.log(datas);
						
		$.ajax({
			url: 'templates/edit_employment.tpl',
			async: false,
			type: 'POST'
		})
		.done(function(template) {
			//$('#divtbl_'+attributename).setTemplate(template);
			//$('#divtbl_'+attributename).processTemplate(datas);
			$("div[id='divtbl_"+attributename+"']").setTemplate(template);
			$("div[id='divtbl_"+attributename+"']").processTemplate(datas);
		});
		alert(attributename+ " has been added.");
			
	}
		else if(source=="GoogleScholar"){
			var url = prompt("Please enter the google scholar url", "");
			console.log(url);
			console.log(attributename);
			attributename="GoogleScholar-"+attributename;
			if(document.getElementById(attributename)){
				alert("Attribute already exists.")
			}
			else{
				importpub(url,attributename);
				alert(attributename+ " has been added from GoogleScholar.");
			}
			
			
			
		}		
		else if(source=="NSF"){
			//var fullName="Jiawei Han";
			attributename="NSF-"+attributename;
			if(document.getElementById(attributename)){
				alert("Attribute already exists.")
			}
			else{
				nsfimport(passName,attributename);
				alert(attributename+ " has been added from NSF.");
			}
			
			
		}
		
		else if(source=="Justia "){
			//var fullName="Jiawei Han";
			attributename=attributename;
			if(document.getElementById(attributename)){
				alert("Attribute already exists.");
			}
			else{
				JustiaSearchimport(passName,attributename);
				alert(attributename+ " has been added from Justia.");
			}
			
			
		}
		else if(source==" Science Direct"){
			//var fullName="Jiawei Han";
			attributename=attributename;
			if(document.getElementById(attributename)){
				alert("Attribute already exists.");
			}
			else{
				scienceDirectimport(passName,attributename);
				alert(attributename+ " has been added from Science Direct.");
			}
			
			
		}
		
		else if(source==" videolectures.net"){
			//var fullName="Jiawei Han";
			attributename=attributename;
			if(document.getElementById(attributename)){
				alert("Attribute already exists.");
			}
			else{
				videolecturesimport(passName,attributename);
				alert(attributename+ " has been added from videolectures.");
			}
			
			
		}
		else if(source==" LinkedIn" || source=="LinkedIn" || source=="LinkedIn "){
			var username = prompt("Please enter your LinkedIn username. Please make sure your profile is publicly available.", "");
			console.log(url);
			console.log(attributename);
			attributename=attributename;
			if(document.getElementById(attributename)){
				alert("Attribute already exists.")
			}
			else{
				openlinkedinprofile(username,attributename);
				alert(attributename+ " has been added from LinkedIn.");
			}
			
			
			
		}
		else{
			alert("Source not found '"+source+"'");
		}
		getdropdownlist(attributename+"_newcol")
		
		$(".tblsearch tr.searchselected").each(function(){
			$(this).removeClass('searchselected');     
		});
			
	}
	    
}

function openlinkedinprofile(username,attributename)
{
	var reurl = 'https://www.linkedin.com/in/'+username;
	 
	 $.ajax({ url: reurl, 
		 success: function(data) {
		//console.log(data);
	  getlinkedin(data,function(data_returned){
			console.log("after return");
			console.log(data_returned);
			var attributes=[attributename];
			console.log(attributes);
			if(data_returned.length==0){
				alert("No data found on LinkedIn");
			}
			else{
			importdata(attributes,data_returned);
			}
			},function(err){
			console.log("Error");
			});
		 } });
}





var cat1_sub = document.getElementById("cat_1_menu");
var cat2_sub = document.getElementById("cat_2_menu");
var cat3_sub = document.getElementById("cat_3_menu");
var popup_menu = document.getElementById("popupMenu");








function expand_cat_1(){
	cat1_sub.style.left = "250px";
	cat2_sub.style.left = "-200px";
	cat3_sub.style.left = "-200px";
}

function expand_cat_2(){
	cat1_sub.style.left = "-200px";
	cat2_sub.style.left = "250px";
	cat3_sub.style.left = "-200px";
	
}
function expand_cat_3(){
	cat1_sub.style.left = "-200px";
	cat2_sub.style.left = "-200px";
	cat3_sub.style.left = "250px";
	
}
function close_cat(){
	
	//alert("ss");
	var container = document.getElementById("resize_container");
	com_id_list = []; // reset com_id_list
	$(container).empty(); // reset user_interface
	
	
	popup_menu.style.left = "-200px";
	cat1_sub.style.left = "-200px";
	cat2_sub.style.left = "-200px";
	cat3_sub.style.left = "-200px";
}

</script>








<div id="settings" style="display:none;">
	<span style="font-size:30px;cursor:pointer" onclick="showSettingsMenu()">&#9776; Settings
	</span>
</div>











<%-- 	<div>
		<p>Google Scholar</p>
		<a href="javascript:void(0)" class="closebtn" onclick="hideMainMenu()">&times;</a>
		<span style="font-size:30px;cursor:pointer" onclick="showMainMenu()">&#9776; open</span>
	</div> --%>






<div id="settingsMenu">
	<p>Settings</p>

 
</div>


<div id="generalInfoMenu">


	<p id="generalInfoLabel">General Info</p>
		<!-- <button id="personalImageLabel">Personal image</button>
		<p id="otherInfoLabel">Other info</p> -->
	
	
	
	<div id="imageDragAndDrop">
		<p id="imageDragAndDropTips">Upload your personal image! </p>
		<div id="dropZone"><img src="img/default_profile.png" id="dropZoneImage"></div>
		<div id="typeError"></div>
		<div id="discardImage"> </div>
		
		
		<table id="basicinfo" class="table table-bordered table-striped" style="width: 20%;margin-left: 72px;margin-top: 100px;clear: both">
		<tr id="Name:" style="display:block;">         
			<td width="35%">Name</td>
 			<td id = "haha1" width="65%"><input type='text' id="name" data-type="textarea" data-placement="right" data-title="Enter Name" class="editable editable-click" data-original-title="" title=""></td>
		</tr>
			<!-- <tr id="CurrentPosition" style="display:block;">         
			<td width="35%">Current-Position</td>
 			<td id = "haha2" width="65%"><a href="#" id="currentposition" data-type="textarea" data-placement="right" data-title="Enter Current Position" class="editable editable-click" data-original-title="" title=""></a></td>
		</tr>
			<tr id="Company" style="display:block;">         
			<td width="35%">Company</td>
 			<td id = "haha3" width="65%"><a href="#" id="company" data-type="textarea" data-placement="right" data-title="Enter Current Company" class="editable editable-click" data-original-title="" title=""> </a></td>
		</tr> -->
			<tr id="Address" style="display:block;">         
			<td width="35%">Address</td>
 			<td id = "haha4" width="65%"><textarea id="address" data-type="textarea" data-placement="right" data-title="Enter Current address" class="editable editable-click" data-original-title="" title=""> </textarea></td>
		</tr>
		
	
		</table>
	
	</div>
	
	
	
	
	
	<div id="selectUploadMethod">
		<p id="uploadTitle">Select a way to upload your image!</p>
		
		

		  <ul>
		  <li>
		    <input type="radio" id="f-option" name="selector">
		    <label for="f-option">Drag and drop</label>
		    
		    <div class="check"></div>
		  </li>
		  
		  <li>
		    <input type="radio" id="s-option" name="selector">
		    <label for="s-option">Browse from local directory</label>
		    
		    <div class="check"><div class="inside"></div></div>
		  </li>
		  
		  <li>
		    <input type="radio" id="t-option" name="selector">
		    <label for="t-option">URL fetching</label>
		    
		    <div class="check"><div class="inside"></div></div>
		  </li>
		</ul>

		<button id="optionNextButton" onclick="optionNextButtonIsClicked()">Next</button>

	<script>
	var optionNextValue = 0;
	$('#selectUploadMethod input').on('change', function() {
		$('#optionNextButton').show(500);
		if ($("#f-option").is(":checked")) {
			optionNextValue = 1;
			
		}
        else if ($("#s-option").is(":checked")) {
			optionNextValue = 2;

        }
        else {
			optionNextValue = 3;
        }
	});
	
	function optionNextButtonIsClicked(){
		if (optionNextValue == 1) {
			$('#dragAndDropOption').show();
			dragAndDropActivated = true;
		}
		if (optionNextValue == 2) {
			$('#localBrowseOption').show();
			dragAndDropActivated = false;
		}
		if (optionNextValue == 3) {
			$('#URLFetching').show();
			dragAndDropActivated = false;
			
		}
		
	}
	
	function backToOptionMenu(){
		$('#dragAndDropOption').hide();
		$('#localBrowseOption').hide();
		$('#URLFetching').hide();

	}
	function URLImageLoading(){
		var imageURL = $('#textFieldURL').val()
	    $('#dropZoneImage').attr('src', imageURL);
		
	}
	

	function show_something(a){
		alert(a.value);
		
		
	}
	
	
	

	
	</script>



	<div id="dragAndDropOption">
		<ul id="dragAndDropTitle">Drag and Drop</ul>
		
		<p>1. Choose a local image.</p>
		<p>2. Drag the image to the dashed area.</p>
		<p>3. The preview of the image will show up.</p>
		
		<button onclick="backToOptionMenu()">back</button>
		
		
	</div>

	<div id="localBrowseOption">
		<ul id="dragAndDropTitle">Local Browser</ul>
		
		<p>1. Open the file browser.</p>
		<p>2. Choose the image you want to upload.</p>
		<p>3. The preview of the image will show up.</p>
		
		<input type="file" name="file" id="file" class="inputfile" onchange="readURL(this);"/>
		<label for="file"><img src="img/imageSelect.png" style="width:50px;">Browse an image</label>
		<button onclick="backToOptionMenu()">back</button>
	
	 </div>
	 
	 <div id="URLFetching">
	 	<ul id="dragAndDropTitle">URL Fetching</ul>
	 	
	 	<p>1. Copy the URL of your image.</p>
		<p>2. Paste the URL in the textfield.</p>
		<p>3. The preview of the image will show up.</p>
		<input id="textFieldURL" placeholder="image URL goes here" type="text" onchange="URLImageLoading()">
	 
	 	<button onclick="backToOptionMenu()">back</button>
	 
	 </div>
	 







	
	
	</div>
	
	
	
	
</div>




<script>






var plain_text_or_table_flag = 0 // default set to be plain text mode





var dragAndDropActivated = false;
  function handleFileSelect(evt) {
  	/* $('#typeError').hide(); */

	
    evt.stopPropagation();
    evt.preventDefault();

    var files = evt.dataTransfer.files; // FileList object.

    // files is a FileList of File objects. List some properties.
    var output = [];
    var outputImage;
    for (var i = 0, f; f = files[i]; i++) {
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate ? f.lastModifiedDate.toLocaleDateString() : 'n/a',
                  '</li>');
      outputImage = f;
    }
    
    var typeCheck = (outputImage.type == "image/png") || (outputImage.type == "image/jpeg");
    
    if (typeCheck) {   
		$('#dropZoneImage').attr('src', URL.createObjectURL(outputImage));
    	$('#typeError').css('margin-top',"0px");
    	$('#typeError').css('opacity',"0");
    	$('#dropZoneImage').show();
        $('#dropZone').css('height', 'auto');
    	



    }
    else {
    	$('#typeError').css('margin-top',"75px");
    	$('#typeError').css('opacity',"1");
    	document.getElementById('typeError').innerHTML = "-> Please upload a *.jpg or *.png file";
    }


    
    

    
  }

  function handleDragOver(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
  }

  // Setup the dnd listeners.
  var dropZone = document.getElementById('dropZone');
  
  
  
  
	  dropZone.addEventListener('dragover', handleDragOver, false);
	  dropZone.addEventListener('drop', handleFileSelect, false);


	     function readURL(input) {
	            if (input.files && input.files[0]) {
	                var reader = new FileReader();

	                reader.onload = function (e) {
	                    $('#dropZoneImage')
	                        .attr('src', e.target.result);
	                    $('#dropZoneImage').show();
	                    $('#dropZone').css('height', 'auto');
	                };

	                reader.readAsDataURL(input.files[0]);
	            }
	        }
	  
	  
	function plain_text_mode(){
		document.getElementById("option_plain_text").src = "img/option_plain_text_clicked.png";
		document.getElementById("option_table").src = "img/option_table.png";
		plain_text_or_table_flag = 0; // set to the plain_text mode
	}
	
	function table_mode(){
		document.getElementById("option_plain_text").src = "img/option_plain_text.png";
		document.getElementById("option_table").src = "img/option_table_clicked.png";
		plain_text_or_table_flag = 1; // set to the table mode
	}
	

	function manually_open_step_1(){
		$("#manually_step_1").show(200);
		$("#manually_step_2").hide(200);
		$("#manually_step_3").hide(200);
		
	}
	
	function manually_open_step_2(){
		if(document.getElementById("nameattr").value == ""){
			$("#manually_step_1_alert").show();
			
		}
		else{
			$("#manually_step_1").hide(200);
			$("#manually_step_2").show(200);
			$("#manually_step_3").hide(200);
		}
		
		
	}
	
	function manually_open_step_3(){
		if(plain_text_or_table_flag == 0){
			$("#attribute_content_input").show(200);
			$("#table_content_input").hide(200);
		}
		else{
			$("#attribute_content_input").hide(200);
			$("#table_content_input").show(200);
			
		}
		
		
		$("#manually_step_1").hide(200);
		$("#manually_step_2").hide(200);
		$("#manually_step_3").show(200);
		
	}
</script>









<div id="addAttributeMenu">
	<div  id="myModal">
    <div>
    
      <!-- Modal content-->
      <div>
        <div>
        </div>
        <div>
         <div id="field">
         
			<p style="margin-top:100px;margin-left:75px;color:#808080;font-weight: bold;border-style:none none solid none;border-width:1px;border-color:#E0E0E0;">
				1. Enter the name of the attribute: <br> <br>
			</p>
         	<div id="manually_step_1">
				<p style="margin-top:15px;margin-left:75px;color:#808080;font-weight: bold;border-style:none none solid none;border-width:1px;border-color:#E0E0E0;">
					<input type="text" id="nameattr">
				</p>
				
				<p id= "manually_step_1_alert" style="margin-top:10px;margin-left:75px;color:#808080;font-weight: bold;border-style:none;border-width:1px;border-color:#E0E0E0; display:none;"> Name is not entered ~.</p>
				<button style="margin-top:20px;margin-left:75px;" class="buttonGray" onclick = "manually_open_step_2()">Next</button>
			</div>
			
			<p style="margin-top:25px;margin-left:75px;color:#808080;font-weight: bold;border-style:none none solid none;border-width:1px;border-color:#E0E0E0;"> 2. Select a way to edit your attribute </p>
			
			
			<div id="manually_step_2">
				<img id="option_plain_text" src="img/option_plain_text_clicked.png" style="margin-top: 20px;margin-left: 75px; width:120px; cursor:pointer" onclick = "plain_text_mode()">
				<img id="option_table" src="img/option_table.png" style="margin-top: 20px;margin-left: 75px; width:120px; cursor:pointer" onclick = "table_mode()">
				<button style="margin-top:20px;margin-left:75px;" class="buttonGray" onclick = "manually_open_step_1()">Back</button>
				<button style="margin-top:20px;margin-left:75px;" class="buttonGray" onclick = "manually_open_step_3()">Next</button>
				
			</div>
			
			<p style="margin-top:25px;margin-left:75px;color:#808080;font-weight: bold;border-style:none none solid none;border-width:1px;border-color:#E0E0E0;"> 3. Quick edit your attribute </p>
			
			<div id="manually_step_3">

			
			
				<textarea id = 'attribute_content_input' style = "border-style: none; margin-left: 75px; width: 500px; height: 100px;"></textarea>
				
				<button style="margin-top:20px;margin-left:75px;" class="buttonGray" onclick = "manually_open_step_2()">Back</button>
				
				<button id="btnAddNew" class="buttonGray" style="margin-top:20px;margin-left:25px;" onclick="addnewattribute(document.getElementById('nameattr').value)">Done</button>
				
				
				
				<div id="table_content_input">
			<p style="margin-top:20px;margin-left:75px;color:#808080;font-weight: bold;border-style:none none solid none;border-width:1px;border-color:#E0E0E0;">
			Description: <textarea id="description" rows="2" cols="50"> </textarea><br/>
			<!--  Source: <textarea id="source" rows="2" cols="50"> </textarea><br/>--> </p>
			<button id="btnfield" class="buttonGray" style="margin-top:50px;margin-left:75px;" onclick="addnewfield()">+ Add More Field</button>
			
			
			<p style="margin-left:75px;margin-top:30px;color:#808080;font-weight: bold;font-family: Courier New;">
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
			  <button class="buttonGray" style="margin-left: 11.5px;width:25px;" onclick="removefield(this);">X</button>
			  </p>
			  
			  
			  	
			  	   </div>
			 	

			  
			  
			</div>
 			  
			  
			</div>
			
			
						
			
			</div>
			
			
			
			
			
        	
        	<div style="top: 75px;
					right: 150px;
					position: fixed;
					z-index:2;">
        		<button class="buttonGray" style="margin-top:30px;margin-left:75px;" onclick="addAttributeCancel()">Cancel</button>
        	</div>
        	

        	
     </div>
     </div>
  	</div>
  

</div>



<script>
var manually_step_1_textfield = document.getElementById("nameattr");
manually_step_1_textfield.addEventListener('keyup', function(){
	if(document.getElementById("nameattr").value == ""){
		$("#manually_step_1_alert").show();
		
	}
	else{
		$("#manually_step_1_alert").hide();
	}
  });
</script>






<div id="editAttributeMenu">
	<div id='editAttributeLabel'>
		<p>Edit Attributes</p>
		<input id="searchAttribute" type="text" name="searchAttribute" placeholder="search attribute" onkeyup = "displayMatchedAttributes()" style="margin-left:1.8%;"><br>
		<div id="sortDropDown">
  			<button class="buttonGray">Sort by</button>
  				<div class="dropDownContent">
    				<a href="#" onclick="rearrangeAttributes(false)">Ascending alphabetic</a>
    				<a href="#" onclick="rearrangeAttributes(true)">Descending alphabetic</a>
    				<a href="#">more</a>
  				</div>
		</div>
	</div>
	
	<!-- 			<div id="div_attribute"></div>
 -->
<!--  	<div id="addAttributeButton"  data-toggle="modal" data-target="#myModal1">+ Add attribute</div>
 --> 
	
	
	
		<div id="attributeDisplay">
			<div id="divadditionalattribute"></div>
				<div id="editAttributeExpand" style="top: 50px;
					right: 50px;
					position: fixed;
					display:block;
					">
        			<button class="buttonGray" style="margin-top:30px;" onclick="editAttributeExpand()">Expand</button>
        		</div>
        		
        		
        		<div id="editAttributeDone" style="top: 50px;
					right: 50px;
					position: fixed;
					display:none;
					">
        			<button class="buttonGray" style="margin-top:30px;" onclick="editAttributeDone()">Done</button>
        		</div>
        	</div>
        		
		</div>
	
	

	

</div>







<div id="saveAttributeMenu">
	<div id='saveAttributeProcedure'>
		<div id='saveAttributeProcedureTitle'>
			<p>Save and construct your CV!</p>
		</div>
		
		<div id='saveAttributeProcedure1'>
			<p>
			1. Select attributes
			</p>
			<div id="saveAttributeProcedure1Contents">
			<div id="selectedAttributes">
			</div>
			<button id = "procedure1Next" class="buttonGray" onclick="expandProcedure2()">
			next
			</button>
			
			</div>
		</div>
		
		<div id='saveAttributeProcedure2'>
			<p>
			2. Choose CV template
			</p>
			
			<div id="saveAttributeProcedure2Contents">
			<div id="template_selection" class="checkbox-wrapper">
    			<!-- <img src="img/template.png" style="width:120px;float:left">    			
    			<img src="img/template.png" style="width:120px;float:left"> -->
    			
    			
    			
			</div>
			
			    <img src="img/addTemplate.png" id = "addTemplateButton" style="width:100px; margin-top: 50px; margin-left: 100px;opacity: 0.2;">
			
			
 				<div id="addTemplatePopup" class="popup" style='text-align: right;'>
<!-- 				  <div id = "popup-toorbar" style='display: inline-block;'>
					<img id = "popupTitle" onclick="createA()" src="img/popupTitle.png" style= "padding: 0px 20px; width: 30px;">
					<img id = "popupLine" onclick="createB()" src="img/popupLine.png" style= "padding: 0px 20px; width: 30px;">
					<img id = "popupContent" onclick="createC()" src="img/popupContent.png" style= "padding: 0px 20px; width: 30px;">
					<img id = "popupImage" onclick="createD()" src="img/popupImage.png" style= "padding: 0px 20px; width: 30px;">
					
					
					
					
					
					
				  </div> -->
				
				
				
				  <div id="popup-content" style='display: inline-block;'>
				    <span id = "popupClose" class="popup-close">×</span>
				    <button id = "new_template_button" class = "buttonGray" onclick = "save_new_template(new_template_list_pos)"> Save new template </button>
				    
				    <button id = "modify_template_button" class = "buttonGray" onclick = "save_modified_template(current_template_list_pos)" style= "display:none"> Save edited template </button>
				    
				    
				    
					<div id = "resize_container" class="resize-container">
<!-- 					<div id ="interesting" class="resize-drag" style="position: absolute">
					     <p>  </p>
					</div> -->

					
					
					
					</div>
				    
				    
				    
				    
				    
				    
				    
				  </div>
				</div>
				
				
				
				
			<div id = "procedure2BackNext">
			
				<button id = "procedure2Back" class="buttonGray" onclick="expandProcedure1()">
				back
				</button>
				<button id = "procedure2Next" class="buttonGray" onclick="expandProcedure3()">
				next
				</button>
			</div>
			
			</div>
		</div>
		
		<div id='saveAttributeProcedure3'>
			<p>
			3. Export your CV
			</p>
			<button id="preview_button" class = "buttonGray" onclick = "preview_CV_by_template(current_template_list_pos)" style="display:none">Preview your CV</button>
			<button id="print_CV" class = "buttonGray" style = "display: none;"> Print CV</button>
			<button id = "procedure3Back" class = "buttonGray" style = "display: none" onclick = "expandProcedure2()"> back </button>
			<!-- The Modal -->
			<div id="preview_modal">
			  <!-- Modal content -->
			  
			  
			  <div id = "preview_inner">
			  	<span id = "preview_close">&times;</span>
			    
			    <div id ="preview_CV_content">
			    
			    
			    </div>
			    <!-- <p>Some text in the Modal..</p> -->
			    
			    
			    
			    
			    
			    
			    
			    
			  </div>
			  
			  
			
			</div>
			
			<script>
			
			
			function printElem(divId) {
			    var content = document.getElementById(divId).innerHTML;
			    var mywindow = window.open('', 'Print', 'height=700,width=600');

			    mywindow.document.write('<html><head><title>Print</title>');
			    mywindow.document.write('</head><body >');
			    mywindow.document.write(content);
			    mywindow.document.write('</body></html>');

			    mywindow.document.close();
			    mywindow.focus()
			    mywindow.print();
			    mywindow.close();
			    return true;
			}
			
			
			function avoid_local_variable_replaced_has_title(num, i, uid){
				var container = document.getElementById("resize_container");
				
				var title = document.createElement('div');
				title.setAttribute('class', 'cat_1_1_title');
				title.setAttribute('style', 'position: absolute');
				
				title.setAttribute('id', uid + "_title");
				//title.innerHTML = "title" + com_num;
				title.style.textAlign = "left";
				title.style.marginLeft = template_list[num][i].title_x + "px";
				title.style.marginTop = template_list[num][i].title_y + "px"; // add new stuff
				com_id_list.push(uid);
				//title goes out of bound
				$(title).hover(function(){
					//alert(title.id);
					title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
				    }, function(){
				    	title.innerHTML = "";
				    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
				    
				});
			    container.appendChild(title);
				
				
			}
			function avoid_local_variable_replaced_is_line(num, i, uid){
				var container = document.getElementById("resize_container");
				
				var title = document.createElement('div');
				title.setAttribute('class', 'cat_3_1_title');
				title.setAttribute('style', 'position: absolute');
				
				title.setAttribute('id', uid + "_title");
				//title.innerHTML = "title" + com_num;
				title.style.textAlign = "left";
				title.style.marginLeft = template_list[num][i].title_x + "px";
				title.style.marginTop = template_list[num][i].title_y + "px"; // add new stuff
				com_id_list.push(uid);
				//title goes out of bound
				$(title).hover(function(){
					//alert(title.id);
					title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
				    }, function(){
				    	title.innerHTML = "";
				    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
				    
				});
			    container.appendChild(title);
				
				
			}
			function avoid_local_variable_replaced_is_dashed_line(num, i, uid){
				var container = document.getElementById("resize_container");
				
				var title = document.createElement('div');
				title.setAttribute('class', 'cat_3_2_title');
				title.setAttribute('style', 'position: absolute');
				
				title.setAttribute('id', uid + "_title");
				//title.innerHTML = "title" + com_num;
				title.style.textAlign = "left";
				title.style.marginLeft = template_list[num][i].title_x + "px";
				title.style.marginTop = template_list[num][i].title_y + "px"; // add new stuff
				com_id_list.push(uid);
				//title goes out of bound
				$(title).hover(function(){
					//alert(title.id);
					title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
				    }, function(){
				    	title.innerHTML = "";
				    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
				    
				});
			    container.appendChild(title);
				
				
			}
			function avoid_local_variable_replaced_is_image(num, i, uid){
				var container = document.getElementById("resize_container");
				
				var title = document.createElement('div');
				title.setAttribute('class', 'cat_3_3_title');
				title.setAttribute('style', 'position: absolute');
				
				title.setAttribute('id', uid + "_title");
				//title.innerHTML = "title" + com_num;
				title.style.textAlign = "left";
				title.style.marginLeft = template_list[num][i].title_x + "px";
				title.style.marginTop = template_list[num][i].title_y + "px"; // add new stuff
				com_id_list.push(uid);
				//title goes out of bound
				$(title).hover(function(){
					//alert(title.id);
					title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
				    }, function(){
				    	title.innerHTML = "";
				    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
				    
				});
			    container.appendChild(title);
				
				
			}
			
			function avoid_local_variable_replaced_has_no_title(num, i, uid){
				var container = document.getElementById("resize_container");
				
				var title = document.createElement('div');
				//title.setAttribute('class', 'cat_1_1_title');
				title.setAttribute('style', 'position: absolute');
				title.setAttribute('id', uid + "_title");
				//title.innerHTML = "title" + com_num;
				title.style.textAlign = "left";
				title.style.marginLeft = template_list[num][i].title_x + "px";
				title.style.marginTop = template_list[num][i].title_y + "px"; // add new stuff
				com_id_list.push(uid);
				//title goes out of bound
				$(title).hover(function(){
					//alert(title.id);
					title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
				    }, function(){
				    	title.innerHTML = "";
				    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
				    
				});
			    container.appendChild(title);
				
				
			}
			
			
			function avoid_local_variable_replaced_has_content(num, i, uid){
				var container = document.getElementById("resize_container");
				
				var content = document.createElement('div');
				content.setAttribute('class', 'cat_1_1_content');
				content.setAttribute('style', 'position: absolute');
				content.setAttribute('id', uid + "_content");
				//content.innerHTML = "content" + com_num;
				com_num += 1;
				content.style.textAlign = "left";
				
				content.style.marginLeft = template_list[num][i].content_x + "px";// add new stuff
				content.style.marginTop = template_list[num][i].content_y + "px";
				
				$(content).hover(function(){
					//alert(title.id);
					content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
				    }, function(){
				    	content.innerHTML = "";
				    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
				    
				});
				
			    container.appendChild(content);
				
				
			}
			
			
			function avoid_local_variable_replaced_has_no_content(num, i, uid){
				var container = document.getElementById("resize_container");
				var content = document.createElement('div');
				//content.setAttribute('class', 'cat_1_1_content');
				content.setAttribute('style', 'display: none');
				content.setAttribute('style', 'position: absolute');
				content.setAttribute('id', uid + "_content");
				//content.innerHTML = "content" + com_num;
				com_num += 1;
				content.style.textAlign = "left";
				
				content.style.marginLeft = template_list[num][i].content_x + "px";// add new stuff
				content.style.marginTop = template_list[num][i].content_y + "px";
				
				$(content).hover(function(){
					//alert(title.id);
					content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
				    }, function(){
				    	content.innerHTML = "";
				    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
				    
				});
			    container.appendChild(content);
			}
			
			
			function load_by_template(num){ // probably some bugs here
				
				//console.log(chosen_template);

				
  				com_num = 1;
			    //parse_delete_list = [];
				var container = document.getElementById("resize_container");
				var container_abs_pos = container.getBoundingClientRect();
				for (var i = 0; i < template_list[num].length; i ++){
					var container = document.getElementById("resize_container");
					var uid = guid();
					//alert(template_list[num][i].title_x);
					if (template_list[num][i].title_x >= 0 && template_list[num][i].title_y >= 0){
						if(template_list[num][i].title_height == 2){
							avoid_local_variable_replaced_is_line(num, i, uid);
						}
						else if (template_list[num][i].title_height == 3){ // definitely needed to be modified, to match the dahsed line property. 
							avoid_local_variable_replaced_is_dashed_line(num, i, uid);
						}
						else if (template_list[num][i].title_height == 150){
							avoid_local_variable_replaced_is_image(num, i, uid);
						}
						else{
							avoid_local_variable_replaced_has_title(num, i, uid);
						}
						
					}
					else{
						avoid_local_variable_replaced_has_no_title(num, i, uid);
						
					}
			
				    //alert(template_list[num][i].content_x);
				    if (template_list[num][i].content_x >= 0 && template_list[num][i].content_y >= 0){
				    	avoid_local_variable_replaced_has_content(num, i , uid);
				    }
				    else{ // if it is simply a simply a title simply hide the content and we are done
				    	avoid_local_variable_replaced_has_no_content(num, i, uid);
				    }
					
					
					
				}

				
				
				
			}
			
			
			
			
			
			function preview_CV_by_template(num){ // here chosen template is the inner template that comes into use
				//alert(template_list);
				//preview_inner.innerHTML = "";
				preview_modal.style.display = "block";
				var container_temp = document.getElementById("preview_CV_content");
				container_temp.innerHTML = "";
				var container_abs_pos_temp = container_temp.getBoundingClientRect();
				var container_x = container_abs_pos_temp.left;
				var container_y = container_abs_pos_temp.top;

				
				var attribute_list_index = 0;
				var template_list_index = 0;

				//alert(attributeList.length);
				//alert(template_list[num].length);
			
				while (template_list_index < template_list[num].length){ //i j need to be used
					if(template_list[num][template_list_index].title_height != 2 && template_list[num][template_list_index].title_height != 3 && template_list[num][template_list_index].title_height != 150 && template_list[num][template_list_index].title_x >= 0 && template_list[num][template_list_index].title_y >= 0 && template_list[num][template_list_index].content_x >= 0 && template_list[num][template_list_index].content_y >= 0){ // need to be modified later
						var x = document.createElement("p");
					    //x.setAttribute("type", "text");
						x.innerHTML = attributeList[attribute_list_index].id.substring(14);
	
					    
					    
						var title_pos_x = template_list[num][template_list_index].title_x;
						var title_pos_y = template_list[num][template_list_index].title_y;
						var sum1 = title_pos_x;
						var sum2 = title_pos_y;
	
						
						x.style.position = "absolute";
						x.style.marginLeft = sum1 + "px";
					    x.style.marginTop = sum2 + "px";
						
						container_temp.appendChild(x);
						
						
						
						var y = document.createElement("TEXTAREA");
						
					    y.setAttribute("type", "text");
					    				    
					    var t_plain = document.createTextNode(document.getElementById("plain_content_" + attributeList[attribute_list_index].id.substring(14)).value);
					    var t_table = document.createTextNode(document.getElementById("tbl_" + attributeList[attribute_list_index].id.substring(14)).innerHTML);
					    y.style.boxShadow = "none";
					    y.style.border = "none";
					    y.style.overflow = "hidden";
					    y.style.resize = "none";
					    y.style.backgroundColor = "white";
					    y.style.cursor = "text";
					    y.style.height = "100px";// 1
					    y.style.width = "300px"; //2
					    y.disabled = "true";
	    				y.appendChild(t_plain);
	    				//y.appendChild(t_table);
						//y.setAttribute("value", document.getElementById("fortest").value);
	
						var content_pos_x = template_list[num][template_list_index].content_x;
						var content_pos_y = template_list[num][template_list_index].content_y;
	
						
						var sum3 = content_pos_x;
						var sum4 = content_pos_y;
	
						y.style.position = "absolute";
					    y.style.marginLeft = sum3 + "px";
					    y.style.marginTop = sum4 + "px";
					    container_temp.appendChild(y);
					    attribute_list_index ++;
					    template_list_index ++;
	
						//alert(sum1);
						//alert(sum2);
						//alert(sum3); //for later testing purpose 
						//alert(sum4);
					}
					/* else if (template_list[num][template_list_index].title_height == 2){
						template_list_index += 1;
						var x = document.createElement("p");
						x.style.border = "solid";
						x.style.height = "0px";
						x.style.width = "300px";
						container_temp.append(x);// probably need to be modified
					} */
					
					if ((template_list[num][template_list_index].content_x < 0 || template_list[num][template_list_index].content_y < 0) && template_list[num][template_list_index].title_height != 150){
						var x = document.createElement("p");
						x.innerHTML = document.getElementById("name").value;
						var title_pos_x = template_list[num][template_list_index].title_x;
						var title_pos_y = template_list[num][template_list_index].title_y;
						var sum1 = title_pos_x;
						var sum2 = title_pos_y;
	
						
						x.style.position = "absolute";
						x.style.marginLeft = sum1 + "px";
					    x.style.marginTop = sum2 + "px";
						
						container_temp.appendChild(x);
						template_list_index ++;
						
					}
					
					if ((template_list[num][template_list_index].title_x < 0 || template_list[num][template_list_index].title_y < 0) && template_list[num][template_list_index].title_height != 150){
						var y = document.createElement("TEXTAREA");
						
					    y.setAttribute("type", "text");
					    				    
					    var t_plain = document.createTextNode(document.getElementById("address").value);
					    y.style.boxShadow = "none";
					    y.style.border = "none";
					    y.style.overflow = "hidden";
					    y.style.resize = "none";
					    y.style.backgroundColor = "white";
					    y.style.cursor = "text";
					    y.style.height = "100px";// 1
					    y.style.width = "300px"; //2
					    y.disabled = "true";
	    				y.appendChild(t_plain);
						//y.setAttribute("value", document.getElementById("fortest").value);
	
						var content_pos_x = template_list[num][template_list_index].content_x;
						var content_pos_y = template_list[num][template_list_index].content_y;
	
						
						var sum3 = content_pos_x;
						var sum4 = content_pos_y;
	
						y.style.position = "absolute";
					    y.style.marginLeft = sum3 + "px";
					    y.style.marginTop = sum4 + "px";
					    container_temp.appendChild(y);
					    template_list_index ++;
						
						
					}

					else if (template_list[num][template_list_index].title_height == 150){
						//alert("ndded to be called"); //should be modified since the user may need to modify the size of the image
						var x = document.createElement("img");
						x.innerHTML = "ss";
						//x.style.width = "100px";
						//x.style.height = "150px";
						x.src = document.getElementById("dropZoneImage").src;
							/* document.getElementById("dropZoneImage").innerHTML; */
					    //x.setAttribute("type", "text");
						/* x.innerHTML = "<input type=\"file\" name=\"file\" id= \"file\" class =\"inputfile\" onchange=\"readURL(this);">"; */
						
	
					    
					    
						var title_pos_x = template_list[num][template_list_index].title_x;
						var title_pos_y = template_list[num][template_list_index].title_y;
						var sum1 = title_pos_x;
						var sum2 = title_pos_y;
	
						x.style.height = "150px";
						x.style.position = "absolute";
						x.style.marginLeft = sum1 + "px";
					    x.style.marginTop = sum2 + "px";
						
						container_temp.appendChild(x);
						template_list_index ++;
					}
					
					
					
				}
				
			    
				
				
				
				
			}
			
			
			
			var print_CV_button = document.getElementById('print_CV');
			print_CV_button.onclick = function(){
				printElem("preview_modal");
				
			}
			
			
			
			// Get the modal
			var preview_modal = document.getElementById('preview_modal');
			
			// Get the button that opens the modal
			var preview_button = document.getElementById("preview_button");
			
			// Get the <span> element that closes the modal
			var preview_close = document.getElementById("preview_close");
						
			
			// When the user clicks on <span> (x), close the modal
			preview_close.onclick = function() {
				preview_modal.style.display = "none";
			}
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			    if (event.target == preview_modal) {
			    	preview_modal.style.display = "none";
			    }
			}
			</script>
			
			
			
			
		</div>
		
	</div>
	
	<!-- 			<div id="div_attribute"></div>
 -->
<!--  	<div id="addAttributeButton"  data-toggle="modal" data-target="#myModal1">+ Add attribute</div>
 --> 
	
	
	

	
</div>
	











<div id="importAttributeMenu" >
	<div class="importAttributeMenuLabel">
		<p style="margin-left: 50px;margin-top:75px;">Import</p>
	</div>
	
	<div class="importAttributeMenuLabel">
		<p style="margin-left: 50px;">Google Scholar </p>
		
	</div>
	
	<div class="importAttributeMenuLabel">
		<p style="margin-left: 50px;">LinkedIn Profile </p>		
	</div>
	
	
	
		<div id="importDisplay">
		
		
		
			<div id="linkedinmodal" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div>
			        <div>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 style="color: #808080; margin-top: 75px; margin-left: 75px;">Import from linkedin</h4>
			        </div>
			        <div>
			        <p class = "importAttributeInst">1. Please open another tab and sign in to your linkedin account. </p>
			        <textarea class = "importAttributeInst">Please enter your URL here</textarea>
			        <p class = "importAttributeInst">2. Open your profile and click the plug in on the top right of your page. </p>
			        <p class = "importAttributeInst">3. Select the attributes below that you want to import from linkedin and click the Import button.</p>
			    	
			    	
			    	
						<table>
						  <tr>
						    <td><input type="checkbox" name="attr" value="LinkedIn-ResearchInterest"><b style="font-weight:normal;"> Research Interest</b></td>
						    <td><input type="checkbox" name="attr" value="LinkedIn-CurrentEmployment"><b style="font-weight:normal;"> Current Employment</b></td>
						    <td><input type="checkbox" name="attr" value="LinkedIn-CurrentSchool"> <b style="font-weight:normal;"> Current School</b></td>
						  </tr>
						  <tr>
						    <td><input type="checkbox" name="attr" value="LinkedIn-Location"> <b style="font-weight:normal;"> Location</b></td>
						    <td><button id="btnAddLinkedIn" class="buttonGray" onclick="temp_import()" style="display:block;margin:auto;">Import attributes</button></td>
						    <td><input type="checkbox" name="attr" value="LinkedIn-Summary"> <b style="font-weight:normal;"> Summary</b></td>
						  </tr>
						  <tr>
						    <td><input type="checkbox" name="attr" value="LinkedIn-Employment"> <b style="font-weight:normal;"> Experience</b></td>
						    <td><input type="checkbox" name="attr" value="LinkedIn-Education"> <b style="font-weight:normal;"> Education</b></td>
						    <td><input type="checkbox" name="attr" value="LinkedIn-Picture"> <b style="font-weight:normal;"> Picture</b></td>
						  </tr>
						</table>
			    	
			    	
			    
			    	
 

					
					
					
					
					
					
					
					</div>
			        <div>
			        	
			        </div>
			      </div>
			      
			    </div>
			  </div>
		
		
		
		</div>
	
	
	

</div>



<script src="js/interact.js"></script>



<script>





var com_num = 1;
var com_id_list = [];
var template_list = []; // store all the templates including the system provided template

//var all_com_id_list = [];
function temp_import(){
	console.log("nicena");
	document.getElementById("haha1").innerHTML = "Kaiqi Jiang";
	document.getElementById("haha2").innerHTML = "Student at University of Illinois at Urbana-Champaign";
	document.getElementById("haha3").innerHTML = "University of Illinois at Urbana-Champaign";
	document.getElementById("haha4").innerHTML = "Champaign, Illinois";
	
}


function parse_table_data(){
	
	
	

	
	
}

var new_template_list_pos = 0;
var current_template_list_pos = 0;






function save_new_template(num){
	
	var template_beta = []; // store the all the dimensions data
	var template_image = [];
	var container = document.getElementById("resize_container");
	var container_abs_pos = container.getBoundingClientRect();
	for (var i = 0; i < com_id_list.length; i ++){
		var title = document.getElementById(com_id_list[i] + "_title");
		var content = document.getElementById(com_id_list[i] + "_content");
		var title_abs_pos = title.getBoundingClientRect();
		var content_abs_pos = content.getBoundingClientRect();
		var title_rel_pos_x = title_abs_pos.left - container_abs_pos.left;
		var title_rel_pos_y = title_abs_pos.top - container_abs_pos.top;
		var content_rel_pos_x = content_abs_pos.left - container_abs_pos.left;
		var content_rel_pos_y = content_abs_pos.top - container_abs_pos.top;
		current_dim = new Object();
		current_dim.title_x = title_rel_pos_x;
		current_dim.title_y = title_rel_pos_y;
		current_dim.content_x = content_rel_pos_x;
		current_dim.content_y = content_rel_pos_y;
		
		current_dim.title_height = title.offsetHeight; // ==2 means line
		//alert(title.offsetHeight);
		template_beta.push(current_dim);
		
	}
	//alert(com_id_list);
	//all_com_id_list.push(com_id_list);
	
	com_num = 1; // reset com_num, this should be saved in some manner.
	com_id_list = []; // reset com_id_list this should be most importantly saved in some manner.
	$(container).empty(); // reset user_interface
	
	var popupTemplate = document.getElementById('addTemplatePopup');
	var popupOtherArea = document.getElementsByClassName("popup-close")[0];
	var addTemplateButtonClicked = document.getElementById("addTemplateButton");
	var popupLeftToolbar = document.getElementById("popupMenu");
	
	popupTemplate.style.display = "none";
	popupLeftToolbar.style.left = "-100px";
	close_cat();
	//alert(template_beta);
	template_list.push(template_beta); //need to be modified
	
	
	var new_template = document.createElement("img");
	new_template.src = "img/template.png";
	new_template.style.width = "120px";
	new_template.style.cssFloat = "left";
	
/* 	var line_break = document.createElement("br");
 */
 // jot down the position of the the data (can be modified not based on the index, instead the dynamic position, but is hard.)
 
 
 
	var button_edit = document.createElement("button");
	button_edit.setAttribute("class", "buttonGray");
	button_edit.innerHTML = "edit";
	button_edit.style.cssFloat = "left";
	button_edit.onclick = function(){
		$("#new_template_button").hide();
		$("#modify_template_button").show();
		
		//console.log(template_list);
		//console.log(template_list[pos]);
		current_template_list_pos = num;
		//current_template_selected = template_list[num];
		//console.log("num" + num);
		//console.log("current" + current_template_list_pos);
		load_by_template(num); // It is loaded, but it appears that this can only display the previous content, cannot modified it
		// also cannot keep track of its resizing, and other activity.
		
		//com_id_list = []; // this is not correct.
		//com_id = 1; // not correct
		popupTemplate.style.display = "block";
		popupLeftToolbar.style.left = "75px";
	}
	
	var button_select = document.createElement("button");
	button_select.setAttribute("class", "buttonGray");
	button_select.innerHTML = "select";
	button_select.style.cssFloat = "left";
	button_select.onclick = function(){
		//current_template_selected = template_list[num];
		current_template_list_pos = num;
	}	
	var image_button_pack = document.createElement("div");
	image_button_pack.appendChild(new_template);
	image_button_pack.appendChild(button_edit);
	image_button_pack.appendChild(button_select);
	document.getElementById("template_selection").appendChild(image_button_pack);
	
	new_template_list_pos += 1;
	//to do here implement this
	
	//console.log(template_list);
}


function save_modified_template(num){
	
	
	
	//current_template_selected = template_list[num];
	//console.log(template_list[num]);
	//some error appear in the com_list, com_list_get emptieid
	
	com_num = 1;
	
	
	
	
	
	var template_beta = []; // store the all the dimensions data
	var container = document.getElementById("resize_container");
	
	var container_abs_pos = container.getBoundingClientRect();
	
	//com_num = 1;
	//load_by_template(num); //cannot be purely load in this way, since com_id_list is not loaded. since no new elements have been added, com_id list remains empty unless you create a new element.
	//also needs to update the elemnt insie.
	//com_id_list = com_id_list = all_com_id_list[num];
	// need to keep track of the com_id_list also.!!!
	
	for (var i = 0; i < com_id_list.length; i ++){
		var title = document.getElementById(com_id_list[i] + "_title");
		var content = document.getElementById(com_id_list[i] + "_content");
		var title_abs_pos = title.getBoundingClientRect();
		var content_abs_pos = content.getBoundingClientRect();
		var title_rel_pos_x = title_abs_pos.left - container_abs_pos.left;
		var title_rel_pos_y = title_abs_pos.top - container_abs_pos.top;
		var content_rel_pos_x = content_abs_pos.left - container_abs_pos.left;
		var content_rel_pos_y = content_abs_pos.top - container_abs_pos.top;
		current_dim = new Object();
		current_dim.title_x = title_rel_pos_x;
		current_dim.title_y = title_rel_pos_y;
		current_dim.content_x = content_rel_pos_x;
		current_dim.content_y = content_rel_pos_y;
		current_dim.title_height = title.offsetHeight;
		template_beta.push(current_dim);
		
	}
	com_num = 1; // reset com_num
	com_id_list = []; // reset com_id_list
	$(container).empty(); // reset user_interface
	
	var popupTemplate = document.getElementById('addTemplatePopup');
	var popupOtherArea = document.getElementsByClassName("popup-close")[0];
	var addTemplateButtonClicked = document.getElementById("addTemplateButton");
	var popupLeftToolbar = document.getElementById("popupMenu");
	
	popupTemplate.style.display = "none";
	popupLeftToolbar.style.left = "-100px";
	close_cat();
	//alert(template_beta);
	
	
	console.log(template_beta);
	
	template_list[num] = template_beta; //overwrite the data
	
	
	
	
	
}




function PrintElem(elem){
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




function delete_cat(cat){
	var title = document.getElementById(cat + "_title");
	var content = document.getElementById(cat + "_content");
	$(title).remove();
	$(content).remove();
	var temp = com_id_list.indexOf(cat);
	com_id_list.splice(temp, 1);
	new_num = 1;
	for(var i = 0; i < com_id_list.length; i ++){
		var cur_title = document.getElementById(com_id_list[i] + "_title");
		var cur_content = document.getElementById(com_id_list[i] + "_content");
		//cur_title.innerHTML = "title" + new_num;
		//cur_content.innerHTML = "content" + new_num;
		new_num += 1;
	}
	com_num = new_num;
	
}
function guid() {
	  function s4() {
	    return Math.floor((1 + Math.random()) * 0x10000)
	      .toString(16)
	      .substring(1);
	  }
	  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
	    s4() + '-' + s4() + s4() + s4();
}

function create_cat_1_1(){
	var container = document.getElementById("resize_container");
	var title = document.createElement('div');
	title.setAttribute('class', 'cat_1_1_title');
	title.setAttribute('style', 'position: absolute');
	var uid = guid();
	title.setAttribute('id', uid + "_title");
	//title.innerHTML = "title" + com_num;
	title.style.textAlign = "left";
	com_id_list.push(uid);
	$(title).hover(function(){
		title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    title.innerHTML = "";
	});
    container.appendChild(title);

	var content = document.createElement('div');
	content.setAttribute('class', 'cat_1_1_content');
	content.setAttribute('style', 'position: absolute');
	content.setAttribute('id', uid + "_content");
	//content.innerHTML = "content" + com_num;
	com_num += 1;
	content.style.textAlign = "left";
	$(content).hover(function(){
		//alert(title.id);
		content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    	content.innerHTML = "";
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    
	});
    container.appendChild(content);
    
}


function create_cat_1_2(){
	var container = document.getElementById("resize_container");
	var title = document.createElement('div');
	title.setAttribute('class', 'cat_1_2_title');
	title.setAttribute('style', 'position: absolute');
	
	
	var uid = guid();
	title.setAttribute('id', uid + "_title");
	//title.innerHTML = "title" + com_num;
	title.style.textAlign = "left";
	com_id_list.push(uid);
	$(title).hover(function(){
		title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    title.innerHTML = "";
	});
    container.appendChild(title);

	var content = document.createElement('div');
	content.setAttribute('class', 'cat_1_2_content');
	content.setAttribute('style', 'position: absolute');
	content.setAttribute('id', uid + "_content");
	//content.innerHTML = "content" + com_num;
	com_num += 1;
	content.style.textAlign = "left";
	$(content).hover(function(){
		//alert(title.id);
		content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    	content.innerHTML = "";
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    
	});
    container.appendChild(content);
    
}

function create_cat_2_1(){
	var container = document.getElementById("resize_container");
	var title = document.createElement('div');
	title.setAttribute('class', 'cat_2_1_title');
	title.setAttribute('style', 'position: absolute');
	var uid = guid();
	title.setAttribute('id', uid + "_title");
	//title.innerHTML = "title" + com_num;
	title.style.textAlign = "left";
	com_id_list.push(uid);
	$(title).hover(function(){
		title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    title.innerHTML = "";
	});
	
    container.appendChild(title);

    var content = document.createElement('div');
    content.setAttribute('style', 'display: none'); // just hide the pseudo content to simulate a simple title
	//content.setAttribute('class', 'cat_1_2_content');
	content.setAttribute('style', 'position: absolute');
	content.setAttribute('style', 'margin-left: -1000px');
	content.setAttribute('id', uid + "_content");
	//content.innerHTML = "content" + com_num;
	com_num += 1;
	content.style.textAlign = "left";
	$(content).hover(function(){
		//alert(title.id);
		content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    	content.innerHTML = "";
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    
	});
    container.appendChild(content);
    
}


function create_cat_2_2(){
	var container = document.getElementById("resize_container");
	var title = document.createElement('div');
	//title.setAttribute('class', 'cat_2_1');
	title.setAttribute('style', 'display: none');
	title.setAttribute('style', 'position: absolute');// note here
	title.setAttribute('style', 'margin-left: -1000px');
	var uid = guid();
	title.setAttribute('id', uid + "_title");
	//title.innerHTML = "title" + com_num;
	title.style.textAlign = "left";
	com_id_list.push(uid);
	$(title).hover(function(){
		title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    title.innerHTML = "";
	});
    container.appendChild(title);

    var content = document.createElement('div');
	content.setAttribute('class', 'cat_2_2_content');
	content.setAttribute('style', 'position: absolute');
	content.setAttribute('id', uid + "_content");
	//content.innerHTML = "content" + com_num;
	com_num += 1;
	content.style.textAlign = "left";
	$(content).hover(function(){
		//alert(title.id);
		content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    	content.innerHTML = "";
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    
	});
    container.appendChild(content);
}


function create_cat_3_1(){
	var container = document.getElementById("resize_container");
	var title = document.createElement('div');
	title.setAttribute('class', 'cat_3_1_title');
	title.setAttribute('style', 'position: absolute');
	var uid = guid();
	title.setAttribute('id', uid + "_title");
	//title.innerHTML = "title" + com_num;
	title.style.textAlign = "left";
	com_id_list.push(uid);
	$(title).hover(function(){
		title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    title.innerHTML = "";
	});
	
    container.appendChild(title);

    var content = document.createElement('div');
    content.setAttribute('style', 'display: none'); // just hide the pseudo content to simulate a simple title
	//content.setAttribute('class', 'cat_1_2_content');
	content.setAttribute('style', 'position: absolute');
	content.setAttribute('style', 'margin-left: -1000px');
	content.setAttribute('id', uid + "_content");
	//content.innerHTML = "content" + com_num;
	com_num += 1;
	content.style.textAlign = "left";
	$(content).hover(function(){
		//alert(title.id);
		content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    	content.innerHTML = "";
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    
	});
    container.appendChild(content);
    
}

function create_cat_3_2(){
	var container = document.getElementById("resize_container");
	var title = document.createElement('div');
	title.setAttribute('class', 'cat_3_2_title');
	title.setAttribute('style', 'position: absolute');
	var uid = guid();
	title.setAttribute('id', uid + "_title");
	//title.innerHTML = "title" + com_num;
	title.style.textAlign = "left";
	com_id_list.push(uid);
	$(title).hover(function(){
		title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    title.innerHTML = "";
	});
	
    container.appendChild(title);

    var content = document.createElement('div');
    content.setAttribute('style', 'display: none'); // just hide the pseudo content to simulate a simple title
	//content.setAttribute('class', 'cat_1_2_content');
	content.setAttribute('style', 'position: absolute');
	content.setAttribute('style', 'margin-left: -1000px');
	content.setAttribute('id', uid + "_content");
	//content.innerHTML = "content" + com_num;
	com_num += 1;
	content.style.textAlign = "left";
	$(content).hover(function(){
		//alert(title.id);
		content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    	content.innerHTML = "";
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    
	});
    container.appendChild(content);
	
	
}

function create_cat_3_3(){
	var container = document.getElementById("resize_container");
	var title = document.createElement('div');
	title.setAttribute('class', 'cat_3_3_title');
	title.setAttribute('style', 'position: absolute');
	var uid = guid();
	title.setAttribute('id', uid + "_title");
	//title.innerHTML = "title" + com_num;
	title.style.textAlign = "left";
	com_id_list.push(uid);
	$(title).hover(function(){
		title.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    title.innerHTML = "";
	});
	
    container.appendChild(title);

    var content = document.createElement('div');
    content.setAttribute('style', 'display: none'); // just hide the pseudo content to simulate a simple title
	//content.setAttribute('class', 'cat_1_2_content');
	content.setAttribute('style', 'position: absolute');
	content.setAttribute('style', 'margin-left: -1000px');
	content.setAttribute('id', uid + "_content");
	//content.innerHTML = "content" + com_num;
	com_num += 1;
	content.style.textAlign = "left";
	$(content).hover(function(){
		//alert(title.id);
		content.innerHTML = "<button class = \'buttonGray_delete' onclick = \'delete_cat(\""+uid+"\")'> x </button>";
	    }, function(){
	    	content.innerHTML = "";
	    //title.innerHTML = "title" + (com_id_list.indexOf(uid) + 1);
	    
	});
    container.appendChild(content);
	
	
}




/* var element = document.getElementById('grid-snap'),
x = 0, y = 0;

interact(element)
.draggable({
snap: {
  targets: [
    interact.createSnapGrid({ x: 30, y: 30 })
  ],
  range: Infinity,
  relativePoints: [ { x: 0, y: 0 } ]
},
inertia: true,
restrict: {
  restriction: element.parentNode,
  elementRect: { top: 0, left: 0, bottom: 1, right: 1 },
  endOnly: true
}
})
.on('dragmove', function (event) {
x += event.dx;
y += event.dy;

event.target.style.webkitTransform =
event.target.style.transform =
    'translate(' + x + 'px, ' + y + 'px)';
}); */













interact('.cat_1_1_title')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: false, top: false }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});



interact('.cat_1_1_content')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: true, top: true }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});






interact('.cat_1_2_title')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: false, top: false }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});



interact('.cat_1_2_content')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: true, top: true }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});



interact('.cat_2_1_title')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: false, top: false }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});



interact('.cat_2_2_content')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: true, top: true }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});








interact('.cat_3_1_title')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: false, top: false }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});





interact('.cat_3_2_title')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: false, top: false }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});


interact('.cat_3_3_title')
.draggable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
  },  
  onmove: window.dragMoveListener,
  restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    }
})

.resizable({
	snap: {
		targets: [
			interact.createSnapGrid({ x: 20, y: 20 })
		],
		range: Infinity,
		relativePoints: [ { x: 0, y: 0 } ]
	},
  preserveAspectRatio: false,
  edges: { left: true, right: true, bottom: true, top: true }
})
.on('resizemove', function (event) {
  var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

  // update the element's style
  target.style.width  = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';

  // translate when resizing from top or left edges
  x += event.deltaRect.left;
  y += event.deltaRect.top;

  target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
  //target.textContent = Math.round(event.rect.width) + '×' + Math.round(event.rect.height);
});




interact('.draggable')
.draggable({
  // enable inertial throwing
  inertia: true,
  // keep the element within the area of it's parent
  restrict: {
    restriction: "parent",
    endOnly: true,
    elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
  },
  // enable autoScroll
  autoScroll: true,

  // call this function on every dragmove event
  onmove: dragMoveListener,
  // call this function on every dragend event
  onend: function (event) {
    var textEl = event.target.querySelector('p');

    textEl && (textEl.textContent =
      'moved a distance of '
      + (Math.sqrt(event.dx * event.dx +
                   event.dy * event.dy)|0) + 'px');
  }
});







function dragMoveListener (event) {
  var target = event.target,
      // keep the dragged position in the data-x/data-y attributes
      x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
      
      y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;
  // translate the element
  target.style.webkitTransform =
  target.style.transform =
    'translate(' + x + 'px, ' + y + 'px)';

  // update the posiion attributes
  target.setAttribute('data-x', x);
  target.setAttribute('data-y', y);
}

// this is used later in the resizing and gesture demos
window.dragMoveListener = dragMoveListener;








var attributeIndex = 0;
var attributeButtonIndex = 0;
var attributeButtonHashValue = [];
var tableId = [];
var editId = [];
var editImageSelected = true;
var importAttributeSelected = false;
var editAttributeSelected = false;
var addAttributeSelected = false;
var saveAttributeSelected = false;
/* var mainMenuIsHidden = false;
 */

/* function showMainMenu() {
	mainMenuIsHidden = false;
	$('#mainMenu').width(75);
	$('#importAttributeMenu').css('margin-left',"75px");
	$('#settingsMenu').css('margin-left',"75px");



    
} */

/* function hideMainMenu() {
	mainMenuIsHidden = true;
	$('#mainMenu').width(0);
	$('#importAttributeMenu').css('margin-left',"0px");
	$('#settingsMenu').css('margin-left',"-200px");

} */



/* 
function storeAllId(jTemplateId) {
	
	
	
} */



function expandProcedure3(){
	$('#saveAttributeProcedure1Contents').hide();
	$('#saveAttributeProcedure1').animate({height: '20px'});
	
	$('#saveAttributeProcedure2Contents').hide();
	$('#saveAttributeProcedure2').animate({height: '20px'});
	
	$('#saveAttributeProcedure3Contents').show();
	$('#saveAttributeProcedure3').animate({height: '60px'});
	
	$("#preview_button").show(200);
	$("#print_CV").show(200);
	$("#procedure3Back").show(200);
	
}


function expandProcedure2(){
	$('#saveAttributeProcedure1Contents').hide();
	$('#saveAttributeProcedure1').animate({height: '20px'});
	
	$('#saveAttributeProcedure2').animate({height: '300px'});
	$('#saveAttributeProcedure2Contents').show();
	
	$('#saveAttributeProcedure3Contents').hide();
	$('#saveAttributeProcedure3').animate({height: '20px'});
	
	$("#preview_button").hide();
	$("#print_CV").hide();
	$("#procedure3Back").hide();
	
}

function expandProcedure1(){
	$('#saveAttributeProcedure1Contents').show();
	$('#saveAttributeProcedure1').animate({height: '200px'});
	$('#saveAttributeProcedure2').animate({height: '20px'});
	$('#saveAttributeProcedure2Contents').hide();

	$('#saveAttributeProcedure3Contents').hide();
	$('#saveAttributeProcedure3').animate({height: '20px'});
	$("#preview_button").hide();
	$("#print_CV").hide();
	$("#procedure3Back").hide();
	
}

function displaySelectingAttributes(){
	$('#saveAttributeProcedure1Contents').show();
	$('#saveAttributeProcedure1').css('height', '200px');
	$('#saveAttributeProcedure2').css('height', '40px');
	$('#saveAttributeProcedure2Contents').hide();
	var p = document.getElementById("selectedAttributes");
	if(p){
		p.innerHTML = "";
	}
	$('#addTemplatePopup').hide();

	
	for (var i = 0; i < attributeList.length; i ++){
		var newElement = document.createElement("div");
		newElement.innerHTML = '<input type="checkbox"  value="selected">' + ' ' + attributeList[i].id.substring(14) + '</input>';
	    p.appendChild(newElement);
	}

}






function rearrangeAttributes(reverse){	
	//attributeList.pop();
	var p = document.getElementById("editAttributeMenu");
	var attributeName = [];
	var tempAttributeList = [];
	for(var i = 0; i < attributeList.length; i ++){
		p.removeChild(attributeList[i]);
	}
	
	for(var j = 0; j < attributeList.length; j ++){
		attributeName.push(attributeList[j].id);
	}
	attributeName.sort(function(a,b) {
	    a = a.toLowerCase();
	    b = b.toLowerCase();
	    if( a == b) return 0;
	    if( a > b) return 1;
	    return -1;
	});
	
	if(reverse){
		attributeName.reverse();
		attributeList.reverse();
	}
	for(var k1 = 0; k1 < attributeName.length; k1 ++){
		for(var k2 = 0; k2 < attributeList.length; k2 ++){
			if(attributeName[k1] == attributeList[k2].id){
				tempAttributeList.push(attributeList[k2]);
				p.appendChild(attributeList[k2]);
			}
		}
	}
	attributeList = tempAttributeList;
	//should perform something the same order as push	
}

function displayMatchedAttributes(notify){
	
	
	
	var textField = document.getElementById("searchAttribute");
	var textFieldInput = textField.value;
	//var showTheFirstOne = true;
	//alert(tableId);
	
	if(textFieldInput != ''){
		$('#attributeDisplay').css('margin-left',"100%");
	}
	else {
		$('#attributeDisplay').css('margin-left',"30%");
	}

	
	for (var k = 0; k < tableId.length; k ++){
		$('#attributeName_'+ tableId[k]).hide();
		$('#plain_content_' + tableId[k]).hide();
		$('#divtbl_'+tableId[k]).hide();
		$('#div_'+ tableId[k]).hide();
	}
	
	
	
	for (var i = 0; i < tableId.length; i++) {
		/* window.alert (tableId.length);
		window.alert ('attributeName_' + tableId[i]);
		window.alert (attributeId); */
		//alert('attributeName_' + tableId[i]);
		//alert(textFieldInput);
		
		var lowerCaseAttribute = tableId[i].toLowerCase();
		var lowerCaseInput = textFieldInput.toLowerCase();
		
		
		
		
		
		
		
		if (((lowerCaseAttribute).search(lowerCaseInput) == 0)) {
				//alert("niceMatch");
				$('#attributeName_'+ tableId[i]).show();
				
				//if (showTheFirstOne){
					//$('#divtbl_'+ tableId[i]).show();
					//$('#div_'+ tableId[i]).show();
				//}
				//showTheFirstOne = false;
		}
		else {
				$('#attributeName_'+ tableId[i]).hide();
				//$('#divtbl_'+tableId[i]).hide();
				//$('#div_'+ tableId[i]).hide();

		}
			
	}

	
	
}




function editAttributeExpand() {
	$('#attributeDisplay').css('margin-left',"0px");
	$('#mainMenu').css('width',"0px");
	$('#editAttributeExpand').hide();
	$('#editAttributeDone').show();

	
}


function editAttributeDone() {
	$('#attributeDisplay').css('margin-left',"25%");
	$('#mainMenu').css('width',"75px");
	$('#editAttributeExpand').show();
	$('#editAttributeDone').hide();
	
}



function showSettingsMenu() {
	editImageSelected = false;
	editAttributeSelected = false;
	importAttributeSelected = false;
	addAttributeSelected = false;
	saveAttributeSelected = false;

	
	
	$('#settingsMenu').css( "zIndex", 1);
	$('#generalInfoMenu').css( "zIndex", 0);
	$('#editAttributeMenu').css( "zIndex", 0);
	$('#importAttributeMenu').css( "zIndex", 0);
	$('#addAttributeMenu').css( "zIndex", 0);
	$('#saveAttributeMenu').css( "zIndex", 0);


	
	$('#settingsMenu').css('margin-left',"75px");
	$('#generalInfoMenu').css('margin-left',"-200px");
	$('#editAttributeMenu').css('margin-left',"-200px");
	$('#importAttributeMenu').css('margin-left',"-200px");
	$('#addAttributeMenu').css('margin-left',"-200px");
	$('#saveAttributeMenu').css('margin-left',"-200px");


	
	$('#editImage').attr("src","img/editImage.png");
	$('#editAttribute').attr("src","img/editAttribute.png");
	$('#importAttribute').attr("src","img/importAttribute.png");
	$('#addAttribute').attr("src","img/addAttribute.png");
	$('#saveAttribute').attr("src","img/saveAttribute.png");


	$('#dropZone').css('opacity',"0");


}






function editImageHover() {
	if (!editImageSelected){
		$('#editImage').attr("src","img/editImageHover.png");
	}
	$("#editImageDescription").show(300);

}
function editImageUnhover() {
	if (!editImageSelected){
		$('#editImage').attr("src","img/editImage.png");
	}
	$("#editImageDescription").hide(300);

}
function editImageClicked() {
	if (saveAttributeSelected){
		if(!confirm("If you want to edit general info, changes will not be saved.")){
			return;
		}
	}
		close_cat();
		editImageSelected = true;
		editAttributeSelected = false;
		importAttributeSelected = false;
		addAttributeSelected = false;
		saveAttributeSelected = false;



		
		$('#editImage').attr("src","img/editImageHover.png");
		$('#editAttribute').attr("src","img/editAttribute.png");
		$('#importAttribute').attr("src","img/importAttribute.png");
		$('#addAttribute').attr("src","img/addAttribute.png");
		$('#saveAttribute').attr("src","img/saveAttribute.png");


		
		$('#settingsMenu').css( "zIndex", 0);
		$('#generalInfoMenu').css( "zIndex", 1);
		$('#editAttributeMenu').css( "zIndex", 0);
		$('#importAttributeMenu').css( "zIndex", 0);
		$('#addAttributeMenu').css( "zIndex", 0);
		$('#saveAttributeMenu').css( "zIndex", 0);

		

		
		$('#settingsMenu').css('margin-left',"-200px");
		$('#generalInfoMenu').css('margin-left',"75px");
		$('#editAttributeMenu').css('margin-left',"-200px");
		$('#importAttributeMenu').css('margin-left',"-200px");
		$('#addAttributeMenu').css('margin-left',"-200px");
		$('#saveAttributeMenu').css('margin-left',"-200px");


		$('#dropZone').css('opacity',"1");

	


}

function editAttributeHover() {
	if (!editAttributeSelected){
		$('#editAttribute').attr("src","img/editAttributeHover.png");
	}
	$("#editAttributeDescription").show(300);

}
function editAttributeUnhover() {
	if (!editAttributeSelected){
		$('#editAttribute').attr("src","img/editAttribute.png");
	}
	$("#editAttributeDescription").hide(300);

}
function editAttributeClicked() {
	
	if (saveAttributeSelected){
		if(!confirm("If you want to edit attributes, changes will not be saved.")){
			return;
		}
	}
	/* window.alert("fdsgfd"); */
	close_cat();
	editImageSelected = false;
	editAttributeSelected = true;
	importAttributeSelected = false;
	addAttributeSelected = false;
	saveAttributeSelected = false;



	
	$('#editImage').attr("src","img/editImage.png");
	$('#editAttribute').attr("src","img/editAttributeHover.png");
	$('#importAttribute').attr("src","img/importAttribute.png");
	$('#addAttribute').attr("src","img/addAttribute.png");
	$('#saveAttribute').attr("src","img/saveAttribute.png");


	
	$('#settingsMenu').css( "zIndex", 0);
	$('#generalInfoMenu').css( "zIndex", 0);
	$('#editAttributeMenu').css( "zIndex", 1);
	$('#importAttributeMenu').css( "zIndex", 0);
	$('#addAttributeMenu').css( "zIndex", 0);
	$('#saveAttributeMenu').css( "zIndex", 0);


	
	$('#settingsMenu').css('margin-left',"-200px");
	$('#generalInfoMenu').css('margin-left',"-200px");
	$('#editAttributeMenu').css('margin-left',"75px");
	$('#importAttributeMenu').css('margin-left',"-200px");
	$('#addAttributeMenu').css('margin-left',"-200px");
	$('#saveAttributeMenu').css('margin-left',"-200px");


	$('#dropZone').css('opacity',"0");

	
}


function addAttributeCancel(){
	$('#mainMenu').css('width',"75px");
	editImageSelected = false;
	editAttributeSelected = true;
	importAttributeSelected = false;
	addAttributeSelected = false;
	saveAttributeSelected = false;



	
	$('#editImage').attr("src","img/editImage.png");
	$('#editAttribute').attr("src","img/editAttributeHover.png");
	$('#importAttribute').attr("src","img/importAttribute.png");
	$('#addAttribute').attr("src","img/addAttribute.png");
	$('#saveAttribute').attr("src","img/saveAttribute.png");


	
	$('#settingsMenu').css( "zIndex", 0);
	$('#generalInfoMenu').css( "zIndex", 0);
	$('#editAttributeMenu').css( "zIndex", 1);
	$('#importAttributeMenu').css( "zIndex", 0);
	$('#addAttributeMenu').css( "zIndex", 0);
	$('#saveAttributeMenu').css( "zIndex", 0);


	
	$('#settingsMenu').css('margin-left',"-200px");
	$('#generalInfoMenu').css('margin-left',"-200px");
	$('#editAttributeMenu').css('margin-left',"75px");
	$('#importAttributeMenu').css('margin-left',"-200px");
	$('#addAttributeMenu').css('margin-left',"-200px");
	$('#saveAttributeMenu').css('margin-left',"-200px");
}


function saveAttributeHover() {
	if (!saveAttributeSelected){
		$('#saveAttribute').attr("src","img/saveAttributeHover.png");
	}
	$("#saveAttributeDescription").show(300);

}
function saveAttributeUnhover() {
	if (!saveAttributeSelected){
		$('#saveAttribute').attr("src","img/saveAttribute.png");
	}
	$("#saveAttributeDescription").hide(300);

}
function saveAttributeClicked() {
	/* window.alert("fdsgfd"); */
	editImageSelected = false;
	editAttributeSelected = false;
	importAttributeSelected = false;
	addAttributeSelected = false;
	saveAttributeSelected = true;
	



	
	$('#editImage').attr("src","img/editImage.png");
	$('#editAttribute').attr("src","img/editAttribute.png");
	$('#importAttribute').attr("src","img/importAttribute.png");
	$('#addAttribute').attr("src","img/addAttribute.png");
	$('#saveAttribute').attr("src","img/saveAttributeHover.png");


	
	$('#settingsMenu').css( "zIndex", 0);
	$('#generalInfoMenu').css( "zIndex", 0);
	$('#editAttributeMenu').css( "zIndex", 0);
	$('#importAttributeMenu').css( "zIndex", 0);
	$('#addAttributeMenu').css( "zIndex", 0);
	$('#saveAttributeMenu').css( "zIndex", 1);


	
	$('#settingsMenu').css('margin-left',"-200px");
	$('#generalInfoMenu').css('margin-left',"-200px");
	$('#editAttributeMenu').css('margin-left',"-200px");
	$('#importAttributeMenu').css('margin-left',"-200px");
	$('#addAttributeMenu').css('margin-left',"-200px");
	$('#saveAttributeMenu').css('margin-left',"75px");


	$('#dropZone').css('opacity',"0");
	
	displaySelectingAttributes();
}






function addAttributeHover() {
	if (!addAttributeSelected){
		$('#addAttribute').attr("src","img/addAttributeHover.png");
	}
	$("#addAttributeDescription").show(300);

}
function addAttributeUnhover() {
	if (!addAttributeSelected){
		$('#addAttribute').attr("src","img/addAttribute.png");
	}
	$("#addAttributeDescription").hide(300);

}
function addAttributeClicked() {
	if (saveAttributeSelected){
		if(!confirm("If you want to add attributes, changes will not be saved.")){
			return;
		}
	}
	/* window.alert("fdsgfd"); */
	
	close_cat();
	
	editImageSelected = false;
	editAttributeSelected = false;
	addAttributeSelected = true;
	importAttributeSelected = false;
	saveAttributeSelected = false;
	
	$('.mainMenu').css("width", "0px");


	
	$('#editImage').attr("src","img/editImage.png");
	$('#editAttribute').attr("src","img/editAttribute.png");
	$('#importAttribute').attr("src","img/importAttribute.png");
	$('#addAttribute').attr("src","img/addAttributeHover.png");
	$('#saveAttribute').attr("src","img/saveAttribute.png");


	
	$('#settingsMenu').css( "zIndex", 0);
	$('#generalInfoMenu').css( "zIndex", 0);
	$('#editAttributeMenu').css( "zIndex", 0);
	$('#importAttributeMenu').css( "zIndex", 0);
	$('#addAttributeMenu').css( "zIndex", 1);
	$('#saveAttributeMenu').css( "zIndex", 0);

	
	$('#settingsMenu').css('margin-left',"-200px");
	$('#generalInfoMenu').css('margin-left',"-200px");
	$('#editAttributeMenu').css('margin-left',"-200px");
	$('#importAttributeMenu').css('margin-left',"-200px");
	$('#addAttributeMenu').css('margin-left',"0px");
	$('#saveAttributeMenu').css('margin-left',"-200px");


	$('#dropZone').css('opacity',"0");
	
	document.getElementById("nameattr").value = "";
	manually_open_step_1();
	
}









function importAttributeHover() {
	if (!importAttributeSelected){
		$('#importAttribute').attr("src","img/importAttributeHover.png");
	}
	$("#importAttributeDescription").show(300);
	

}
function importAttributeUnhover() {
	if (!importAttributeSelected) {
		$('#importAttribute').attr("src","img/importAttribute.png");
	}
	$("#importAttributeDescription").hide(300);

}
function importAttributeClicked() {
	if (saveAttributeSelected){
		if(!confirm("If you want to import attributes, changes will not be saved.")){
			return;
		}
	}
	
	close_cat();
	editImageSelected = false;
	editAttributeSelected = false;
	importAttributeSelected = true;
	addAttributeSelected = false;
	saveAttributeSelected = false;

	
	$('#editImage').attr("src","img/editImage.png");
	$('#editAttribute').attr("src","img/editAttribute.png");
	$('#importAttribute').attr("src","img/importAttributeHover.png");
	$('#addAttribute').attr("src","img/addAttribute.png");
	$('#saveAttribute').attr("src","img/saveAttribute.png");



	
	$('#settingsMenu').css( "zIndex", 0);
	$('#generalInfoMenu').css( "zIndex", 0);
	$('#editAttributeMenu').css( "zIndex", 0);
	$('#importAttributeMenu').css( "zIndex", 1);

	$('#addAttributeMenu').css( "zIndex", 0);
	$('#saveAttributeMenu').css( "zIndex", 0);


	
	$('#settingsMenu').css('margin-left',"-200px");
	$('#generalInfoMenu').css('margin-left',"-200px");
	$('#editAttributeMenu').css('margin-left',"-200px");
	$('#importAttributeMenu').css('margin-left',"75px");
	$('#addAttributeMenu').css('margin-left',"-200px");
	$('#saveAttributeMenu').css('margin-left',"-200px");


	$('#dropZone').css('opacity',"0");





}







var attributeSelected;
var attributeList = []; // need to modified over a large scale



function addAttributeName(parentId, attributeId, html, flag) {
	
	var p = document.getElementById(parentId);
	var newElement = document.createElement('div');
	attributeList.push(newElement);
	newElement.setAttribute('id', attributeId);
	newElement.setAttribute("style", "margin-left: 0px;margin-top: 0px;border-style: none none solid none;border-color: #E0E0E0;border-width: 1px; font-size:25px;color:#808080;cursor: pointer;");	
	
	newElement.setAttribute("name", flag);
	
	document.getElementById("plain_content_" + attributeId.substring(14)).innerHTML = document.getElementById("attribute_content_input").value;
	
	
	newElement.onclick = function(){
		
		
		$('#attributeDisplay').css('margin-left', "30%");
		
		
		
			//traverse the other attribute so that it can manage the animation part
			for (i = 0; i < tableId.length; i++) {
				/* window.alert (tableId.length);
				window.alert ('attributeName_' + tableId[i]);
				window.alert (attributeId); */
				if ((('attributeName_' + tableId[i]) == attributeId)) {
					//alert("should show only once");
					if (document.getElementById(attributeId).getAttribute("name") == 0){
						$('#attributeName' + tableId[i]).show();
						$('#plain_content_' + tableId[i]).show();
						$('#divtbl_'+ tableId[i]).hide();
						$('#div_'+ tableId[i]).hide();
					}
					else{
						$('#attributeName' + tableId[i]).show();
						$('#plain_content_' + tableId[i]).hide();
						$('#divtbl_'+ tableId[i]).show();
						$('#div_'+ tableId[i]).show();
					}
						
					}
				else {
						$('#attributeName' + tableId[i]).hide();
						$('#plain_content_' + tableId[i]).hide();
						$('#divtbl_'+tableId[i]).hide();
						$('#div_'+ tableId[i]).hide();

					}
					
			}
		
		
		attributeSelected = newElement;
		
	
		
		for (var i = 0 ; i < attributeList.length; i++) {
			if (attributeList[i] == attributeSelected){
				
				attributeList[i].style.backgroundColor = "#808080";
				attributeList[i].getElementsByTagName('p')[0].style.color = "white";
			}
		
			else {
				attributeList[i].style.backgroundColor = "#F5F5F5";
				attributeList[i].getElementsByTagName('p')[0].style.color = "#808080";
			}
		}
		
		
		
		
		
	}
	//var newElementId = newElement.attr('id');
	var newElementId = newElement.id;
	//alert(newElementId);
	newElement.innerHTML = "<img src=\'img/removeAttribute.png' width ='25px' height = '25px' onclick= 'removeCurrentAttribute("+ newElementId +")' style=\'margin-left: 150px; margin-top: 10px; cursor: hand; display: none; position: absolute;'><p> test </p>";
	var desNode = newElement.getElementsByTagName('p')[0];
	//alert(newElementId);
	desNode.innerHTML = html;
	desNode.style.fontFamily = "Courier New";
  	newElement.onmouseover = function(){
		newElement.style.backgroundColor = "#D3D3D3";
		newElement.getElementsByTagName('p')[0].style.color = "white";
		newElement.getElementsByTagName('img')[0].style.display = "block";
		


	}
 	newElement.onmouseout = function(){
		newElement.getElementsByTagName('img')[0].style.display = "none";
 		for(var j = 0; j < attributeList.length; j++){
			if (attributeList[j] == attributeSelected){
				
				attributeList[j].style.backgroundColor = "#808080";
				attributeList[j].getElementsByTagName('p')[0].style.color = "white";
			}
		
			else {
				attributeList[j].style.backgroundColor = "#F5F5F5";
				attributeList[j].getElementsByTagName('p')[0].style.color = "#808080";

			}
 
 		}
 		
				

	
	}
	

	
	


	
    p.appendChild(newElement);

}






function removeCurrentAttribute(id){
	//alert(id.id);
	//alert(tableId);
	var targetAttribute = document.getElementById(id.id);
	var p = document.getElementById("editAttributeMenu");
	for(var i = 0; i < attributeList.length; i ++){
		p.removeChild(attributeList[i]);
	}
	//var remove_2 = $('#divtbl_'+ id.id);
	//var remove_3 = $('#div_'+ id.id);
	

	
	
	var targetIndex = attributeList.indexOf(targetAttribute);
	attributeList.splice(targetIndex, 1);	
	for(var j = 0; j < attributeList.length; j ++){
		p.appendChild(attributeList[j]);
	}
	//something should be added to ensure that the id is no longer valid to prevent a collision
	
	
	
	var removeKey = (targetAttribute.id.substring(14));
	var removeDivTable = $('#divtbl_'+ removeKey);
	var removeDiv = $('#div_'+ removeKey);
	var removePlainContent = $('#plain_content_' + removeKey);
	var removeAll = $(removeKey);
	
	
	
	
	targetAttribute.style.display = "none";
	removeDivTable.hide();
	removeDiv.hide();
	removePlainContent.hide();
	removeAll.hide();	
	
	targetAttribute.removeAttribute('id');
	removeDivTable.removeAttr('id');
	removeDiv.removeAttr('id');
	removePlainContent.removeAttr('id');
	removeAll.removeAttr('id');
	$('#' + removeKey + '_dtype').removeAttr('id');
	$('#' + removeKey + '_newcol').removeAttr('id');
	$('#' + removeKey + '_icol').removeAttr('id');
	$('#btnAdd' + removeKey).removeAttr('id');
}





</script>






<!-- <p> Click to edit </p>

<table id="basicinfo" class="table table-bordered table-striped" style="clear: both">
	<tr id="Name" style="display:none;">         
		<td width="35%">Name</td>
		<td width="65%"><a href="#" id="name" data-type="textarea" data-placement="right" data-title="Enter Name" class="editable editable-click" data-original-title="" title=""></a></td>
	</tr>
		<tr id="CurrentPosition" style="display:none;">         
		<td width="35%">Current-Position</td>
		<td width="65%"><a href="#" id="currentposition" data-type="textarea" data-placement="right" data-title="Enter Current Position" class="editable editable-click" data-original-title="" title=""></a></td>
	</tr>
	

</table> -->







<!-- <div id="divadditionalattribute">

</div> -->



<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Search existing or add new. Add one attribute at a time.</h4>
        </div>
        <div class="modal-body">
        	<input id="inputsearch" type="text" name="search" placeholder="Search..">
        	<button type="button" class="btn btn-info btn-lg" onclick="searchattr();">Search</button>
         <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Create New</button>
          <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#linkedinmodal">Import from linkedin</button>
         
         <div id="searchresults">
         Here goes the search result.
         </div>
		</div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary btnAddSchema" onclick="addschema();">Add</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>





  
  
  
  <div class="modal fade" id="importmodal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Import attribute</h4>
        </div>
        <div class="modal-body">
         Google Scholar: <input type="text" id="scholarurl" style="width: 700px;" required>
		<button id="btnAddNew" class="btn btn-primary" onclick="importpub()">Import</button>
		</div>
        <div class="modal-footer">
        	<button id="btnAddNew" class="btn btn-primary" onclick="addschema()">Import Attribute</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  

  
  
   




<!-- <button id="btnSave" class="btn btn-primary" style="margin-left:45%;margin-top:20px" onclick="save();">Save</button>
 --><script src="js/constants.js?version=1.11"></script>

<script src="js/grabdata.js?version=1.21"></script>









<script>

$(document).ready(function() {
	
	
	//$('#attribute_content_input').summernote();

	
	
	$("#cat_1").hover(function(){
	    $("#cat_1").attr('src', 'img/cat_1_hover.png');
	    }, function(){
	    $("#cat_1").attr('src', 'img/cat_1.png');
	});
	
	
	$("#cat_2").hover(function(){
	    $("#cat_2").attr('src', 'img/cat_2_hover.png');
	    }, function(){
	    $("#cat_2").attr('src', 'img/cat_2.png');
	});
	
	
	
	$("#cat_3").hover(function(){
	    $("#cat_3").attr('src', 'img/cat_3_hover.png');
	    }, function(){
	    $("#cat_3").attr('src', 'img/cat_3.png');
	});
	
	
	// Get the modal
	var popupTemplate = document.getElementById('addTemplatePopup');

	// Get the <span> element that closes the modal
	var popupOtherArea = document.getElementsByClassName("popup-close")[0];

	
	//var popupCloseButton = document.getElementById("popupClose");
	var addTemplateButtonClicked = document.getElementById("addTemplateButton");
	var popupLeftToolbar = document.getElementById("popupMenu");
	// When the user clicks the button, open the modal 
	addTemplateButtonClicked.onclick = function() {
		
		$("#new_template_button").show()
		$("#modify_template_button").hide();
		
		com_id_list = []; // proabbly need to be modified again
		
		com_id = 1; // reset the com id when a new template is created.
		
		
		popupTemplate.style.display = "block";
		popupLeftToolbar.style.left = "75px";
		
	}
	
	 
	
	
	
	// When the user clicks on <span> (x), close the modal
	popupOtherArea.onclick = function() {
		popupTemplate.style.display = "none";
		popupLeftToolbar.style.left = "-100px";
		close_cat();
		
	}
	

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == popupTemplate) {
	    	popupTemplate.style.display = "none";
	    }
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	var params = getSearchParameters();
	//fullname=params.name.replace(/[.,\/#!+$%\^&\*;:{}=\-_`~()]/g," ");
	// need to be considered later
	localStorage.setItem("fullname", fullname); 
	affiliation=params.institution.replace(/[.,\/#!+$%\^&\*;:{}=\-_`~()]/g," ");
	username=fullname.toLowerCase().replace(" ","");
	sessionStorage.setItem("username",username);
	sessionStorage.setItem("fullname",fullname);
	sessionStorage.setItem("affiliation",affiliation);
    //toggle `popup` / `inline` mode
   $.ajax({
	    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
	    type: "post",///request type, can be GET
	    cache: false,//do not cache returned data
	    data: {"username":username,"task":"getresume"},//data to be sent to the server
	    dataType: "json"//type of data returned
	}).done(function(response) {
		
		console.log(fullname);
		console.log(affiliation);
		console.log(username);
		console.log("data");
		console.log(response);
		
	    $("#Name").css("display", "table-row");
	   	document.getElementById("name").innerText = fullname;
	   	$('#Name').editable();
	   	
	    $("#CurrentPosition").css("display", "table-row");
	   	document.getElementById("currentposition").innerHTML = affiliation;
	   	$('#CurrentPosition').editable();
		
		if (response === undefined || response.length == 0) {
			console.log("It is empty");
		}
		else{
			console.log("It is not empty");
			response=response[0];
			getfromdb(response);
		}
		
		$('.newcolclass').each(function(){	
			console.log(this.id);
			getdropdownlist(this.id);
		});
		
		
		//get attribute drop down list
		getattributelist();
		
		
		getallschemas();
		
			
		});
		
	    

	
	
	});







</script>






<script>

function openlinkedinprofile(username,attributename)
{
	var reurl = 'https://www.linkedin.com/in/'+username;
	 
	 $.ajax({ url: reurl, 
		 success: function(data) {
		//console.log(data);
	  getlinkedin(data,function(data_returned){
			console.log("after return");
			console.log(data_returned);
			var attributes=[attributename];
			console.log(attributes);
			if(data_returned.length==0){
				alert("No data found on LinkedIn");
			}
			else{
			importdata(attributes,data_returned);
			}
			},function(err){
			console.log("Error");
			});
		 } });

	
		
	

}

function importfromlinkedin(){
	if (localStorage.getItem("key") === null) {
		alert("Please follow the instructions above carefully. We didn't get any data from your linkedin profile.")
	}
	else{
		var test=localStorage.getItem("key");
		console.log(test);
		test=JSON.parse(test);
		console.log(test['Education']);
		var attributes=[];
		$("input:checkbox[name=attr]:checked").each(function(){
			attributes.push($(this).val());
		});
		importdata(attributes,test);
	}
	
	
}












function getallschemas(){
	//get all schemas
	$.ajax({
    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
    type: "post",//request type, can be GET
    cache: false,//do not cache returned data
    data: {"task":"getallschemas"},//data to be sent to the server
    dataType: "json"//type of data returned
	}).done(function(schemas) {
		console.log("get all schemas");
		console.log(schemas);
		datas={};
		
		for (var i=0;i<schemas.length;i++){
			datas["Name"]=schemas[i]["_id"];
			datas["data"]=schemas[i]["fields"];
			datas["Source"]=schemas[i]["Source"];
			datas["Description"]="N/A";
			if ("Description" in schemas[i]){
				datas["Description"]=schemas[i]["Description"];
			}
			
			
			console.log(datas);
			$.ajax({
				url: 'templates/allschema.tpl',
				async: false,
				type: 'POST'
			})
			.done(function(template) {		
				var $commentsContainer = $('#searchresults');
			    var old = $commentsContainer.html();
				$('#searchresults').setTemplate(template);
				$('#searchresults').processTemplate(datas);
				$('#searchresults').prepend(old);
				
				$(".tblsearch tr").click(function(){
					$(this).addClass('searchselected').siblings().removeClass('searchselected');      
				});

			});
		}
	});
		
}


function importpub(input_url,attributename){
//var input_url="https://scholar.google.com/citations?hl=en&user=qkqbPcsAAAAJ";
//var input_url=document.getElementById("scholarurl").value;
input_url=input_url+"&cstart="+0+"&pagesize=100";;

googlescholar(input_url,function(data_returned){
	console.log("after return");
	console.log(data_returned);
	//var attributename="Publications";
	//var attributes=["Publication","Picture","Current-Position","Research-Interest","Homepage"];
	var attributes=[attributename];
	console.log(attributes);
	if(data_returned.length==0){
		alert("No data found on Google Scholar");
	}
	else{
	importdata(attributes,data_returned)
	}
   
	
});
}



function importdata(attributes,data_returned){
	window.alert("importdata");

	$.ajax({
		url: 'templates/edit_attribute.tpl',
		async: false,
		type: 'GET'
	})
	.done(function(template) {
		var $commentsContainer = $('#divadditionalattribute');
	    var old = $commentsContainer.html();
		$('#divadditionalattribute').setTemplate(template);
		$('#divadditionalattribute').processTemplate(attributes);
		$('#divadditionalattribute').prepend(old);
		
	});
   	
   	for(var k=0;k<attributes.length;k++){
   		
   	
   	var datas={};
	datas['Name']=attributes[k];
	
	datas['fields']=Object.keys(data_returned[attributes[k]][0]);
	
	datas['data']=[];
	
	for(var j=0;j<data_returned[attributes[k]].length;j++){
		var row={};
		for(var i=0;i<datas['fields'].length;i++){
			var key=datas['fields'][i];
			row[key]={}
			row[key]['value']=data_returned[attributes[k]][j][key];	
			row[key]['type']="text";			
		}
		datas['data'].push(row);
	}
	

	console.log(datas);
					
	$.ajax({
		url: 'templates/edit_employment.tpl',
		async: false,
		type: 'POST'
	})
	.done(function(template) {
		$('#divtbl_'+attributes[k]).setTemplate(template);
		$('#divtbl_'+attributes[k]).processTemplate(datas);
	});
   	}
}

function scienceDirectimport(fullname,attributename){
	attrname=attributename;
	scienceDirect(fullname,affiliation,function(data_returned){
		console.log("after return");
		console.log(data_returned);
		data=[];
		if (data_returned[0]["error"]){
			alert("Sorry, no data found in Science Direct.");
		}
		else
		{
		for (var k=0;k<data_returned.length;k++){
			row={};
			row['Title']=data_returned[k]['dc:title'];
			row['PublicationName']=data_returned[k]['prism:publicationName'];
			row['Date']=data_returned[k]['prism:coverDisplayDate'];
			row['Abstract']=data_returned[k]['prism:teaser'];
			row['authors']=[];
			for(var j=0;j<data_returned[k]['authors']['author'].length;j++){
				var name=data_returned[k]['authors']['author'][j]['given-name'];
				var surname=data_returned[k]['authors']['author'][j]['surname'];
				var fullname=name.concat(surname);
				row['authors'].push(fullname);
			}
		
			
			data.push(row);
		}
		
		attributes=[attrname]
		data_returned[attrname]=data;
		importdata(attributes,data_returned);
		}
},function(err){
	console.log("Error");
});
}


function JustiaSearchimport(fullname,attributename){
	JustiaSearch(fullname,function(data_returned){
		console.log("after return");
		console.log(data_returned);
		attrname=attributename;
		attributes=[attrname];
		data_returned[attrname]=data_returned;
		if(data_returned.length==0){
			alert("No data found on Justia");
		}
		else{
		importdata(attributes,data_returned);
		}
},function(err){
	console.log("Error");
});
}

function videolecturesimport(fullname,attributename){
	videolectures(fullname,function(data_returned){
		console.log("after return");
		console.log(data_returned);
		attrname=attributename;
		attributes=[attrname];
		data_returned[attrname]=data_returned;
		if(data_returned.length==0){
			alert("No data found on videolectures.net");
		}
		else{
		importdata(attributes,data_returned);
		}
	},function(err){
	console.log("Error");
	});
}




function ieeeimport(){
	IEEESearch(fullname,affiliation,function(data_returned){
		console.log("after return");
		console.log(data_returned);
		//attrname="Patents";
		//attributes=[attrname];
		//data_returned[attrname]=data_returned;
		//importdata(attributes,data_returned);
},function(err){
	console.log("Error");
});
}





function nsfimport(fullname,attrname){
	NSFSearch(fullname,function(data_returned){
		console.log("after return");
		console.log(data_returned);
		attributes=[attrname]
		data_returned[attrname]=data_returned;
		if(data_returned.length==0){
			alert("No data found on NSF");
		}
		else{
		importdata(attributes,data_returned);
		}
},function(err){
	console.log("Error");
});
}
	

function getfromdb(response){
	window.alert("getfromdb");

	var attributes=Object.keys(response);
	console.log(attributes);
   	
   	$.ajax({
		url: 'templates/edit_attribute.tpl',
		async: false,
		type: 'GET'
	})
	.done(function(template) {
		$('#divadditionalattribute').setTemplate(template);
		$('#divadditionalattribute').processTemplate(attributes);
	});
   	
   	for (var i=0;i<attributes.length;i++){
			var attribute_list=response[attributes[i]];
			var datas={};
			datas['Name']=attribute_list["Name"];
			
			datas['fields']=attribute_list["fields"];
			
			datas['data']=attribute_list["data"];
			console.log(datas);
			
			$.ajax({
				url: 'templates/edit_employment.tpl',
				async: false,
				type: 'POST'
			})
			.done(function(template) {
				$('#divtbl_'+attributes[i]).setTemplate(template);
				$('#divtbl_'+attributes[i]).processTemplate(datas);
			});
		}
	
}






</script>



<script>
// To populate drop downlists

function getdropdownlist(attribute){
	var attname=attribute.replace('_newcol','');
	$.ajax({
	    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
	    type: "post",//request type, can be GET
	    cache: false,//do not cache returned data
	    data: {"attribute":attname,"task":"getnewfields"},//data to be sent to the server
	    dataType: "json"//type of data returned
	}).done(function(responseText1) {
		console.log("Attribute drop down list");
		console.log(responseText1);
		if (responseText1[0]){
			for(var k=0;k<responseText1[0]["fields"].length;k++){
				var value=responseText1[0]["fields"][k]["Name"];
				var type=responseText1[0]["fields"][k]["type"];
				 $('#'+attribute).append($('<option>').text(value).attr('value', value));
				 dict[attname][value]=type;
			}
		}
		
	    });	
}

function getattributelist(){
	$.ajax({
	    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
	    type: "post",//request type, can be GET
	    cache: false,//do not cache returned data
	    data: {"task":"getaddattributes"},//data to be sent to the server
	    dataType: "json"//type of data returned
	}).done(function(responseText2) {
		console.log("Field drop down list");
		console.log(responseText2);
		for(var i=0;i<responseText2.length;i++){
			var value=responseText2[i]["attribute"];
			 $('#ftype').append($('<option>').text(value).attr('value', value));
			 dict[value]={};
			for(var k=0;k<responseText2[i]["fields"].length;k++){	
				var field=responseText2[i]["fields"][k]["Name"];
				var type=responseText2[i]["fields"][k]["type"];				
				dict[value][field]=type;
			}
		}
	    });
	
}

function searchattr(){
	var attname=document.getElementById("inputsearch").value;
	var data={};
	$.ajax({
	    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
	    type: "post",//request type, can be GET
	    cache: false,//do not cache returned data
	    data: {"attribute":attname,"task":"searchattributes"},//data to be sent to the server
	    dataType: "json"//type of data returned
	}).done(function(responseText3) {
		if (responseText3.length==0){
			document.getElementById("searchresults").innerText="Sorry no attributes were found matching your query."
		}
		else{
			console.log("Search results");
			console.log(responseText3);
			data["Name"]=attname;
			data["data"]=responseText3;
			data["Description"]="N/A";
			data["Source"]=[];
			for (var i=0;i<responseText3.length;i++){
				if ('Description' in responseText3[i]){
					data["Description"]=responseText3[i]["Description"];
				}
				data["Source"].push(responseText3[i]["Source"]);
			}
			console.log(data);
			$.ajax({
				url: 'templates/search_attribute.tpl',
				async: false,
				type: 'POST'
			})
			.done(function(template) {
				$('#searchresults').setTemplate(template);
				$('#searchresults').processTemplate(data);
				
				$(".tblsearch tr").click(function(){
					$(this).addClass('searchselected').siblings().removeClass('searchselected');      
				});

			});
			
			
			
		}
		
	    });
	
}



function generating_certain_code(abc){
	print("");
	
	
	
}




function getSearchParameters() {
    var prmstr = window.location.search.substr(1);
    return prmstr != null && prmstr != "" ? transformToAssocArray(prmstr) : {};
}
function test_3(){
	
	alert(document.getElementById("test").value);
	
}

function transformToAssocArray( prmstr ) {
  var params = {};
  var prmarr = prmstr.split("&");
  for ( var i = 0; i < prmarr.length; i++) {
      var tmparr = prmarr[i].split("=");
      params[tmparr[0]] = tmparr[1];
  }
  return params;
}



</script>



<script>

function tableToJson(table) {
    var data = {};
    var tablename=table.replace('tbl_','');
    data['Name']=tablename;
    console.log(tablename);
	table=document.getElementById(table);
    // first row needs to be headers
    var headers = [];
    for (var i=0; i<table.rows[0].cells.length; i++) {
        headers[i] = table.rows[0].cells[i].innerText.slice(0, -2) || table.rows[0].cells[i].textContent.slice(0, -2);
    }
	data['fields']=headers.slice(0, -1);
	data['types']=[];
    // go through cells
    data['data']=[];
    for (var i=1; i<table.rows.length; i++) {

        var tableRow = table.rows[i];
        var rowData = {};
		
        for (var j=0; j<tableRow.cells.length-1; j++) {
        	rowData[ headers[j] ]={};
            if (tableRow.cells[j].children[0]) {
            	 rowData[ headers[j] ]['value']=tableRow.cells[j].children[0].value;
            	 rowData[ headers[j] ]['type']=tableRow.cells[j].children[0].type;
            }
            else{
            	rowData[headers[j] ]['value'] = tableRow.cells[j].innerHTML;
            	console.log(tablename);
            	console.log(headers[j]);
            	if ('tablename' in dict){
            		if(headers[j] in dict[tablename]){
                    	rowData[headers[j] ]['type']=dict[tablename][headers[j]];
            		}
            		
            	}
            	else{
            		rowData[headers[j] ]['type']="text";
            	}
            		
            }
            if (i==1){
            	data['types'].push(rowData[headers[j] ]['type']);
            }

        }

        data['data'].push(rowData);
    }       

    return data;
}

function save(){
	all_data={};
	$('#divadditionalattribute table').each(function(){
		   console.log(this.id);
		   if (this.id!="basicinfo"){
			   data=tableToJson(this.id);
			   var tablename=(this.id).replace("tbl_","");
			   console.log(data);
			   console.log(data["fields"]);
			   all_data[tablename]=data;	
			   var newattr={};
			   newattr["attribute"]=tablename;
			   newattr["Source"]="Manual";
			   newattr["fields"]=[];
			   for(k=0;k<data["fields"].length;k++){
				   row={};
				   row["Name"]=data["fields"][k];
				   row["type"]=data["types"][k];
				   newattr["fields"].push(row); 
			   }
			   console.log(newattr);
			   console.log("check and insert");
			   
				$.ajax({
				    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
				    type: "post",//request type, can be GET
				    cache: false,//do not cache returned data
				    data: {"record":JSON.stringify(newattr),"task":"checkinsertnewattribute"},//data to be sent to the server
				    //dataType: "json"//type of data returned
				}).done(function() {
					console.log("Insert new attribute successful");
				    });
		   }

		});

	   table=document.getElementById("basicinfo");
	    // first row needs to be headers
	    var headers = [];
	    for (var i=1; i<table.rows.length; i++) {
	        headers[i] = table.rows[i].cells[0].innerText || table.rows[i].cells[0].textContent;
	    }
	    for (var i=1; i<headers.length; i++) {
	    var data = {};
	    data['Name']=headers[i];
		data['fields']=[headers[i]];
	    // go through cells
	    data['data']=[];
	    
       var tableRow = table.rows[i];
       var rowData = {};
		
       for (var j=1; j<tableRow.cells.length; j++) {
       	rowData[ headers[i] ]={};
          
       	rowData[ headers[i] ]['value'] = tableRow.cells[j].innerText || tableRow.cells[j].textContent;
       	rowData[ headers[i] ]['type']='text';
           
           data['data'].push(rowData);
       }
       all_data[headers[i]]=data;
  		}
	all_data['username']=username;
	console.log(all_data);
	console.log(JSON.stringify(all_data));
	$.ajax({
	    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
	    type: "post",//request type, can be GET
	    cache: false,//do not cache returned data
	    data: {"all_data":JSON.stringify(all_data),"username":username,"task":"insertresume"},//data to be sent to the server
	    //dataType: "json"//type of data returned
	}).done(function() {
		console.log("Insert successful");
		window.location.href="CVcheckbox.jsp";
	    });
	
	

}
    


/* function generate_table(attrname) {
	 $("#divtbl_"+attrname).slideToggle("slow");
	 $("#div_"+attrname).slideToggle("slow");
}  */

function getcolname(attrname,name){
	console.log(("#"+attrname+"_newcolname"));
	if (name=="new")
	{
		document.getElementById(attrname+"_newcolname").style.visibility="visible";
	}
	else{	
		document.getElementById(attrname+"_dtype").value = dict[attrname][name];
		console.log(dict[attrname][name]);
		console.log(document.getElementById(attrname+"_dtype").value);
	}
	
}

function  deletecol(element) {
    var el = element;
    while ((el = el.parentElement) && el.nodeName.toUpperCase() !== 'TABLE');
    var tblid=el.id;
    var colid=element.parentNode.cellIndex;
    var tbl=document.getElementById(tblid);
    var numrows = tbl.rows.length;
    var numcols = tbl.rows[0].cells.length;
    for (var r = 0; r < numrows; r++) {
    	var Row = tbl.rows[r];
    	Row.deleteCell(colid);
    }
}



function add_column(attrname){
	var e = document.getElementById(attrname+"_newcol");
	var colname=e.options[e.selectedIndex].value;
	var e = document.getElementById(attrname+"_dtype");
	var coltype = e.options[e.selectedIndex].value;
	if (colname=="new")
	{
		colname=document.getElementById(attrname+"_newcolname").value;
		all_data={};
		all_data["attribute"]=attrname;
		all_data["fields"]=[];
		all_data["fields"][0]={};
		all_data["fields"][0]["Name"]=colname;
		all_data["fields"][0]["type"]=coltype;
		console.log(all_data);
		$.ajax({
		    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
		    type: "post",//request type, can be GET
		    cache: false,//do not cache returned data
		    data: {"record":JSON.stringify(all_data),"attrname":attrname,"name":colname,"type":coltype,"task":"insertnewfield"},//data to be sent to the server
		    //dataType: "json"//type of data returned
		}).done(function() {
			console.log("Insert successful");
		    });
	}

    if (colname!==null){
		$("#tbl_"+attrname+" thead tr").find("th:last").before('<th></th>');
		$("#tbl_"+attrname+" tbody tr").find("td:last").before('<td></td>');
		$("#tbl_"+attrname+" thead tr>th:last").prev().html(colname+'<button id="delcol" class="buttonGray" style="float:right;" onclick=deletecol(this) >X</button>');
		if (coltype =="multi"){
			$("#tbl_"+attrname+" tbody tr").each(function()	{$(this).children('td:last').prev().append($("<textarea placeholder='Seperate multiple values with semicolon(;)'>"))});
		}
		else if (coltype =="year"){
			$("#tbl_"+attrname+" tbody tr").each(function()	{$(this).children('td:last').prev().append($('<input type="number" min="1900" max="2099" step="1" value="2017" />'))});
		}
		else{
			$("#tbl_"+attrname+" tbody tr").each(function()	{$(this).children('td:last').prev().append($("<input type="+coltype+">"))});
				
		}
    }else{alert('Enter Text');}
}

function del_row(element){
	$(element).closest('tr').remove();
}


	
function add_row(attrname){
	var $tableBody = $('#tbl_'+attrname).find("tbody"),
    $trLast = $tableBody.find("tr:last"),
    $trNew = $trLast.clone();	
	$trLast.after($trNew);
}

function editvalue(element,inputtype){
	var $this = $(element);
    var $input = $('<input>', {
        value: $this.text(),
        type: inputtype,
        style: "min-width:200px;width: "+(($this.text().length + 1) * 8) +"px",
        blur: function() {
           $this.text(this.value);
        },
        keyup: function(e) {
           if (e.which === 13) $input.blur();
        }
    }).appendTo( $this.empty() ).focus();
}


function generate_attribute(){
	$("#divfield").slideToggle("slow");
	
}

function addattribute(){
	window.alert("addattribute");

	var e = document.getElementById("ftype");
	var attributename=e.options[e.selectedIndex].value;
	if (attributename=="new")
	{
		$("#attributeform").slideToggle("slow");
	}
	else{
		var attributes=[attributename];
	   	
	   	$.ajax({
			url: 'templates/edit_attribute.tpl',
			async: false,
			type: 'GET'
		})
		.done(function(template) {
			var $commentsContainer = $('#divadditionalattribute');
		    var old = $commentsContainer.html();
			$('#divadditionalattribute').setTemplate(template);
			$('#divadditionalattribute').processTemplate(attributes);
			$('#divadditionalattribute').prepend(old);
			
		});
	   	
	   	var datas={};
		datas['Name']=attributename;
		
		datas['fields']=Object.keys(dict[attributename]);
		
		datas['data']=[];
		var row={};
		for(var i=0;i<datas['fields'].length;i++){
			var key=datas['fields'][i];
			row[key]={}
			row[key]['value']='';	
			row[key]['type']=dict[attributename][key];	
			
		}
		datas['data'].push(row);
	
		console.log(datas);
						
		$.ajax({
			url: 'templates/edit_employment.tpl',
			async: false,
			type: 'POST'
		})
		.done(function(template) {
			$('#divtbl_'+attributename).setTemplate(template);
			$('#divtbl_'+attributename).processTemplate(datas);
		});
	}
}

function addnewfield(){
	var newdiv = document.getElementById('field');
	 $("#field").append('<br/><p style = "margin-left:75px;margin-top:30px;color:#808080;font-weight: bold;font-family: Courier New;">'+'Field Name: '+'<input type="text" class="fieldname" placeholder="Enter field name"/>'+' Field Type:'+'<select placeholder="Select data type" class="fieldtype"><option value="" disabled selected>Select data type</option><option value="text">text</option><option value="date">date</option><option value="email">email</option><option value="month">month</option><option value="number">number</option><option value="range">range</option><option value="tel">tel</option><option value="time">time</option><option value="url">url</option></select><button class="buttonGray" style="margin-left: 20px; width: 25px;" onclick="removefield(this);">X</button></p>');
}

function removefield(element){
	console.log("function called");
	$(element).parent('p').remove();
}
function update_innerhtml(object){
	object.innerHTML = object.value;
}






function addnewattribute(passed_attribute_name){
	if ((all_attribute.find_attribute(passed_attribute_name))[0]){
		alert("Attribute already exists");
		return;
	}
	all_attribute.add_attribute(passed_attribute_name); //updated portion of the code
	var attrname=passed_attribute_name;
	attrname.replace(/[.,\/#!+$%\^&\*;:{}=\-_`~()]/g," ")
/* 	attributeExist = false;
	for(var p = 0; p < attributeList.length; p ++) {
		if(attributeList[p].id.substring(14) == attrname){
			attributeExist = true;
		}
	}
	if (attributeExist){
		alert("attribute Alreay Exist");
		return;
	} // older examine if the attribute already exist
	 */
	
	
	
	var description=document.getElementById('description').value;
	//var source=document.getElementById('source').value;
	var source="Manual";
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
	
	
	
	console.log("should be printed");
	
	
 	console.log(all_data);
	
	$.ajax({
	    url: "CVSelection.jsp",//servlet URL that gets first option as parameter and returns JSON of to-be-populated options
	    type: "post",//request type, can be GET
	    cache: false,//do not cache returned data
	    data: {"record":JSON.stringify(all_data),"task":"insertnewattribute"},//data to be sent to the server
	    //dataType: "json"//type of data returned
	}).done(function() {
		console.log("Insert new attribute successful");
	    });
	
	var attributes=[attrname];
   	
	
   	$.ajax({
		url: 'templates/edit_attribute.tpl',
		async: false,
		type: 'GET'
	})
	.done(function(template) {
		var $commentsContainer = $('#divadditionalattribute');
	    var old = $commentsContainer.html();
	    
		$('#divadditionalattribute').setTemplate(template);
		$('#divadditionalattribute').processTemplate(attributes);
		$('#divadditionalattribute').prepend(old);
	});
	
	
	
	tableId[attributeIndex] = attributes[0];
	

/* 	for (i = 0; i < tableId.length; i++) {
			
			if ((i == attributeIndex)) {
				$('#plain_content_' + tableId[i]).show();
				$('#divtbl_'+ tableId[i]).show();
				$('#div_'+ tableId[i]).show();
				
			}
			else {
				$('#plain_content_' + tableId[i]).hide();
				$('#divtbl_'+ tableId[i]).hide();
				$('#div_'+ tableId[i]).hide();
				
	
			}
			
	} */
	
	addAttributeName('editAttributeMenu', 'attributeName_' + attrname, attrname, plain_text_or_table_flag);

	
	
	
	attributeIndex ++;
	
   	document.getElementById("searchAttribute").value = "";
   	displayMatchedAttributes();
 	
	
 	var datas={};
	datas['Name']=attrname;
	
	datas['fields']=colsname;
	
	datas['data']=[];
	var row={};
	for(var i=0;i<listname.length;i++){
		var key=listname[i].value;
		row[key]={}
		row[key]['value']='';	
		row[key]['type']=listtype[i].value;	
		
	}
	datas['data'].push(row);
	
		
		
	console.log(datas);
		
		
	$.ajax({
		url: 'templates/edit_employment.tpl',
		async: false,
		type: 'POST'
	})
	.done(function(template) {
		
		$('#divtbl_'+attrname).setTemplate(template);
		$('#divtbl_'+attrname).processTemplate(datas);
	});
 
	
	
	
	
	
	
	$('#mainMenu').css('width',"75px");
	editImageSelected = false;
	editAttributeSelected = true;
	importAttributeSelected = false;
	addAttributeSelected = false;
	saveAttributeSelected = false;



	
	$('#editImage').attr("src","img/editImage.png");
	$('#editAttribute').attr("src","img/editAttributeHover.png");
	$('#importAttribute').attr("src","img/importAttribute.png");
	$('#addAttribute').attr("src","img/addAttribute.png");
	$('#saveAttribute').attr("src","img/saveAttribute.png");


	
	$('#settingsMenu').css( "zIndex", 0);
	$('#generalInfoMenu').css( "zIndex", 0);
	$('#editAttributeMenu').css( "zIndex", 1);
	$('#importAttributeMenu').css( "zIndex", 0);
	$('#addAttributeMenu').css( "zIndex", 0);
	$('#saveAttributeMenu').css( "zIndex", 0);


	
	$('#settingsMenu').css('margin-left',"-200px");
	$('#generalInfoMenu').css('margin-left',"-200px");
	$('#editAttributeMenu').css('margin-left',"75px");
	$('#importAttributeMenu').css('margin-left',"-200px");
	$('#addAttributeMenu').css('margin-left',"-200px");
	$('#saveAttributeMenu').css('margin-left',"-200px");
	
}







$('#btnAddPaper').click(function(){
	var keyword=$("#keyword").val();
	 $.ajax({
	      type:'get',
	      url:'http://export.arxiv.org/api/query?search_query=ti:'+keyword,
	      cache:false,
	      //data:{'search_query':'ti:'+keyword},
	      success: function(response) {
	    	  xmlDoc=response;
	    	  var y = xmlDoc.getElementsByTagName("entry");
	            for (var j = 0; j < y.length; j++) {
	                document.getElementById('getpapers').innerHTML = document.getElementById('getpapers').innerHTML +"<b>"+ y[j].getElementsByTagName("title")[0].childNodes[0].nodeValue + "<b><br>";
	                var authors=y[j].getElementsByTagName("author");
	                for(var k=0;k<authors.length;k++){
	                	document.getElementById('getpapers').innerHTML = document.getElementById('getpapers').innerHTML + authors[k].getElementsByTagName("name")[0].childNodes[0].nodeValue+", ";
		                
	                }
	                document.getElementById('getpapers').innerHTML = document.getElementById('getpapers').innerHTML +"<br>";
	                	
	            }
	    	  
	      },
	      
	   });
})


	
</script>
</body>
</html>