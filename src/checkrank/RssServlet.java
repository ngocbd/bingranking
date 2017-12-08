package checkrank;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;

import data.Data;


@SuppressWarnings("serial")
public class RssServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");

		DBCollection coll = Data.data("keywordunique");

		DBCursor domainList = coll.find().sort(new BasicDBObject("date",-1)).limit(30);

		req.setAttribute("domainList", domainList);
		
		try {
			req.getRequestDispatcher("/rss.jsp").forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
