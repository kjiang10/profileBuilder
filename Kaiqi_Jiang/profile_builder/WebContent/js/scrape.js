// //search for lecture videos, haven't categorize yet
var request = require('request');
var lupus = require('lupus');
var cheerio = require('cheerio');
var jQuery = require('jquery');
fullname="Jiawei Han";
videolectures(fullname,function(data_returned){
	console.log("after return");
	console.log(data_returned);
},function(err){
console.log("Error");
});



function videolectures(fullName,callBack,errCallBack)
{
	var propertiesObject = {q:fullName.replace(" ","+")};
	var videos_arr = [];
    request({url:"http://videolectures.net/site/search", qs:propertiesObject},
  function(err, response, body) {
    
  if (!err && response.statusCode == 200) {

      var $ = cheerio.load(body);
      var titles = [];
      var authors = [];
      var locations = [];
      var summaries = [];
      var url=[];
      $("a b").each(function(i, elem){
        titles.push($(this).text().toString().replace(/^\s|\s$/g,''));
        iurl=$(this).parent("a").attr("href");
        iurl="http://videolectures.net"+iurl;
        url.push(iurl);


      });//each function finish 
      $(".lectures small ").each(function(i, elem){
        var small_element = $(this).text().toString().replace(/\s/gm,'');
        var test_res = /^\d/.test(small_element) && /[:]/.test(small_element);

        if(!test_res){
        	authors.push(small_element);
        }

      });
      $("ul[class=search-highlights]").each(function(i, elem){
        var summary_items  = [];
        $(this).find("li").each(function(i, elem){
          summary_items.push($(this).text().toString().replace(/^\s|\s$/g,''));


        });
        summaries.push(summary_items);
      });

      
      var i;
      for( i = 0; i < titles.length && i < authors.length && i < summaries.length; i++ )
      {
      	var video_obj = {};
      	video_obj["title"] = titles[i];
      	video_obj["Venue"] = authors[i];
      	video_obj["summary"] = summaries[i];
      	video_obj["url"]=url[i];
      	videos_arr.push(video_obj);
      }
      //console.log(videos_arr);
    }
  callBack(videos_arr);//outermost if finish 
  }
);
}