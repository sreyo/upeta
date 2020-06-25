package smart.job.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import smart.job.bean.Seeker;
import smart.job.dao.SeekerDao;

/**
 * Servlet implementation class SeekerServlet
 */
@WebServlet("/SeekerServlet")
@MultipartConfig()

public class SeekerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SeekerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		// String upload =request.getParameter("upload");
		// Part filePart = request.getPart("upload"); // Retrieves <input type="file"
		// name="file">
		/*
		 * String fileName =
		 * Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE
		 * fix. InputStream fileContent = filePart.getInputStream();
		 */

//System.out.println(filePart);
		String []formfield= new String[13];
		String name = "";
		if(ServletFileUpload.isMultipartContent(request)){
		try {
			String fieldName="";
			String fieldValue="";
			
			int i=1;
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			for (FileItem item : multiparts) {
				if (!item.isFormField()) {
				    name = new File(item.getName()).getName();
					System.out.println(name);
					item.write(new File("D:/upload" + File.separator + name));
				}
				else {
					fieldName = item.getFieldName();
	                fieldValue = item.getString();
	                formfield[i++]=fieldValue;

				}
			}
		} catch (Exception ex) {
			System.out.println("File Uploaded failed" + ex);

			
			  } }else{ System.out.println("File not found");
			 
			
			  }
		// request.getRequestDispatcher("/Result.jsp").forward(request, response);
		Seeker s = new Seeker();
		s.setFirstname(formfield[1]);
		s.setLastname(formfield[2]);
		s.setEmail(formfield[3]);
		s.setPhone(formfield[4]);
		s.setAddress(formfield[5]);
		s.setGender(formfield[6]);
		s.setDob(formfield[7]);
		s.setCity(formfield[8]);
		s.setState(formfield[9]);
		s.setCountry(formfield[10]);
		s.setZip(formfield[11]);
		s.setCreatedby(formfield[12]);
		s.setEmail(formfield[13]);
		//s.setUpload(name);
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
        System.out.println("hostname"+hostname);

		int status = SeekerDao.save(s,hostname);
		if (status > 0) {
			response.setContentType("text/html");
			response.getWriter().write("success");

		} else {
			response.getWriter().write("failed");

		}

	}

}
