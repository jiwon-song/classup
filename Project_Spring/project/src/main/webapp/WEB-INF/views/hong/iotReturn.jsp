<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%

	String iotReturn = (String)request.getAttribute("state") + '?';

	out.println(iotReturn);	
	
	// 아두이노로 값보내기  	
	 
   /*  BufferedReader in = null; 
    try { 
   	 URL obj = new URL("http://192.168.0.109/bb " + iotReturn + "?"); // 호출할 url 
	     HttpURLConnection con = (HttpURLConnection)obj.openConnection(); 
	     con.setRequestMethod("GET"); 
	     con.setReadTimeout(2000);
	     in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8")); 
	     
	     String line; 
	     while((line = in.readLine()) != null) { // response를 차례대로 출력 
	    	 System.out.println(line); 
	     }  
	     con.disconnect();
    } catch(Exception e) { 
   	 	e.printStackTrace(); 
	} finally { 
		 if(in != null) {
			 try { 
				 in.close(); 
			 } catch(Exception e) {	 
				 e.printStackTrace(); 
			 } 
		 }
    }     
 */

%>


