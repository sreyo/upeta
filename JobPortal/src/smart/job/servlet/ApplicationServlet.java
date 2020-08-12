package smart.job.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
		String[] formField = new String[10]; //declare with size
		String namefile = null;
		String ext = null;
        String content = null;
        File disk;
        final PrintWriter outp = response.getWriter();

		int i = 1;
		try {
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			response.setContentType("text/html");
		    ServletContext context = request.getServletContext();
		    String appPath = context.getRealPath("");
		    String rpath = "WEB-INF\\resume";
		    String path = appPath + rpath;
			/*
			 * System.out.println(path);
			 */

			while (iter.hasNext()) {
				 item = (FileItem) iter.next();
				if (item.isFormField()) {
					formField[i] = item.getString();	     
					System.out.println(i+"-"+formField[i]);	

	                i++;

				} else {
	    			System.out.println(formField[9]);
					File file;
/*					File disk = new File(path+"\\"+formField[12]+"\\"+item.getName());
*/	    			disk = new File(path+"\\"+formField[9]);
			        if (!disk.exists()) {
			            if (disk.mkdir()) {
			                System.out.println("Directory is created!");
			                file = new File(path+"\\"+formField[9]+"\\"+item.getName());
							item.write(file);
							namefile = item.getName();
							ext = FilenameUtils.getExtension(path+"\\"+formField[9]+"\\"+item.getName());

			                } 
			            } else {
						/*
						 * file = new File(path+"\\"+formField[9]+"\\"+item.getName());
						 * System.out.println(file+"else"); item.write(file);
						 */			            
			            namefile = item.getName();
				   // ext = FilenameUtils.getExtension("D:\\upload\\"+item.getName()); // returns "txt"
				   // InputStream inputStream = new FileInputStream(disk);
					ext = FilenameUtils.getExtension(path+"\\"+formField[9]+"\\"+item.getName());

					
					}
			        
			       }
			     }
			
			  //  String usrnm = formField[1];
    			Jobapply j = new Jobapply();
                j.setJobcode(formField[1]);
                j.setResumename(namefile);
                final HttpSession session = request.getSession(true);
                final String hostname = (String)session.getAttribute("host");
                final String usrnm = (String)session.getAttribute("name");
                final int attach = ResumeDao.jobapply(j, usrnm, hostname);
                if (attach > 0) {
                    response.setContentType("text/html");
                    response.getWriter().write("success");
                    final RequestDispatcher rd = request.getRequestDispatcher("Submanage.jsp");
                    rd.forward((ServletRequest)request, (ServletResponse)response);
                }
                else {
                    final String val = "Failed resume upload";
                    outp.println("<!DOCTYPE html>");
                    outp.println("<html>");
                    outp.println("<head>");
                    outp.println("<title>Apply Job</title>");
                    outp.println("</head>");
                    outp.println("<body onLoad=\"showResult();\">");
                    outp.println("<script>");
                    outp.println("function showResult(){");
                    outp.println("alert(\"" + val + "\")");
                    outp.println("}");
                    outp.println("</script>");
                    outp.println("</body>");
                    outp.println("</html>");
                    request.getRequestDispatcher("/clientdashboard.jsp").include((ServletRequest)request, (ServletResponse)response);


                }
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
