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

import smart.job.bean.Seeker;
import smart.job.dao.SeekerDao;

/**
 * Servlet implementation class ViewprofileServlet
 */
@WebServlet("/ViewprofileServlet")
public class ViewprofileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewprofileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sesid = request.getParameter("sesid").trim();
		if(sesid == null || "".equals(sesid)){
			sesid = "Guest";
		}
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
        System.out.println("hostname"+hostname);
		List<Seeker> list=SeekerDao.getSeekerById(sesid,hostname);  

        String SeekerJsonString = null;
        SeekerJsonString = new Gson().toJson(list);
        System.out.println(SeekerJsonString);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(SeekerJsonString);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
