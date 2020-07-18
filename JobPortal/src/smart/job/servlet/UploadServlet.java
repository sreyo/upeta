package smart.job.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.oreilly.servlet.MultipartRequest;

import smart.job.bean.Resume;
import smart.job.bean.Seeker;
import smart.job.dao.ResumeDao;
import smart.job.dao.SeekerDao;  


/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		ServletOutputStream out = null;
		String[] formField = new String[14]; //declare with size
		String namefile = null;
		String ext = null;
        String content = null;
        File disk;
		int i = 1;
		FileItem item;
	    ServletContext context = request.getServletContext();
	    String appPath = context.getRealPath("");
	    String rpath = "WEB-INF\\resume";
		/*
		 * System.out.println(rpath);
		 */	    
	    String path = appPath + rpath;
		/*
		 * System.out.println(path);
		 */		try {
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			response.setContentType("text/html");
			while (iter.hasNext()) {
				item = (FileItem) iter.next();
				if (item.isFormField()) {// System.out.println("print"+item.getString());
					formField[i] = item.getString();
	                i++;
				} else {
				//	disk = new File("D:\\upload\\"+item.getName());
					disk = new File(path+"\\"+item.getName());
					System.out.println(disk);
					item.write(disk);
					namefile = item.getName();
				//    ext = FilenameUtils.getExtension("D:\\upload\\"+item.getName()); // returns "txt"
					ext = FilenameUtils.getExtension(path+"\\"+item.getName());
					System.out.println(ext);


			}
			}
			Resume r = new Resume();
			r.setFilename(namefile);
			r.setFileextn(ext);
			r.setUsername(formField[1]);
	        HttpSession session = request.getSession(true);
	        String hostname = (String) session.getAttribute("host");
  
			int attach = ResumeDao.save(r,hostname);

			if (attach > 0) {				
				//response.getWriter().write("success");
				request.getRequestDispatcher("/resumeupload.jsp").forward(request, response);

			} else {
				response.getWriter().write("failed");
			}
	
		// Rudimentary handling of any exceptions
		// TODO: Something useful if an error occurs
		} catch (FileUploadException fue) {
		fue.printStackTrace();
		} catch (IOException ioe) {
		ioe.printStackTrace();
		} catch (Exception e) {
		e.printStackTrace();
		}
		}	
	

}
