package checkrank;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

import data.Data;

import server.GetBing;
import server.GetContent;

@SuppressWarnings("serial")
public class CheckServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setCharacterEncoding("utf-8");
		

		String domain = req.getParameter("domain").trim();
		

		String str = req.getParameter("name");

		str = URLDecoder.decode(str,"UTF-8");

		String[] arr = new String[1];
		String[] content = new String[10];
		
		int j=0;

		new GetBing(str,"www.bing.com",arr,j,content);
		
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		req.setAttribute("arr", arr);
		req.setAttribute("str", str);
		req.setAttribute("content", content);
		req.setAttribute("domain", domain);
		
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
			req.getRequestDispatcher("/check.jsp").forward(req, resp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}