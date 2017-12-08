<%@page import="server.Utils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%
DBObject cu = (DBObject) request.getAttribute("cu");
String keyword = (String) request.getAttribute("keyword");
ResourceBundle resource = ResourceBundle.getBundle("google");

String[] arrs = (String[])request.getAttribute("arr");
String[] content = (String[])request.getAttribute("content");
if(cu!=null)
{
	content = cu.get("content").toString().replaceAll("^\\[ \"", "").replaceAll("\" \\]$", "").split("\" , \"");	
}

String domain = (String) request.getAttribute("domain");
%>
<%
	response.setCharacterEncoding("utf-8");
%>
<%
String title = "ranked '"+keyword+"' - trendybing";
String description = "ranking of the "+keyword+" on the search engines to list the first 10 results returned";
if(content!=null&&content[0]!=null)
	description = content[0];
String keywords = keyword;
%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel='stylesheet' type='text/css' href='/css/wstyle.css' />
<title><%=title%></title>
<meta name="google-site-verification" content="6DwZqmnkm7RwLcqAD2f_pV_8rDg8hiHkIhOEMMYBst8" />
<meta name="description"
	content="<%=description.replaceAll("[\"\']+",
					"")%>" />
<meta name="Keywords"
	content="<%=keywords
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

	<div class="body">
		<ul class="new_search">
			
		</ul>
		<div class="clear"></div>
		<div id='content'>
			<h1>Top ranked website for "<%=keyword.replaceAll("[+]+"," ") %>"</h1>
			<%
			if(cu != null)
			{
			%>
			
			<%
			int k=0;
	
				DBObject dbObject = cu;
				String[] arr = dbObject.get("result").toString().split(" ");
				
			%>
			<div class="box border<%=k%>">
	
					<%
					for(int j=0;j<arr.length;j++)
					{
						if(Pattern.matches("^http://[\\w\\W]+", arr[j]))
						{
					%>

							<a href="<%=arr[j]%>" rel="nofollow" target="_blank" title="<%=Utils.fomatDomain(arr[j]) %>" <%=(Utils.fomatDomain(arr[j]).equals(domain))?"style='color:red;'":"" %>><%=Utils.fomatDomain(arr[j]) %></a>
							<img src="http://gpageranks.appspot.com/pr.jsp?url=http://<%=Utils.fomatDomain(arr[j])%>" style="float: right;"/>
							<div class="clear"></div>
							<br/>
							<p><%=content[j] %></p>
							<br/>
					<%
						}
					}
					%>

			</div>
			<%
				k++;
				if(k%5==0)
					k=0;
				
			
			%>
			<%
			} else {
			%>
			<%
			int i=0;
			int k=0;
				if(arrs[i] != null)
				{
					String[] arr = arrs[i].split(" ");
			%>
				<div class="box border<%=k%>">
						<%
						for(int j=0;j<arr.length;j++)
						{
							if(Pattern.matches("^http://[\\w\\W]+", arr[j]))
							{
						%>
								<a href="<%=arr[j]%>" rel="nofollow" target="_blank" title="<%=Utils.fomatDomain(arr[j]) %>" <%=(Utils.fomatDomain(arr[j]).equals(domain))?"style='color:red;'":"" %>><%=Utils.fomatDomain(arr[j]) %></a>
								<img src="http://gpageranks.appspot.com/pr.jsp?url=http://<%=Utils.fomatDomain(arr[j])%>" style="float: right;"/>
								<div class="clear"></div>
								<br/>
								<p><%=content[j] %></p>
								<br/>
						<%
							}
						}
						%>

				</div>
			<%
				k++;
				if(k%5==0)
					k=0;
				}
				i++;
			}
			%>
			<div class="clear"></div>
		</div>
		<div class="adv">
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-1271973886625217";
			/* domainworlds 336x280 */
			google_ad_slot = "4751386823";
			google_ad_width = 336;
			google_ad_height = 280;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-1271973886625217";
			/* domainworlds 336x280 */
			google_ad_slot = "4751386823";
			google_ad_width = 336;
			google_ad_height = 280;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-1271973886625217";
			/* domainworlds 336x280 */
			google_ad_slot = "4751386823";
			google_ad_width = 336;
			google_ad_height = 280;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</div>
		
		<div class="clear"></div>
		<%@ include file='/element/new_keyword.jsp'%>
		<div class="clear"></div>
	</div>
<script src="/js/jquery.js"></script>	
<script src="/js/check.js"></script>
<%@ include file='/layout/footer.jsp'%>	