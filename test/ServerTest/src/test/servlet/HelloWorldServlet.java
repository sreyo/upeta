package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
/*import javax.servlet.annotation.WebServlet;
*/import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloWorldServlet
 */
/*
 * @WebServlet("/HelloWorldServlet")
 */public class HelloWorldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloWorldServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String color= request.getParameter("color");    
	    PrintWriter out = response.getWriter();
	    out.println (
	      "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN \n" +
	          "http://www.w3.org/TR/html4/loose.dtd\">\n" +
	      "<html> \n" +
	        "<head> \n" +
	          "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\"> \n" +
	          "<title> My first jsp  </title> \n" +
	        "</head> \n" +
	        "<body> \n" +
	          "<font size=\"12px\" color=\"" + color + "\"> \n" +
	            "Hello World  \n" +
	          "</font> \n" +
	        "</body> \n" +
	      "</html>" 
	    );  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
