<%@page import="java.util.HashMap"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="service.Utils"%>
<%
String[] arrs = (String[])request.getAttribute("arr");
String[] content = (String[])request.getAttribute("content");
String domain = (String) request.getAttribute("domain");
String str = (String) request.getAttribute("str");
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
		%>
		
		<div class="clear"></div>