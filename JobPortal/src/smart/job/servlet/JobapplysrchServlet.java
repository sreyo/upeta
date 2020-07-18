package smart.job.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import smart.job.dao.JobapplyDao;

/**
 * Servlet implementation class JobapplysrchServlet
 */
@WebServlet("/JobapplysrchServlet")
public class JobapplysrchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobapplysrchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    response.setContentType("application/json");
	    PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
        String user = (String) session.getAttribute("name");

	    List appliedList=JobapplyDao.getappliedjobbyuser(hostname,user); 
	    

	//    List<Seeker> seekerList = new ArrayList<Seeker>();
	        SeekerJsonObject seekerJsonObject = new SeekerJsonObject();
	        seekerJsonObject.setiTotalDisplayRecords(appliedList.size());
	        seekerJsonObject.setiTotalRecords(appliedList.size());
	        seekerJsonObject.setAaData(appliedList);
            System.out.println(seekerJsonObject);

	        Gson gson = new GsonBuilder().setPrettyPrinting().create();
	        String json2 = gson.toJson(seekerJsonObject);            
	        out.print(json2);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
