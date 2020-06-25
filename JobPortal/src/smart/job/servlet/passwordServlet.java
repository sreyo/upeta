package smart.job.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import smart.job.dao.SeekerDao;

/**
 * Servlet implementation class passwordServlet
 */
@WebServlet("/passwordServlet")
public class passwordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public passwordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
        String username = (String) session.getAttribute("name");
        String pswd = request.getParameter("password");

		int status=SeekerDao.resetpswd(username,hostname,pswd);  
        if(status>0){  
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("success");

        }else{  
            response.getWriter().write("Sorry! unable to save record");
           // response.getWriter().write("Success");

        }  
	}

}
