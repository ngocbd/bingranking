<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="data.Data"%>
<%@page import="com.mongodb.DBCollection"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
DBCollection coll = Data.data("keywordunique");

DBCursor domainList = coll.find().sort(new BasicDBObject("date",-1)).limit(30);

if(domainList.size() > 0)
{
	out.print("<ul class=\"new_search\">");
	out.print("<li>New keywords : </li>");	
	while(domainList.hasNext())
	{
		DBObject obj = domainList.next();
		out.print("<li><a href='/keyword/"+obj.get("name")+"'>"+obj.get("name")+"</a></li>");
	}
	out.print("</ul>");
}
%>