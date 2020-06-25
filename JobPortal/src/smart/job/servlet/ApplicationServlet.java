package smart.job.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import smart.job.bean.Jobapply;
import smart.job.bean.Resume;
import smart.job.bean.Seeker;
import smart.job.dao.ResumeDao;
import smart.job.dao.SeekerDao;

/**
 * Servlet implementation class ApplicationServlet
 */
@WebServlet("/ApplicationServlet")
public class ApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplicationServlet() {
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
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		ServletOutputStream out = null;
		FileItem item;
		String[] formField = new String[14]; //declare with size
		String namefile = null;
		String ext = null;
        String content = null;
        File disk;
		int i = 1;
		try {
			List items = upload.parseRequest(request);System.out.println("inside"+request.toString());
			Iterator iter = items.iterator();
			response.setContentType("text/html");
			while (iter.hasNext()) {
				item = (FileItem) iter.next();
				if (item.isFormField()) { 
					formField[i] = item.getString();
	                i++;
				} else {
					disk = new File("D:\\upload\\"+item.getName());
					item.write(disk);
					namefile = item.getName();
				    ext = FilenameUtils.getExtension("D:\\upload\\"+item.getName()); // returns "txt"

				}System.out.println("formfield"+formField[i]);
				}
			  //  String usrnm = formField[1];
    			Jobapply j = new Jobapply();
			    j.setJobcode(formField[2]);
				j.setResumename(namefile);
		        HttpSession session = request.getSession(true);
		        String hostname = (String) session.getAttribute("host");
		        String usrnm = (String) session.getAttribute("name");

				int attach = ResumeDao.jobapply(j,usrnm,hostname);
				if (attach > 0) {
					response.setContentType("text/html");
					response.getWriter().write("success");
			        RequestDispatcher rd=request.getRequestDispatcher("jobapplied.jsp");  
			        rd.forward(request,response); 
				} else {
					response.getWriter().write("failed");

				}

		} catch (Exception e) {
		e.printStackTrace();
		}
	}	
	
}