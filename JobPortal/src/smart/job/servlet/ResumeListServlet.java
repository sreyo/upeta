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

import smart.job.bean.Resume;
import smart.job.bean.Seeker;
import smart.job.dao.ResumeDao;
import smart.job.dao.SeekerDao;

/**
 * Servlet implementation class ResumeListServlet
 */
@WebServlet("/ResumeListServlet")
public class ResumeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeListServlet() {
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
		String sesid = request.getParameter("sesid").trim();
		try {
	        HttpSession session = request.getSession(true);
	        String hostname = (String) session.getAttribute("host");

	    List<Resume> list=ResumeDao.getResumelist(sesid,hostname);        
        String orgjson = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(orgjson);
        } catch(Exception e){e.printStackTrace();}
	}

}
