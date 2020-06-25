package smart.job.dao;

import java.sql.*;

public class Validate {
    public static boolean checkUser(String email,String pass,String hostname) 
    {  
        boolean st =false;
        try {
            Connection con = DBconnect.initializeDatabase(hostname); 
			 /* Class.forName("org.mariadb.jdbc.Driver");
			 * 
			 * Connection con =
			 * DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta"
			 * ,"2000186_upeta","Sreyo123");
			 * System.out.println("Connected database successfully...");
			 */          
            
            String superadmin = new String("admin@sreyo.com");
            String admin = new String("neenumanohar@gmail.com");
            if(email.equals(superadmin)) {
	            PreparedStatement ps = con.prepareStatement("select * from User where Email=? and Password=?");
	            ps.setString(1, email);
	            ps.setString(2, pass);
	            ResultSet rs =ps.executeQuery();
	            st = rs.next();
            }
            else if(email.equals(admin)) {
	            PreparedStatement ps = con.prepareStatement("select * from job_seeker where username=? and password=?");
	            ps.setString(1, email);
	            ps.setString(2, pass);
	            ResultSet rs =ps.executeQuery();System.out.println(ps);
	            st = rs.next();
            }else {
                PreparedStatement ps = con.prepareStatement("select * from job_seeker where username=? and password=?");
                ps.setString(1, email);
                ps.setString(2, pass);
                ResultSet rs =ps.executeQuery();
                st = rs.next();
            }
            con.close();  
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return st;                 
    }   
}
