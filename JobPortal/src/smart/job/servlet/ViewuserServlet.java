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
 * Servlet implementation class ViewuserServlet
 */
@WebServlet("/ViewuserServlet")
public class ViewuserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewuserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("userid");        
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
		List<Seeker> list=SeekerDao.getSeekerByUser(id,hostname);  

        String MemberJsonString = null;
        MemberJsonString = new Gson().toJson(list);
        System.out.println(MemberJsonString);
        response.setContentType("application/json"); 
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(MemberJsonString);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
