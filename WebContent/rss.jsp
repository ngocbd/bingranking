<%@page import="java.util.Date"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.util.List"%>
<%
	DBCursor domainList= (DBCursor)request.getAttribute("domainList");
	String title = "Check keyword rankings on the search engine";
	String description = "wordtrends tools that helps you track your keyword rankings on the different search engines.";
%><?xml version="1.0" encoding="UTF-8"?>
  <rss version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
    xmlns:admin="http://webns.net/mvcb/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:content="http://purl.org/rss/1.0/modules/content/">
	
    <channel>
    
    <title><![CDATA[ <%=title %>]]></title>
    <link>http://trendybing.com/</link>
    <description><![CDATA[<%=description %>]]></description>
    <dc:language>en-ca</dc:language>
    <dc:creator>group</dc:creator>

    <dc:rights>Copyright 2011</dc:rights>
    <admin:generatorAgent rdf:resource="http://trendybing.com/" />
    	<%
    		while(domainList.hasNext())
    		{
    			DBObject name = domainList.next();
    	%>
		       <item>
		          <title><![CDATA[ <%=name.get("name")%> ]]></title>
		          <link>http://trendybing.com/keyword/<%=name.get("name") %></link>
		          <guid>http://trendybing.com/keyword/<%=name.get("name") %></guid>
		
		          <description><![CDATA[ 
		          <%
		          			out.println("ranking of the "+name.get("name")+" on the search engines to list the first 10 results returned");
	  
		          %>
		          ]]></description>
		      	  <pubDate>
		      	  	<%=new Date(Long.parseLong(name.get("date").toString())).toGMTString()%>
		      	  </pubDate>
		       </item>
       <%
    		}
       %>
    </channel>
</rss>  