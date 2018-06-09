package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;

import com.mongodb.ServerAddress;
import java.util.Arrays;
import com.mongodb.util.JSON;
import com.mongodb.MongoException;
import java.util.*;
import com.mongodb.AggregationOutput;
import com.mongodb.AggregationOptions;




// Extend HttpServlet class
public class Accessdb extends HttpServlet {
	
	private String json;
	private String username;
	private String task;
	private String attrname;
	  public void init() throws ServletException
	  {
	      // Do required initialization
	  }

	  public void doGet(HttpServletRequest request,
              HttpServletResponse response)
      throws ServletException, IOException{
		try{
			task=request.getParameter("task");
			MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
			 // Now connect to your databases
			DB db = mongoClient.getDB( "cvdb" );
			System.out.println("Connect to database successfully");
			
			if (Objects.equals(task, new String("insertresume"))){
				System.out.print(task);
				json=request.getParameter("all_data");
				username=request.getParameter("username");
				DBCollection collection = db.getCollection("resumes");			
				BasicDBObject whereQuery = new BasicDBObject();
				whereQuery.put("username", username);
				DBCursor cursor = collection.find(whereQuery);
				
				if (cursor.count() >0) {
					DBObject doc = collection.findOne(whereQuery); //get first document
					collection.remove(doc);
					DBObject dbObject = (DBObject)JSON.parse(json);	
					collection.insert(dbObject);
				}
				
				/*while (cursor.hasNext()) {
					collection.remove(cursor.next());
				}*/
										
				else{
				DBObject dbObject = (DBObject)JSON.parse(json);		
				collection.insert(dbObject);	
				}
				
				//response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    //response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    //response.getWriter().write("Data saved successfully"); 
			}
			else if(Objects.equals(task, new String("insertnewfield"))){
				System.out.print(task);
				json=request.getParameter("record");
				attrname=request.getParameter("attrname");
				String name=request.getParameter("name");
				String type=request.getParameter("type");
				DBCollection collection = db.getCollection("newfield");			
				BasicDBObject whereQuery = new BasicDBObject();
				whereQuery.put("attribute", attrname);
				DBCursor cursor = collection.find(whereQuery);
				if (cursor.count() >0) {
					DBObject listItem = new BasicDBObject("fields", new BasicDBObject("Name",name).append("type",type));
					DBObject updateQuery = new BasicDBObject("$push", listItem);
					collection.update(whereQuery, updateQuery);
				}
				else{
					DBObject dbObject = (DBObject)JSON.parse(json);				
					collection.insert(dbObject);	
				}
				//response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    //response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    //response.getWriter().write("Field saved successfully"); 
			}
			else if(Objects.equals(task, new String("insertnewattribute"))){
				System.out.print(task);
				json=request.getParameter("record");
				DBCollection collection = db.getCollection("newattribute");		
				DBObject dbObject = (DBObject)JSON.parse(json);				
				collection.insert(dbObject);
				//response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    //response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    //response.getWriter().write("Attribute saved successfully"); 
				
				
				
			}
			else if(Objects.equals(task, new String("checkinsertnewattribute"))){
				System.out.print(task);
				json=request.getParameter("record");
		
				DBCollection collection = db.getCollection("newattribute");		
				DBObject dbObject = (DBObject)JSON.parse(json);	
				
				
				collection.update(dbObject, dbObject,true,false);
				
				//response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    //response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    //response.getWriter().write("Attribute saved successfully"); 
				
			}
			
			
			else if(Objects.equals(task, new String("getnewfields"))){
				System.out.print(task);
				attrname=request.getParameter("attribute");
				DBCollection collection = db.getCollection("newfield");	
				BasicDBObject whereQuery = new BasicDBObject();
				whereQuery.put("attribute", attrname);
				DBCursor cursor = collection.find(whereQuery);
		        String serialize = JSON.serialize(cursor);
				response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    response.getWriter().write(serialize); 	
			}
			else if(Objects.equals(task, new String("getaddattributes"))){
				System.out.print(task);
				DBCollection collection = db.getCollection("newattribute");	
				DBCursor cursor = collection.find();
		        String serialize = JSON.serialize(cursor);
				response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    response.getWriter().write(serialize); 	
				
			}
			else if(Objects.equals(task, new String("searchattributes"))){
				System.out.print(task);
				attrname=request.getParameter("attribute");
				DBCollection collection = db.getCollection("newattribute");	
				BasicDBObject whereQuery = new BasicDBObject();
				whereQuery.put("attribute", attrname);
				DBCursor cursor = collection.find(whereQuery);
		        String serialize = JSON.serialize(cursor);
				response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    response.getWriter().write(serialize); 	
				
			}
			else if(Objects.equals(task, new String("getresume"))){
				System.out.print(task);
				username=request.getParameter("username");
				DBCollection collection = db.getCollection("resumes");	
				BasicDBObject whereQuery = new BasicDBObject();
				whereQuery.put("username", username);
				BasicDBObject cols = new BasicDBObject();
				cols.put("_id", 0);
				cols.put("username", 0);
				DBCursor cursor = collection.find(whereQuery,cols);
		        String serialize = JSON.serialize(cursor);
				response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    response.getWriter().write(serialize); 	
				
			}
			else if(Objects.equals(task, new String("getallschemas"))){
				DBCollection collection = db.getCollection("newattribute");	
				DBObject groupFields = new BasicDBObject( "_id", "$attribute");
				groupFields.put("fields", new BasicDBObject("$push", "$fields"));
				groupFields.put("Description", new BasicDBObject("$push", "$Description"));
				groupFields.put("Source", new BasicDBObject("$push", "$Source"));
				DBObject group = new BasicDBObject("$group", groupFields);
				// run aggregation
				AggregationOutput output = collection.aggregate(group);
		        String serialize = JSON.serialize(output.results());
				response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    response.getWriter().write(serialize); 	
				
			}
		
			else{
				response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			    response.getWriter().write("Failed"); 
			}
		}
		catch(Exception e){
        System.err.println( e.getClass().getName() + ": " + e.getMessage() );
		}
	}
	  
	  public void doPost(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		  	
		      doGet(request, response);
		   }
	  
	
	
}


