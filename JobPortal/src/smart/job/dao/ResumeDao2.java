package smart.job.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import smart.job.bean.Jobapply;
import smart.job.bean.Resume;
import smart.job.bean.Seeker;

public class ResumeDao2 {
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("org.mariadb.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta","2000186_upeta","Sreyo123");
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  

    public static int save(Resume r,String hostname){  
	    int status=0;  
	    try{  
	       // Connection con=ResumeDao.getConnection(); 
            Connection con = DBconnect.initializeDatabase(hostname); 

	        PreparedStatement ps=con.prepareStatement(  
	                     "INSERT INTO `job_resume`(  `filename`, `fileextn`,`username`) VALUES (?,?,?)");  
			//ps.setString(1,r.getApplicantid());  
	        ps.setString(1,r.getFilename());  
	        ps.setString(2,r.getFileextn());
	    //    ps.setBlob(4,r.getFilecontent());
	        ps.setString(3,r.getUsername());  
	        System.out.println(ps);
	        status=ps.executeUpdate(); 
	        con.close();  
	    }catch(Exception ex){ex.printStackTrace();}  
	      
	    return status;  

    }
	public static List<Resume> getResumelist(String id,String hostname) {
		Resume m=new Resume();  
        List<Resume> list=new ArrayList<Resume>();  
        try{  
          //  Connection con=ResumeDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT id,filename FROM job_resume WHERE username=?");  
            ps.setString(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Resume n=new Resume();  
                n.setId(rs.getInt(1));  
                n.setFilename(rs.getString(2));  
                list.add(n);  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
    }
	public static int jobapply(Jobapply j, String usrnm,String hostname) {
	    int status=0; 
	    try{  
	    //    Connection con=ResumeDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT applicantid FROM job_seeker WHERE username=?");  
            ps.setString(1,usrnm);  
            ResultSet rs=ps.executeQuery(); System.out.println(ps);
            String applicantid = null ;
            while(rs.next()){  
                applicantid = rs.getString(1);  
            }
	        PreparedStatement ins=con.prepareStatement(  
	                     "INSERT INTO `job_apply`(`jobcode`, `applicantid`,`resumename`,`status`) VALUES (?,?,?,?)");  
	        ins.setString(1,j.getJobcode());  
			ins.setString(2,applicantid);  
			ins.setString(3,j.getResumename());
			ins.setString(4,"Applied");  
	        System.out.println(ins);
	        status=ins.executeUpdate(); 
	        con.close();  
	    }catch(Exception ex){ex.printStackTrace();}  
	      
	    return status;  
	}

    


}
