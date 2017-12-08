package checkrank;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.ResourceBundle;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import server.GetBing;
import server.GetContent;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.sun.org.apache.bcel.internal.generic.NEW;

import data.Data;

@SuppressWarnings("serial")
public class KeywordServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		resp.setCharacterEncoding("utf-8");
		String path = ((HttpServletRequest)req).getRequestURI();
		String domain = req.getParameter("domain");
		StringTokenizer st = new StringTokenizer( path,"/");
        int count = st.countTokens(); 
        
        if(count!=2)
        {
        	
        	resp.getWriter().println("Bad request : "+req.getRequestURI());
        	resp.getWriter().close();
        	return ;
        	
        }

		st.nextToken();
		String str = st.nextToken();
		str = URLDecoder.decode(str,"UTF-8");
		
		if(str.equals("مقاطع سكس عربى")||str.equals("fatbeurette"))
		{
			resp.sendError(resp.SC_NOT_FOUND,"Content removed because our policy !");
		}
		
		str = str.replaceAll("[ ]+", "+");

		
		DBCollection coll = Data.data("keyword");
		DBObject cu = coll.findOne(new BasicDBObject("name",str));
		
		if(cu!=null)
		{
			req.setAttribute("cu", cu);
			
			DBCollection colls = Data.data("keywordunique");
//			DBCursor oldKey = colls.find(new BasicDBObject("date",new BasicDBObject("$gt",cu.n)));
		} else {
			String[] arr = new String[1];
			String[] content = new String[10];
			int j=0;

			new GetBing(str,"www.bing.com",arr,j,content);

			
			try {
				Thread.sleep(1500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			req.setAttribute("arr", arr);
			req.setAttribute("content", content);
		}
		req.setAttribute("domain", domain);
		
		req.setAttribute("keyword", str);
		
		DBCollection colls = Data.data("keywordunique");
		DBObject db = colls.findOne(new BasicDBObject("name",str));
		if(db == null)
		{
			BasicDBObject key = new BasicDBObject();
			key.put("name", str);
	
			key.put("date", new Date().getTime());
			colls.insert(key);
		}
		try {
			req.getRequestDispatcher("/keyword.jsp").forward(req, resp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
