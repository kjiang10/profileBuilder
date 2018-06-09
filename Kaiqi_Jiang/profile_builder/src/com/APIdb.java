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


public class APIdb extends HttpServlet {
	  public void init() throws ServletException
	  {
	      // Do required initialization
	  }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String fields=request.getParameter("fields");
		List<String> items = Arrays.asList(fields.split("\\s*,\\s*"));
		System.out.print(items);
		
		MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
		 // Now connect to your databases
		DB db = mongoClient.getDB( "cvdb" );
		System.out.println("Connect to database successfully");
		
		DBCollection collection = db.getCollection("resumes");	
		BasicDBObject whereQuery = new BasicDBObject();
		whereQuery.put("username", username);
		BasicDBObject cols = new BasicDBObject();
		for (int k=0;k<items.size();k++){
			cols.put(items.get(k), 1);
		}
		cols.put("_id", 0);
		DBCursor cursor = collection.find(whereQuery,cols);
        String serialize = JSON.serialize(cursor);
		response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
	    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
	    response.getWriter().write(serialize); 	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
