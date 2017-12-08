package checkrank;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class HomeServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setCharacterEncoding("utf-8");
		try {
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
