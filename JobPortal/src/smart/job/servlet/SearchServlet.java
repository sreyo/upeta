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

import smart.job.dao.JobDao;
import smart.job.dao.JobapplyDao;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
	//	String json = 		" {\"demo\":[[\"JOB1\",\"Software Engineer\",null,\"1\"],[\"JOB1\",\"\",null,\"1\"],[\"JOB1\",\"Software Engineer\",\"Individual\",\"1\"],[\"JOB-ID-5\",\"Software Engineer\",\"Individual\",\"1\"]]}";
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
	    List appliedList=JobDao.getAlljob(hostname); 
        SeekerJsonObject seekerJsonObject = new SeekerJsonObject();
        seekerJsonObject.setiTotalDisplayRecords(appliedList.size());
        seekerJsonObject.setiTotalRecords(appliedList.size());
        seekerJsonObject.setAaData(appliedList);
        System.out.println(seekerJsonObject);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json2 = gson.toJson(seekerJsonObject);  System.out.println("json"+json2.toString());          
        out.print(json2);

		//String json = JobDao.getAlljob(hostname);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
