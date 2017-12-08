<%
String title = "Check keyword rankings on the search engine";
String description = "wordtrends tools that helps you track your keyword rankings on the different search engines.";
String keywords = "wordtrends,keyword,website,tool,ranking,check keyword";
%>
<%
	response.setCharacterEncoding("utf-8");
%>
<jsp:include page="/layout/header.jsp">
	<jsp:param name="title" value="<%=title %>"/>
	<jsp:param name="description" value="<%=description %>"/>
	<jsp:param name="keywords" value="<%=keywords %>"/>
	<jsp:param name="index" value="true"/>
</jsp:include>
	<div class="body">
		<ul class="new_search">
			
		</ul>
		<div class="clear"></div>
		
		<div id='content'>
			
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