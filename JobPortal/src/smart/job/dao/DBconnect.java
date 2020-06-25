package smart.job.dao;
import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import smart.job.bean.Job;
import smart.job.servlet.LoginServlet; 
  

public interface DBconnect {

	public static String[] dbDetails(String hostname ) {
		//final String hname = LoginServlet.hostname;

        String dbDriver = "org.mariadb.jdbc.Driver"; 
        String dbURL = "jdbc:mariadb://207.246.241.5:3306/"; 
        // Database name to access 
        String dbName = "2000186_upeta"; 
        String dbUsername = "2000186_upeta"; 
        String dbPassword = "Sreyo123"; 
        String dbdetails[] =new String[5];
        int i=0;
        try {
			Class.forName(dbDriver);
	        try {
				Connection con = DriverManager.getConnection(dbURL+dbName, dbUsername, dbPassword);
	            PreparedStatement ps=con.prepareStatement("SELECT * FROM db_alloc where hostname =?");  
	            ps.setString(1,hostname);  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	            dbdetails[0] = rs.getString(2);
	            dbdetails[1] = rs.getString(7);
	            dbdetails[2] = rs.getString(3);
	            dbdetails[3] = rs.getString(4);
	            dbdetails[4] = rs.getString(5);

              }  
	            con.close();  

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		
		
		
		return dbdetails;
		
	}
	
    public static Connection initializeDatabase(String hostname) throws SQLException, ClassNotFoundException 
	    { 
	        // Initialize all the information regarding 
	        // Database Connection 
          String connDetails[] = dbDetails(hostname);
		  String dbDriver = connDetails[0]; 
		  String dbURL = connDetails[1]; //  "jdbc:mariadb://207.246.241.5:3306/"; // Database name to access String
		  String dbName = connDetails[2];
		  String dbUsername = connDetails[3];
		  String dbPassword = connDetails[4];
		 	  
	        //Class.forName("dbDriver"); 
          Class.forName("org.mariadb.jdbc.Driver");  

	        Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword); 
		/*
		 * System.out.println("Connected database successfully separate...");
		 */
	        return con; 
	    } 
	} 

