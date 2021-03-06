package smart.job.servlet;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.Iterator;
import java.util.List;

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
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import smart.job.bean.Resume;
import smart.job.bean.Seeker;
import smart.job.dao.ResumeDao;
import smart.job.dao.SeekerDao;

/**
 * Servlet implementation class testServlet
 */
@WebServlet("/testServlet")
public class testServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testServlet() {
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
		// Commons file upload classes are specifically instantiated
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		ServletOutputStream out = null;
		String[] formField = new String[14]; //declare with size
		String namefile = null;
		String ext = null;
        String content = null;
        File disk;
		int i = 1;
		try {
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			response.setContentType("text/html");
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					formField[i] = item.getString();
	                i++;
				} else {
					disk = new File("D:\\upload\\"+item.getName());
					item.write(disk);
					namefile = item.getName();
				    ext = FilenameUtils.getExtension("D:\\upload\\"+item.getName()); // returns "txt"

			}
				content = FileUtils.readFileToString(new File("D:\\upload\\"+item.getName()), StandardCharsets.UTF_8);
			
	            System.out.println("ocntent"+content);

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
	        HttpSession session = request.getSession(true);
	        String hostname = (String) session.getAttribute("host");
	        System.out.println("hostname"+hostname);

			int status = SeekerDao.save(s,hostname);
			Resume r = new Resume();
			r.setFilename(namefile);
			r.setFileextn(ext);
			//r.setFilecontent(content);
			r.setUsername(formField[3]);
		//	int attach = ResumeDao.save(r);
            String username = formField[3];
			String fileup = DbFile.fileupload(namefile, ext, content, username);

			if (status > 0) {		        
				if(fileup=="done") {response.getWriter().write("success");
				request.getRequestDispatcher("/index.jsp").forward(request, response);

			} else {
				response.getWriter().write("failed upload");
			}}else {
				response.getWriter().write("failed");

			}
			}
		// Rudimentary handling of any exceptions
		// TODO: Something useful if an error occurs
		} catch (Exception e) {
		e.printStackTrace();
		}
		
	}
}

