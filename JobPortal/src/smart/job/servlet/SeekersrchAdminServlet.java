package smart.job.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import smart.job.bean.Resume;
import smart.job.bean.Seeker;
import smart.job.dao.ResumeDao;
import smart.job.dao.SeekerDao;

/**
 * Servlet implementation class SeekersrchAdminServlet
 */
@WebServlet("/SeekersrchAdminServlet")
public class SeekersrchAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeekersrchAdminServlet() {
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
        System.out.println("hostname"+hostname);


	    List seekerList=SeekerDao.getAll(hostname);  

	//    List<Seeker> seekerList = new ArrayList<Seeker>();
	        SeekerJsonObject seekerJsonObject = new SeekerJsonObject();
	        seekerJsonObject.setiTotalDisplayRecords(seekerList.size());
	        seekerJsonObject.setiTotalRecords(seekerList.size());
	        seekerJsonObject.setAaData(seekerList);
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
