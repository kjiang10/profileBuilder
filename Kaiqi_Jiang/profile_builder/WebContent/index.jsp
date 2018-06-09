<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Profile Builder</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
</head>
<body>		
	<!-- separator from the top -->
	<div style="height:127px;"></div>
	
	<!-- Arise People Logo -->
	<img src="img/logo.png" alt="Profile Builder" class="center" />
	
	<!-- separator from the logo -->
	<div style="height:50px;"></div>
	
	<!-- form to submit search query -->
	<form id="form_searchQuery" name="createcv" action="createcv" class="form-horizontal center-children">		
		<!-- search boxes -->
		<div class="center">		 
			<input id="input_name" type="text" name="name" class="large-width large-height" placeholder="Person's name, e.g. Jiawei Han" required>
			<input id="input_institution" type="text" name="institution" class="large-width large-height" placeholder="Person's current affiliation, e.g. UIUC" required>						
		</div>
		
		<!-- separator -->
		<div style="height:10px;"></div>
		
		
		<!-- separator -->
		<div style="height:20px;"></div>
		
		<!-- search button -->
		<div class="center">		
			<button class="btn btn-primary center large-height" type="submit"><strong>Create Profile</strong></button>			 
		</div>
		
		

		
		<!-- separator -->
		<div style="height:20px;"></div>
		
		<!-- error message -->
		<div id="div_error" class="alert alert-error center">
			<button id="close_error" type="button" class="close" onclick="closeErrorMessage()">×</button>      
	        Please enter the person name
       	</div>		
	</form>	
	<button onclick="chrome.webstore.install()" id="install-button">Add to Chrome</button>
   	
	<script>
		function closeErrorMessage() {
			$('#div_error').hide("fast");
		}
		
		
		
		
		
   	</script>
   	<script>
   	
   	
   	if (chrome.app.isInstalled) {
   	  document.getElementById('install-button').style.display = 'none';
   	}

	
	</script>
</body>
</html>