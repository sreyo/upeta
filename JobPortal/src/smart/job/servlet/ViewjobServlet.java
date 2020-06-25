package smart.job.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import smart.job.bean.Job;
import smart.job.dao.JobDao;
/**
 * Servlet implementation class ViewjobServlet
 */
@WebServlet("/ViewjobServlet")
public class ViewjobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewjobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");

		  List<Job> list=JobDao.getAddjob(hostname);
		  
		  String userJsonString = new Gson().toJson(list);
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		/* System.out.println("string"+userJsonString.toString()); */
		  response.getWriter().write(userJsonString);
		 	}

}
