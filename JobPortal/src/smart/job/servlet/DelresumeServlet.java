package smart.job.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import smart.job.dao.ResumeDao;

/**
 * Servlet implementation class DelresumeServlet
 */
@WebServlet("/DelresumeServlet")
public class DelresumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelresumeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        final HttpSession session = request.getSession(true);
        final String hostname = (String)session.getAttribute("host");
        final String id = request.getParameter("id").trim();
        System.out.println("servlet" + id);
        final int status = ResumeDao.delete(hostname, id);
        response.setContentType("text/html");
        if (status > 0) {
            response.getWriter().write("success");
        }
        else {
            response.getWriter().write("failed");
        }
	}

}
