package smart.job.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import smart.job.dao.DBconnect;
import smart.job.dao.Validate;

//import upeta.admin.dao.Validate;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String hostname;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		  String u = request.getParameter("usr");  
	      String p = request.getParameter("pasw"); 
	      String h = request.getParameter("host");System.out.println("get"+h);
  		  HttpSession session=request.getSession();  
          
		    response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
        try { 
        		session.setAttribute("host",h);  
                 hostname = (String) session.getAttribute("host");

        		System.out.println(hostname);
				DBconnect.initializeDatabase(hostname);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 

		  if(Validate.checkUser(u,p,hostname)){ 
			  // reuse existing 
			  session.setAttribute("name",u); 

			  String admin = new  String("neenumanohar@gmail.com"); 
			  String superadmin = new String("admin@sreyo.com");
			  if(u.contentEquals(superadmin))
			  {      
	                 response.getWriter().write("superadmin");
              }
			  else if(u.equals(admin))        		
			  {      				
	                 response.getWriter().write("admin");

              }else { 
	                 response.getWriter().write("user");
				  //getServletContext().getRequestDispatcher("/userdashboard.jsp").include(request, response);
} 
		  } else{ 
              response.getWriter().write("home");
			   }
		 // out.close();  

	}

}
