package smart.job.dao;

import java.sql.*;

public class Validate {
    public static boolean checkUser(String email,String pass,String hostname) 
    {  
        boolean st =false;
        try {System.out.println("validate"+hostname);
            Connection con = DBconnect.initializeDatabase(hostname); 
            //select role
            PreparedStatement psrole = con.prepareStatement("select role from job_seeker where username=? and password=?");
            psrole.setString(1, email);
            psrole.setString(2, pass);
            ResultSet rsrole =psrole.executeQuery();
            while(rsrole.next()) {
            String role = rsrole.getString("role");System.out.println("role"+role);
            String superadmin = new String("admin@sreyo.com");
            String admin = new String("admin");
            if(role.equals(superadmin)) {
	            PreparedStatement ps = con.prepareStatement("select * from job_seeker where username=? and password=?");
	            ps.setString(1, email);
	            ps.setString(2, pass);
	            ResultSet rs =ps.executeQuery();
	            st = rs.next();
            }
            else if(role.equals(admin)) {
	            PreparedStatement ps = con.prepareStatement("select * from job_seeker where username=? and password=? ");
	            ps.setString(1, email);
	            ps.setString(2, pass);

	            ResultSet rs =ps.executeQuery();System.out.println("admin");
	            st = rs.next();
            }else {
                PreparedStatement ps = con.prepareStatement("select * from job_seeker where username=? and password=? ");
                ps.setString(1, email);
                ps.setString(2, pass);
                ResultSet rs =ps.executeQuery();
                st = rs.next();
            }}
            con.close();  
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return st;                 
    }   
}
