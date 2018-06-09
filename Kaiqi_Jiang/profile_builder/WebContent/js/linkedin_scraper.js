/**
 * 
 */


var request = require('request');
var fs = require('fs');
var async = require('async');

// CSV Modules
var json2csv = require('json2csv');
var csv = require('csv');

// Scrape Module
var Xray = require('x-ray');
var x = Xray();

/**
 * Params
 */

// Data
var loadPath = '/path/to/file';
var savePath = '/path/to/save/to';
var requestUrls = [];
var profileData = [];
var functionAsync = [];
var fields = [
    'name',
    'headline',
    'current',
    'current_position',
    'current_company',
    'current_tenure',
    'current_description',
    'previous',
    'skill1',
    'skill2',
    'skill3',
    'skill4',
    'skill5',
    'education',
    'latest_education_school',
    'latest_education_degree',
    'latest_education_major'
];

// Counters
var requestUrlCounter = 0;
var timeoutOptions = ['100','400','900','1000','300','200','1200','700'];

/**
 * Read CSV, Scrape, and dump to CSV
 */

var file = fs.readFileSync(loadPath);
csv.parse(file, function (err, data) {

    for (var key in data) {
        if (data.hasOwnProperty(key)) {
            var h = data[key];
            if (h[0] != '') {
                var url = h[0];
                requestUrls.push(url);
                functionAsync.push(function (callback) {
                    var url = requestUrls[requestUrlCounter];
                    setTimeout(function () {
                        x(url, {
                            'name': '#profile .masthead #name span.full-name',
                            'headline': '#profile .masthead p.title',
                            'current': '#profile #overview-summary-current ol',
                            'current_position': '#profile #background-experience .current-position h4',
                            'current_company': '#profile #background-experience .current-position h5',
                            'current_tenure': '#profile #background-experience .current-position .experience-date-locale',
                            'current_description': '#profile #background-experience .current-position p.description',
                            'previous': '#profile #overview-summary-past ol',
                            'skill1': '#profile #background-skills .skills-section li:nth-child(1)',
                            'skill2': '#profile #background-skills .skills-section li:nth-child(2)',
                            'skill3': '#profile #background-skills .skills-section li:nth-child(3)',
                            'skill4': '#profile #background-skills .skills-section li:nth-child(4)',
                            'skill5': '#profile #background-skills .skills-section li:nth-child(5)',
                            'education': '#profile #overview-summary-education ol',
                            'latest_education_school': '#profile #background-education .first h4',
                            'latest_education_degree': '#profile #background-education .first h5 span.degree',
                            'latest_education_major': '#profile #background-education .first h5 span.major'
                        })(function (err, obj) {
                            profileData.push(obj);
                            callback();
                        });
                    }, timeoutOptions[Math.floor(Math.random() * timeoutOptions.length)]);
                    requestUrlCounter++;
                });
            }
        }
    }
});