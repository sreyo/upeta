package smart.job.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import smart.job.bean.Resume;
import smart.job.bean.Seeker;
import smart.job.dao.SeekerDao;
import smart.job.dao.JavaMail;

public class SeekerDao {
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("org.mariadb.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta","2000186_upeta","Sreyo123");
            System.out.println("connected");
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
    public static int save(Seeker s,String hostname){  
    int status=0;  
    try{  
       // Connection con=SeekerDao.getConnection();  
        Connection con = DBconnect.initializeDatabase(hostname); 

        PreparedStatement ps=con.prepareStatement(  
                     "INSERT INTO `job_seeker`( `firstname`, `lastname`, `email`,`phone`,`address`,`dob`,`applicantid`,`gender`,createdby,city,state,country,zip,filename,username) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);  
		ps.setString(1,s.getFirstname());  
        ps.setString(2,s.getLastname());  
        ps.setString(3,s.getEmail());  
        ps.setString(4,s.getPhone());  
        ps.setString(5,s.getAddress()); 
        ps.setString(6,s.getDob());
        ps.setString(7,s.getApplicantid());
        ps.setString(8,s.getGender());  
        ps.setString(9,s.getCreatedby());
        ps.setString(10,s.getCity());
        ps.setString(11,s.getState());
        ps.setString(12,s.getCountry());
        ps.setString(13,s.getZip());
        ps.setString(14,"NULL");
        ps.setString(15,s.getEmail());

        System.out.println(ps);
        status=ps.executeUpdate(); 
		ResultSet rs = ps.getGeneratedKeys();
		int generatedKey = 0;
		if (rs.next()) {
		generatedKey = rs.getInt(1);
		}

		String appid   ="APP-ID-"+generatedKey;
		PreparedStatement up=con.prepareStatement(
		"UPDATE job_seeker SET applicantid=? WHERE id=?");
	    up.setString(1,appid);
		up.setInt(2,generatedKey); 
		status=up.executeUpdate();
			/*
			 * JavaMail jm = new JavaMail(); //Instance of elf class String to =
			 * s.getEmail(); String upass = "smartjob123";
			 * 
			 * int emailstatus =JavaMail.email(to, upass);
			 * System.out.println("emailstatus"+emailstatus);
			 */      
		con.close();  
    }catch(Exception ex){ex.printStackTrace();}  
      
    return status;  

    }
    
    public static int update(Seeker m,String appid,String hostname){  
    int status=0;  
    try{        
        Connection con = DBconnect.initializeDatabase(hostname); 
        PreparedStatement ps=con.prepareStatement(  
                "UPDATE job_seeker SET firstname=?,lastname=?,email=?,gender=?,city=?,state=?,country=?,zip=?,address=? WHERE applicantid=? ");  
        ps.setString(1,m.getFirstname());  
        ps.setString(2,m.getLastname());  
        ps.setString(3,m.getEmail());  
        ps.setString(4,m.getGender()); 
        ps.setString(5,m.getCity());  
        ps.setString(6,m.getState());  
        ps.setString(7,m.getCountry());  
        ps.setString(8,m.getZip());  
        ps.setString(9,m.getAddress()); 

        ps.setString(10,appid);  
        status=ps.executeUpdate();  
        con.close();  
    }catch(Exception ex){ex.printStackTrace();}  
      
    return status;  
 }  

	public static List<Seeker> getSeekerById(String id,String hostname) {
    	Seeker m=new Seeker();  
        List<Seeker> list=new ArrayList<Seeker>();  
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_seeker WHERE username=?");  
            ps.setString(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Seeker n=new Seeker();  
                n.setId(rs.getInt(1));  
                n.setFirstname(rs.getString(2));  
                n.setLastname(rs.getString(3)); 
                n.setEmail(rs.getString(4)); 
                n.setPhone(rs.getString(7));  
                n.setAddress(rs.getString(8));
                n.setGender(rs.getString(9)); 
                n.setDob(rs.getString(10)); 
                n.setApplicantid(rs.getString(11)); 
                n.setCity(rs.getString(18)); 
                n.setState(rs.getString(19)); 
                n.setCountry(rs.getString(21)); 
                n.setZip(rs.getString(20)); 

                list.add(n);  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
    }
    
	public static List<Seeker> getResumelist(String id,String hostname) {
    	Seeker m=new Seeker();  
        List<Seeker> list=new ArrayList<Seeker>();  
        try{  
          //  Connection con=SeekerDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT id,filename FROM job_seeker WHERE username=?");  
            ps.setString(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Seeker n=new Seeker();  
                n.setId(rs.getInt(1));  
            //    n.setFilename(rs.getString(2));  
                list.add(n);  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
    }
    
	public static int resetpswd(String username, String hostname,String pswd) {
    int status=0;  
    try{  
        Connection con = DBconnect.initializeDatabase(hostname); 
        PreparedStatement ps=con.prepareStatement( "UPDATE job_seeker SET password=? WHERE username=?"); 
        ps.setString(1,pswd);  
        ps.setString(2,username);  

        System.out.println(ps);
        status=ps.executeUpdate();  
        con.close();  
    }catch(Exception ex){ex.printStackTrace();}  
      
    return status;  
    }  

	public static List<Seeker> getSeekerByUser(String id,String hostname) {

    {
    	Seeker m=new Seeker();  
        List<Seeker> list=new ArrayList<Seeker>();  
        try{  
           // Connection con=SeekerDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_seeker WHERE email=?");  
            ps.setString(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
            	Seeker n=new Seeker();  
                n.setFirstname(rs.getString(2));  
                n.setLastname(rs.getString(3)); 
                n.setEmail(rs.getString(4)); 
                n.setPhone(rs.getString(7));  
                n.setAddress(rs.getString(8));
                n.setGender(rs.getString(9)); 
                n.setDob(rs.getString(10)); 
                n.setApplicantid(rs.getString(11)); 
                n.setUsername(rs.getString(5)); 
                n.setCity(rs.getString(15)); 
                n.setState(rs.getString(16)); 
                n.setCountry(rs.getString(18)); 
                n.setZip(rs.getString(17)); 

                list.add(n);  
            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    

    }
	
}
	public static List<Seeker> getAll(String hostname) {
		// TODO Auto-generated method stub
    	Seeker m=new Seeker();  
        List<Seeker> list=new ArrayList<Seeker>();  
        try{  
           // Connection con=SeekerDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_seeker where role =? ");  
            ps.setString(1,"user");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
            	Seeker n=new Seeker();  
             //   n.setId(rs.getInt(1));  
                n.setFirstname(rs.getString(2));  
                n.setLastname(rs.getString(3)); 
                n.setEmail(rs.getString(4)); 
                n.setPhone(rs.getString(7));  
           //     n.setAddress(rs.getString(8));
            //    n.setGender(rs.getString(9)); 
            //    n.setDob(rs.getString(10)); 
                n.setApplicantid(rs.getString(11)); 
                n.setUsername(rs.getString(5)); 
                 n.setCity(rs.getString(15)); 
            //    n.setState(rs.getString(19)); 
            //    n.setCountry(rs.getString(21)); 
            //    n.setZip(rs.getString(20)); 


                String username = n.getUsername();
                PreparedStatement ups=con.prepareStatement("SELECT filename FROM job_resume WHERE username=?");  
                ups.setString(1,username);  
                ResultSet urs=ups.executeQuery(); System.out.println(ups);
               // System.out.println(urs.getInt(1));
                String[] resume = new String[10];
                int i=0;
                while(urs.next()){  //System.out.println("insidewhile"+urs.getString(1));
                	resume[i] = urs.getString(1)  ; 
                	//System.out.println(i+"outside"+urs.getString(1));
                	i = i+1;  
                }  
                String[] nofresume = new String[i];
                if(i!=0) {
                 for(int cnt = 0;cnt<i;cnt++) {
                	nofresume[cnt]=resume[cnt];
                }}
                n.setFilename(nofresume);                           

                list.add(n);  



            }  
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return list;    
	}}
