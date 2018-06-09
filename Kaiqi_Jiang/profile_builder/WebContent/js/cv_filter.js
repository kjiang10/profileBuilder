var paperInfoObj;
var currentPaperObj;
var videoRequest;

function cv_filter(entity_obj, name, more_info) {
	// init ui
	// init_ui(name, more_info);
	
	//var entity_obj = fg_data_obj[entity_id];

	// nationality
	if ('Nationality' in entity_obj) {	
		$("#dv_Nationality").css("display", "block");
	}
	
	
	// address
	if ('Address' in entity_obj) {
		$("#dv_Address").css("display", "block");
	}
	
	
	// email
	if ('Email' in entity_obj) {
		$("#dv_Email").css("display", "block");
	}
	
	
	// phone
	if ('Phone' in entity_obj) {

		$("#dv_Phone").css("display", "block");
	}
	
	
	// homepage
	if ('Homepage' in entity_obj) {

		$("#dv_Homepage").css("display", "block");
	}
	
	// Social Accounts
	var facebookObj = entity_obj['FacebookUrl'];
	var twitterObj = entity_obj['TwitterUrl'];
	var googleplusObj = entity_obj['GooglePlusUrl'];
	var linkedinObj = entity_obj['LinkedInUrl'];
	var wikipediaObj = entity_obj['WikipediaUrl'];
	if (facebookObj != undefined || twitterObj != undefined || googleplusObj != undefined ||
		linkedinObj != undefined || wikipediaObj != undefined) {
		$("#dv_SocialAccounts").css("display", "block");
	}
	
	
	
	// bio
	if ('Bio' in entity_obj) {
		$("#dv_Bio").css("display", "block");
	}
	
	
	// employment
	if ('Employment' in entity_obj) {
		var employmentList = entity_obj['Employment'];
		if (employmentList != undefined && employmentList.length > 0) {
			$("#dv_Employment").css("display", "block");
		}		
	}

	
	// education
	if ('Education' in entity_obj) {
		var educationList = entity_obj['Education'];
		if (educationList != undefined && educationList.length > 0) {	
			$("#dv_Education").css("display", "block");
		}
	}
	
	
	// award
	if ('Honor' in entity_obj) {
			$("#dv_Award").css("display", "block");

	}
	
	// course
	if ('Course' in entity_obj) {			
			$("#dv_Course").css("display", "block");
	}
	
	
	
	// Paper	
	if ('Paper' in entity_obj) {
		$("#dv_Paper").css("display", "block");
	}

	
	// Book
	if ('Book' in entity_obj) {
		$("#dv_Book").css("display", "block");
	}

	
	
}