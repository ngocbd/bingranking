<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	response.setCharacterEncoding("utf-8");
%>
<head>
<link rel='stylesheet' type='text/css' href='/css/wstyle.css' />
<title><%=request.getParameter("title")%></title>
<meta name="google-site-verification" content="6DwZqmnkm7RwLcqAD2f_pV_8rDg8hiHkIhOEMMYBst8" />
<meta name="description"
	content="<%=request.getParameter("description").replaceAll("[\"\']+",
					"")%>" />
<meta name="Keywords"
	content="<%=request.getParameter("keywords")
					.replaceAll("[\"\']+", "")%>" />
</head>
<body>
	<div class="headder">
		<a href="/"><img src="/images/logo.png" alt=""/></a>
		<div class="form">
			<input type="text" name="str" id="str"/>
			<button type="button" id="button">Check</button>
		</div>
		<div class="addthis">
			<!-- AddThis Button BEGIN -->

				<div class="addthis_toolbox addthis_default_style ">
					<a class="addthis_button_facebook_like"
						fb:like:layout="button_count"></a> <a class="addthis_button_tweet" tw:via="5ty"></a>
					<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
					<a class="addthis_counter addthis_pill_style"></a>
				</div>
				<script type="text/javascript"
					src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4d6f3cdb1d190d60"></script>
				<!-- AddThis Button END -->
		</div>
		<div class="clear"></div>
	</div>
	<center>
		Tips: Trendybing tools that helps you track your keyword rankings on the different bing.
	</center>
	<div class="choice">
		<div style="float: left;">
			<input type="text" value="www.example.com" onclick="javascript:this.value=''" id="domain"/>
			<span style="color: #666666;font-style: italic;">Your Domain to Display Highlight</span>
		</div>
	</div>
	<div class="clear"></div>