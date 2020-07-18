package smart.job.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import smart.job.bean.Job;
import smart.job.bean.Jobapply;
import smart.job.bean.Seeker;

public class JobDao implements DBconnect {
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("org.mariadb.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta","2000186_upeta","Sreyo123");
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  

    public static int save(Job j,String hostname){  
	    int status=0;  
	    try{  
	       // Connection con=ResumeDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 
	        PreparedStatement ps=con.prepareStatement(  
	                     "INSERT INTO `job_posting`(`jobtitle`,`jobtype`,`jobstatus`,`remotejob`,`email`,`phone`,`city`,`state`,`country`,`zip`,`editor`) VALUES (?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);  
			//ps.setString(1,r.getApplicantid());  
	        ps.setString(1,j.getjobtitle());  
	        ps.setString(2,j.getjobtype());
	        ps.setString(3,j.getjobstatus());
	        ps.setString(4,j.getremotejob());  
	        ps.setString(5,j.getEmail());  
	        ps.setString(6,j.getPhone());  
	        ps.setString(7,j.getCity());  
	        ps.setString(8,j.getState());  
	        ps.setString(9,j.getCountry());  
	        ps.setString(10,j.getZip());  
	        ps.setString(11,j.getEditor());  

	        status=ps.executeUpdate(); System.out.println("job"+ps);
    		ResultSet rs = ps.getGeneratedKeys();
    		int generatedKey = 0;
    		if (rs.next()) {
    		generatedKey = rs.getInt(1);
    		}
    		String jobcode ="JOB-ID-"+generatedKey ;
			
			PreparedStatement up=con.prepareStatement( "UPDATE job_posting SET jobcode=? WHERE id=?");
	        up.setString(1,jobcode);  
	        up.setInt(2,generatedKey);  
	        status=up.executeUpdate();  

	        con.close();  
	    }catch(Exception ex){ex.printStackTrace();}  
	      
	    return status;  

    }
    public static List<Job> getAddjob( String hostname){  
    	
        List<Job> list=new ArrayList<Job>();  
          
        try{  
            //Connection con=JobDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_posting order by id desc");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Job o=new Job();  

				o.setjobcode(rs.getString(2));
				o.setjobtitle(rs.getString(3));  
                o.setremotejob(rs.getString(4));
				o.setCountry(rs.getString(5));  
				o.setState(rs.getString(6));  
				o.setCity(rs.getString(7));  
				o.setZip(rs.getString(8));  
				o.setPhone(rs.getString(9));  
                o.setjobstatus(rs.getString(10));  
                o.setjobtype(rs.getString(11));  
                o.setjobdesc(rs.getString(12));
                o.setEmail(rs.getString(15));
                o.setEditor(rs.getString(16));
                PreparedStatement pso=con.prepareStatement("SELECT count(*) FROM job_apply WHERE jobcode = ?");
        		pso.setString(1, rs.getString(2));
                ResultSet rso=pso.executeQuery();  
                while(rso.next()){  
					  o.setcount(rso.getInt(1));
                }                
                list.add(o);
                System.out.println("list"+o.getjobcode());
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
    
    
    
    
	public static List getAlljob(String hostname) {
		String apid = null;
		List jlist = new ArrayList();

		try {
			Connection con = DBconnect.initializeDatabase(hostname);

            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_posting");  
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Job s = new Job();
				s.setjobcode(rs.getString(2));
				s.setjobtitle(rs.getString(3));
				s.setjobtype(rs.getString(11));
				s.setremotejob(rs.getString(4));
				s.setjobstatus(rs.getString(10));

				jlist.add(s);
				
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jlist;
	}

    
    public static String getAlljob1( String hostname){  
    	
        List<Job> list=new ArrayList<Job>();  
          
        JSONArray ja = new JSONArray();
        JSONObject obj = new JSONObject();


        try{  
          //  Connection con=JobDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_posting");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
				/*
				 * Job o=new Job(); o.setjobcode(rs.getString(2));
				 * o.setjobtitle(rs.getString(3)); o.setjobtype(rs.getString(10));
				 * o.setremotejob(rs.getInt(4));
				 */              
            	JSONArray mainObj = new JSONArray();
                mainObj.put(rs.getString(2));
                mainObj.put(rs.getString(3));
                mainObj.put(rs.getString(10));
                mainObj.put(rs.getString(4));
            	ja.put(mainObj);
            	
            }  //System.out.println(ja.toString());
            obj.put("demo",ja);
            con.close();  
        }catch(Exception e){e.printStackTrace();}  

          
        return obj.toString();  
    }  
    


    public static List<Object> getAlljobobj( String hostname){  
    	
		/*
		 * List<Job> list=new ArrayList<Job>();
		 */          
		  List<Object> list=new ArrayList<Object>();

        try{  
         //   Connection con=JobDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_posting");  
            ResultSet rs=ps.executeQuery();
            JSONObject obj = new JSONObject();

            while(rs.next()){  

                obj.put("jobcode", rs.getString(2));
                obj.put("jobtitle",rs.getString(3));  
                obj.put("jobtype",rs.getString(10));  
                obj.put("remotejob",rs.getInt(4));

                list.add(obj);
				/*
				 * obj.put("num", new Integer(100)); obj.put("balance", new Double(1000.21));
				 * obj.put("is_vip", new Boolean(true));
				 */
            	
				/*
				 * Job o=new Job(); o.setjobcode(rs.getString(2));
				 * o.setjobtitle(rs.getString(3)); o.setjobtype(rs.getString(10));
				 * o.setremotejob(rs.getInt(4)); list.add(o);
				 */            }                  

            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  

    }
 public static List<Job> getjobDescrp(String code, String hostname){  
    	
        List<Job> list=new ArrayList<Job>();  
          
        try{  
           // Connection con=JobDao.getConnection();  
            Connection con = DBconnect.initializeDatabase(hostname); 

            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_posting where jobcode =?");  
            ps.setString(1,code);  

            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Job o=new Job();  
				o.setjobcode(rs.getString(2));
				o.setjobtitle(rs.getString(3)); 
                o.setremotejob(rs.getString(4));
                o.setCountry(rs.getString(5));
                o.setState(rs.getString(6));
                o.setCity(rs.getString(7));
                o.setZip(rs.getString(8));
                o.setPhone(rs.getString(9));
                o.setjobstatus(rs.getString(10));
                o.setjobtype(rs.getString(11)); 
                o.setEmail(rs.getString(15));
                o.setEditor(rs.getString(16));
                list.add(o);  

            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }  
    
	public static int delete(String hostname,String jobcode){  
	    int status=0;  
	    try{  
	        Connection con = DBconnect.initializeDatabase(hostname); 
	        PreparedStatement ps=con.prepareStatement("DELETE FROM job_posting WHERE jobcode=?");  
	        ps.setString(1,jobcode);  
	        status=ps.executeUpdate();  
	        con.close();  
	    }catch(Exception e){e.printStackTrace();}  
	      
	    return status;  
	}

	public static List getall(String hostname) {
		List<Job> list = new ArrayList<Job>();

		try {
			Connection con = DBconnect.initializeDatabase(hostname);

			/*
			 * Connection con=JobDao.getConnection();
			 */
            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_posting order by id desc");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Job o=new Job();  
				Seeker s = new Seeker();

				o.setjobcode(rs.getString(2));
				o.setjobtitle(rs.getString(3));  
                o.setremotejob(rs.getString(4));
				o.setCountry(rs.getString(5));  
				o.setState(rs.getString(6));  
				o.setCity(rs.getString(7));  
				o.setZip(rs.getString(8));  
				o.setPhone(rs.getString(9));  
                o.setjobstatus(rs.getString(10));  
                o.setjobtype(rs.getString(11));  
                o.setjobdesc(rs.getString(12));
				s.setFirstname(rs.getString(8));
				list.add(o);

			}
			System.out.println(list);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static List<Job> searchJob(String job, String place, String hostname) {
		// TODO Auto-generated method stub
        List<Job> list=new ArrayList<Job>();  
        
        try{  
            Connection con = DBconnect.initializeDatabase(hostname); 
            PreparedStatement ps=con.prepareStatement("SELECT * FROM job_posting jp WHERE jp.jobtitle like ? AND jp.city like ?");  
            ps.setString(1, "%" + job + "%");  
            ps.setString(2, "%" + place + "%");
            //System.out.println("dao sql"+ps);
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Job o=new Job();  
				o.setjobcode(rs.getString(2));
				o.setjobtitle(rs.getString(3)); 
                o.setremotejob(rs.getString(4));
                o.setCountry(rs.getString(5));
                o.setState(rs.getString(6));
                o.setCity(rs.getString(7));
                o.setZip(rs.getString(8));
                o.setPhone(rs.getString(9));
                o.setjobstatus(rs.getString(10));
                o.setjobtype(rs.getString(11)); 
                o.setEmail(rs.getString(15));
                o.setEditor(rs.getString(16));
                list.add(o);  

            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
	}


    
}
