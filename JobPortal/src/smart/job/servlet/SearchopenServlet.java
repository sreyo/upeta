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
 * Servlet implementation class SearchopenServlet
 */
@WebServlet("/SearchopenServlet")
public class SearchopenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchopenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String job      = request.getParameter("job").trim();
		String place = request.getParameter("place").trim();
		String hostname = request.getParameter("host").trim();
		List<Job> jlist = JobDao.searchJob(job,place,hostname);
		String JobJsonString = null;
		JobJsonString = new Gson().toJson(jlist);
		System.out.println(JobJsonString);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(JobJsonString);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

}
