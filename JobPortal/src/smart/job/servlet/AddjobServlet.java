package smart.job.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import smart.job.bean.Job;
import smart.job.dao.JobDao;

/**
 * Servlet implementation class AddjobServlet
 */
@WebServlet("/AddjobServlet")
public class AddjobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddjobServlet() {
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
        String jobtitle=request.getParameter("jobtitle");  
        String jobtype=request.getParameter("jobtype");  
        String jobstatus=request.getParameter("jobstatus");  
        String email=request.getParameter("email");  
        String phone =request.getParameter("phone");  
        String city=request.getParameter("city");
        String state=request.getParameter("state"); 
        String country=request.getParameter("country"); 
        String zip=request.getParameter("zip"); 
        String editor=request.getParameter("editor"); 
        String remote = request.getParameter("remote");
		
        
        Job j=new Job();  
        j.setjobtitle(jobtitle);
        j.setjobtype(jobtype);
        j.setjobstatus(jobstatus); 
        j.setremotejob(remote);
        j.setCreatedby(email);  
        j.setPhone(phone);
        j.setEmail(email);
        j.setCity(city);
        j.setState(state);
        j.setCountry(country);
        j.setZip(zip);
        j.setEditor(editor);
        

        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
        System.out.println("hostname"+hostname);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int status=JobDao.save(j,hostname);  
        if(status>0){  
	        RequestDispatcher rd=request.getRequestDispatcher("clientdashboard.jsp");  
	        rd.forward(request,response); 

        }else{  
            String val="You missed something!!!!!Enter all details";
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body onLoad=\"showResult();\">");
            out.println("<script>");
            out.println("function showResult(){");
            out.println("alert(\""+val+"\")");
            out.println("}");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");

            RequestDispatcher rd = request.getRequestDispatcher("postjobform.jsp");

            rd.include(request, response);
           // response.getWriter().write("Success");

        }  
          
	}

}
