<%@page import="com.mongodb.DBCursor"%>
<%@ page contentType="text/xml;charset=UTF-8" language="java"%>
<%@page import="java.util.List"%><?xml version="1.0" encoding="UTF-8"?>
<urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
  <url>
  <loc>http://trendybing.com/</loc>
</url>
<%
DBCursor domainList= (DBCursor)request.getAttribute("domainList");
while(domainList.hasNext())
{
	String name = domainList.next().get("name").toString();
%>
  <url>
  <loc>http://trendybing.com/keyword/<%=name.replaceAll("[=&]+","")%></loc>
</url>

<%
}
%>

</urlset>