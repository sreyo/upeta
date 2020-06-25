package smart.job.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import smart.job.bean.Job;
import smart.job.bean.Resume;
import smart.job.dao.JobDao;
import smart.job.dao.ResumeDao;

/**
 * Servlet implementation class JobDetailServlet
 */
@WebServlet("/JobDetailServlet")
public class JobDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("jobcode").trim();
		String sid = request.getParameter("sesid").trim();
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");

	    List<Resume> slist=ResumeDao.getResumelist(sid,hostname);  
	    
       // String orgjson = new Gson().toJson(slist);

		List<Job> list=JobDao.getjobDescrp(code,hostname);  
        
        String JobJsonString = null;
        List merged = new ArrayList(slist);
        merged.addAll(list);
        JobJsonString = new Gson().toJson(merged);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(JobJsonString);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
