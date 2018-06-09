
var domain_url = 'http://172.16.2.13:8080/ARISE-PeopleSearch-API/';
//var domain_url = 'http://42.61.39.90/ARISE-PeopleSearch-API/';
//var domain_url = 'http://localhost:8080/ARISE-PeopleSearch-API/';
//var domain_url = 'http://192.168.0.60:8080/ARISE-PeopleSearch-API/';

var cluster_data = new Object();
var decode_data = new Array();
var fg_data_obj = new Array();
var username;
var fullname;
var affiliation;





var dict = {};

dict["ContactInformation"]={};
dict["Homepages"]={};
dict["Education"]={};
dict["Employment"]={};
dict["Honor"]={};
dict["Course"]={};
dict["LinkedInUrl"]={};
dict["Book"]={};
dict["Paper"]={};
dict["ContactInformation"]["Address"]="text";
dict["ContactInformation"]["Email"]="email";
dict["ContactInformation"]["Phone"]="tel";
dict["Homepages"]["Homepage"]="url";
dict["Homepages"]["LinkedInUrl"]="url";
dict["Education"]["School"]="text";
dict["Education"]["Degree"]= "text";
dict["Education"]["StartDate"]= "month";
dict["Education"]["EndDate"]=  "month";
dict["Employment"]["Title"]=  "text";
dict["Employment"]["Company"]=  "text";
dict["Employment"]["StartDate"]= "month";
dict["Employment"]["EndDate"]=  "month";
dict["Honor"]["HonorName"]=  "textarea";
dict["Honor"]["HonorDate"]=  "year";
dict["Course"]["CourseName"]=  "text";
dict["Course"]["CourseTime"]=  "text";
dict["Book"]["BookTitle"]=  "text";
dict["Book"]["BookAuthor"]=  "text";
dict["Book"]["BookPublisher"]=  "text";
dict["Book"]["BookYear"]=  "year";
dict["Paper"]["PaperTitle"]=  "text";
dict["Paper"]["PaperYear"]=  "year";
dict["Paper"]["PaperConference"]=  "text";
dict["Paper"]["PaperAuthor"]=  "text";




