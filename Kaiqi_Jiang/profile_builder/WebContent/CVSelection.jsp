<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attributes selection</title>
</head>
<script type="text/javascript">
		console.log('ready')
		console.log("print local storage")
		var entity_obj = localStorage.getItem('entity_obj');
		console.log('entity_obj: ', JSON.parse(entity_obj));
		//$('#wait_icon_' + entity_obj).css('display', 'inline-block');
		cv_filter(JSON.parse(entity_obj), '<s:property value="name"/>', '<s:property value="moreInfo"/>');
	</script>
<body>
<form action="editcv" method="GET">
<div align="center" style="padding-left:200px; text-align:left;">
<h3>Select the attributes for your CV</h3>

<div id="dv_Nationality" style="display:none;">
<input type="checkbox" id="Nationality" value="Nationality"> Nationality<br>
</div>

<div id="dv_Address" style="display:none;">
<input type="checkbox" name="Address" id="Address" value="Address"> Address<br>
</div>

<div id="dv_Email" style="display:none;">
<input type="checkbox" name="Email" id="Email" value="Email"> Email<br>
</div>

<div id="dv_Phone" style="display:none;">
<input type="checkbox" name="Phone" id="Phone" value="Phone"> Phone<br>
</div>

<div id="dv_Homepage" style="display:none;">
<input type="checkbox" id="Homepage" name="Homepage" value="Homepage">Homepage<br>
</div>

<div id="dv_SocialAccounts" style="display:none;">
<input type="checkbox" id="SocialAccounts" name="SocialAccounts" value="SocialAccounts"> Social Accounts<br>
</div>

<div id="dv_Bio" style="display:none;">
<input type="checkbox" id="Bio" name="Bio" value="Bio"> Bio<br>
</div>

<div id="dv_Award" style="display:none;">
<input type="checkbox" id="Award" name="Award" value="Award"> Award<br>
</div>

<div id="dv_Education" style="display:none;">
<input type="checkbox" name="Education" id="Education" value="Education"> Education<br>
</div>

<div id="dv_Employment" style="display:none;">
<input type="checkbox" id="Employment" name="Employment" value="Employment"> Employment<br>
</div>


<div id="dv_Course" style="display:none;">
<input type="checkbox" id="Course" name="Course" value="Course"> Course<br>
</div>


<div id="dv_Paper" style="display:none;">
<input type="checkbox" id="Paper" name="Paper" value="Paper"> Paper<br>
</div>


<div id="dv_Book" style="display:none;">
<input type="checkbox" id="Book" name="Book" value="Book"> Book<br/><br/>
</div>

<button class="btn btn-primary" type="submit">Generate CV</button>
</div>
</form>
<script type="text/javascript" src="js/cv_filter.js"></script>
<script type="text/javascript" src="js/constants.js"></script>
<script type="text/javascript" src="js/init-ui.js"></script>
<script type="text/javascript" src="js/control-progress.js"></script>
<script type="text/javascript" src="js/process-request.js"></script>
<script type="text/javascript">
		console.log('ready')
		console.log("print local storage")
		var entity_obj = localStorage.getItem('entity_obj');
		console.log('entity_obj: ', JSON.parse(entity_obj));
		//$('#wait_icon_' + entity_obj).css('display', 'inline-block');
		cv_filter(JSON.parse(entity_obj), '<s:property value="name"/>', '<s:property value="moreInfo"/>');
	</script>
	
</body>
</html>