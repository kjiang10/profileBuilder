Profile Builder to manage and import profiles from other profile management system and external sources. It acts as a one stop portal for researchers to maintain their profile and create dynamic profiles according to their needs.

**Overview of the code base:**

WebContent/index.jsp: home page of the Profile Builder

WebContent/EditCV.jsp: web page to import from other external sources, add new attributes and edit attributes, export new attributes from external sources, such as Google Scholar, Linkedin, Facebook and arrange them in the certain order.

General info: contains all the general information the user enters

Add attributes: lets the user to manually create an attribute

Import attributes: lets the user to import their attributes from external sources

Edit attributes: lets the user to edit their their attributes after initialization

Save attributes: lets the user to select attributes needed and arrange them in the certain template.

WebContent/CVcheckbox.jsp: web page to select attributes

WebContent/SortCV.jsp: web page to sort, select and reorder records for each attribute

WebContent/TemplateSelection.jsp: web page to select template

WebContent/OnlineProfile.jsp: web page to output the profile

WebContent/CVbackend.jsp: web page for admins and developers to add new attributes from sources

src/Accessdb.java: code for connecting to mongodb, save, edit and fetch information from Mongodb.

src/APIdb.java: code for the API for profile builder which takes username and fields as input and outputs in JSON format.

WebContent/decorators: master-theme.jsp if the master template for all the pages in the webpage.

WebContent/css: contains all the css used in the website

WebContent/img: contains all the images used in the website

WebContent/js/grabdata.js: contains all the crawler and parser for all the external sources

WebContent/templates:

allschema.tpl: template to show all the existing schema in the system

edit_attribute.tpl: template for edit features such as insert column and insert row

edit_employment.tpl: template to show the data for each attribute

search_attribute.tpl: template for showing output from search attribute functionality



**API for the Profile Builder**

Takes username and fields as input and outputs in JSON format.

Example:

http://kite.cs.illinois.edu:8081/ProfileBuilder/ARISECVAPI.jsp?username=jiaweihan&fields=Patents



**Required Google Chrome Plugin:**

[https://chrome.google.com/webstore/detail/cors-toggle/omcncfnpmcabckcddookmnajignpffnh](Link URL)

[https://github.com/adtadhikari/Page-crawler.git](Link URL)



**The project was built on:**

java version "1.8.0_101"

Java(TM) SE Runtime Environment (build 1.8.0_101-b13)

Java HotSpot(TM) 64-Bit Server VM (build 25.101-b13, mixed mode)

Tomcat 7

Required: mongo-java-driver-3.0.4.jar

**Other tools and languages used in the project:**

JTemplates, node js, browserify, MongoDB, Struts

**Tutorials:**

For Java mongodb: [http://www.mkyong.com/tutorials/java-mongodb-tutorials/](Link URL)