package checkrank;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public final class UrlFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		String url = ((HttpServletRequest) request).getRequestURL().toString();
		HttpServletResponse resp = (HttpServletResponse) response;
		
		if(Pattern.matches("^http://wordtrends.net[\\w\\W]*", url))
		{
			url = url.replaceAll("http://wordtrends.net", "http://viettrends.com");
			
			resp.setStatus(301);
			resp.setHeader("Location",url);
			chain.doFilter(request, response);
			return ;
		}
		chain.doFilter(request, response);

	}

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
}