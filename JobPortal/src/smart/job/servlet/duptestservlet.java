package smart.job.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
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

import smart.job.bean.Resume;
import smart.job.bean.Seeker;
import smart.job.dao.ResumeDao;
import smart.job.dao.SeekerDao;

/**
 * Servlet implementation class duptestservlet
 */
@WebServlet("/duptestservlet")
public class duptestservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public duptestservlet() {
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
		doGet(request, response);
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		ServletOutputStream out = null;
		String[] formField = new String[14]; //declare with size
		String namefile = null;
		String ext = null;

		int i = 1;
		try {
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			response.setContentType("text/html");
		    ServletContext context = request.getServletContext();
		    String appPath = context.getRealPath("");
		    String rpath = "WEB-INF\\resume";
		    		//+ "";
			/*
			 * System.out.println(rpath);
			 */	    
		    String path = appPath + rpath;
			/*
			 * System.out.println(path);
			 */
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					formField[i] = item.getString();
	                i++;
	    			System.out.println(formField[i]);

				} else {
					/*
					 * File disk = new File("D:\\upload\\"+item.getName());
					 */	
					File disk = new File(path+"\\"+item.getName());

					item.write(disk);
					namefile = item.getName();
				   // ext = FilenameUtils.getExtension("D:\\upload\\"+item.getName()); // returns "txt"
				   // InputStream inputStream = new FileInputStream(disk);
					ext = FilenameUtils.getExtension(path+"\\"+item.getName());

					System.out.println(ext);	
					}
			}
			Seeker s = new Seeker();
			s.setFirstname(formField[1]);
			s.setLastname(formField[2]);
			s.setEmail(formField[3]);
			s.setPhone(formField[4]);
			s.setDob(formField[5]);
			s.setGender(formField[6]);
			s.setAddress(formField[7]);
			s.setCity(formField[8]);
			s.setState(formField[9]);
			s.setZip(formField[10]);
			s.setCountry(formField[11]);
			s.setCreatedby(formField[3]);
			s.setEmail(formField[3]);
            final String host = formField[12];
            final PrintWriter outp = response.getWriter();
            int status = SeekerDao.save(s,host);
			Resume r = new Resume();
			r.setFilename(namefile);
			r.setFileextn(ext);
			r.setUsername(formField[3]);
			int attach = ResumeDao.save(r,host);
            
			if (status > 0) {			
				if(attach>0) {
					
                    final String val = "Registered !!!!!Please Login";
                    outp.println("<!DOCTYPE html>");
                    outp.println("<html>");
                    outp.println("<head>");
                    outp.println("<title>Registration Servlet</title>");
                    outp.println("</head>");
                    outp.println("<body onLoad=\"showResult();\">");
                    outp.println("<script>");
                    outp.println("function showResult(){");
                    outp.println("alert(\"" + val + "\")");
                    outp.println("}");
                    outp.println("</script>");
                    outp.println("</body>");
                    outp.println("</html>");
                    request.getRequestDispatcher("/index.jsp").include((ServletRequest)request, (ServletResponse)response);

                }else {
                    final String val = "Failed upload";
                    outp.println("<!DOCTYPE html>");
                    outp.println("<html>");
                    outp.println("<head>");
                    outp.println("<title>Registration Servlet</title>");
                    outp.println("</head>");
                    outp.println("<body onLoad=\"showResult();\">");
                    outp.println("<script>");
                    outp.println("function showResult(){");
                    outp.println("alert(\"" + val + "\")");
                    outp.println("}");
                    outp.println("</script>");
                    outp.println("</body>");
                    outp.println("</html>");
                    request.getRequestDispatcher("/index.jsp").include((ServletRequest)request, (ServletResponse)response);


			}}else {
				 final String val = "Something went wrong";
                 outp.println("<!DOCTYPE html>");
                 outp.println("<html>");
                 outp.println("<head>");
                 outp.println("<title>Registration Servlet</title>");
                 outp.println("</head>");
                 outp.println("<body onLoad=\"showResult();\">");
                 outp.println("<script>");
                 outp.println("function showResult(){");
                 outp.println("alert(\"" + val + "\")");
                 outp.println("}");
                 outp.println("</script>");
                 outp.println("</body>");
                 outp.println("</html>");
                 request.getRequestDispatcher("/index.jsp").include((ServletRequest)request, (ServletResponse)response);

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
