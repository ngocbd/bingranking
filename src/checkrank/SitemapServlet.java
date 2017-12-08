package checkrank;


import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.bson.BSONObject;


import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import data.Data;


@SuppressWarnings("serial")

public class SitemapServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		DBCollection coll = Data.data("keywordunique");

		DBCursor domainList = coll.find().sort(new BasicDBObject("date",-1)).limit(500);

		req.setAttribute("domainList", domainList);
	
		try {
			req.getRequestDispatcher("/sitemap.jsp").forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

