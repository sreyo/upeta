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

public class JobapplyDao {
	/*
	 * public static Connection getConnection(){ Connection con=null; try{
	 * Class.forName("org.mariadb.jdbc.Driver"); con=DriverManager.getConnection(
	 * "jdbc:mariadb://207.246.241.5:3306/2000186_upeta","2000186_upeta","Sreyo123")
	 * ; }catch(Exception e){System.out.println(e);} return con; }
	 * 
	 */
	public static List<Jobapply> getall(String hostname) {

		List<Jobapply> list = new ArrayList<Jobapply>();

		try {
			Connection con = DBconnect.initializeDatabase(hostname);

			/*
			 * Connection con=JobDao.getConnection();
			 */
			PreparedStatement ps = con.prepareStatement("SELECT * FROM job_apply j , job_seeker s where j.applicantid=s.applicantid");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Jobapply o = new Jobapply();
				Seeker s = new Seeker();
				o.setApplicantid(rs.getString(3));
				o.setJobcode(rs.getString(2));
				o.setResumename(rs.getString(4));
				o.setStatus(rs.getString(6));
				o.setAppliedon(rs.getDate(5));
				s.setFirstname(rs.getString(8));
				list.add(o);

			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/*
	 * public static List<Jobapply> getappliedjobbyuser(String hostname,String
	 * user){
	 * 
	 * List<Jobapply> list=new ArrayList<Jobapply>();
	 * 
	 * try{ Connection con = DBconnect.initializeDatabase(hostname);
	 * 
	 * 
	 * Connection con=JobDao.getConnection();
	 * 
	 * PreparedStatement ps=con.
	 * prepareStatement("SELECT * FROM job_apply j , job_seeker s where j.applicantid=s.applicantid and s.username=?"
	 * ); ps.setString(1,user); ResultSet rs=ps.executeQuery(); while(rs.next()){
	 * Jobapply o=new Jobapply(); Seeker s = new Seeker();
	 * o.setApplicantid(rs.getString(3)); o.setJobcode(rs.getString(2));
	 * o.setResumename(rs.getString(4)); o.setStatus(rs.getString(6));
	 * o.setAppliedon(rs.getDate(5)); s.setFirstname(rs.getString(8)); list.add(o);
	 * 
	 * } System.out.println(list); con.close(); }catch(Exception
	 * e){e.printStackTrace();}
	 * 
	 * return list; }
	 * 
	 */ 
	public static List getappliedjobbyuser(String hostname, String user) {
		String apid = null;
		List jlist = new ArrayList();

		try {
			Connection con = DBconnect.initializeDatabase(hostname);

			PreparedStatement pso = con.prepareStatement("SELECT applicantid FROM  job_seeker  where username=?");
			pso.setString(1, user);
			ResultSet rso = pso.executeQuery();
            while(rso.next()){  
            	Seeker n=new Seeker();  
             //   n.setId(rs.getInt(1));  
             n.setApplicantid(rso.getString(1)); 
             apid = n.getApplicantid();

			PreparedStatement ps = con.prepareStatement(
					"SELECT * FROM job_apply j , job_posting s where j.jobcode=s.jobcode and j.applicantid=?");
			ps.setString(1, apid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Jobapply o = new Jobapply();
				Job s = new Job();
				o.setApplicantid(rs.getString(3));
				o.setJobcode(rs.getString(2));
				o.setResumename(rs.getString(4));
				o.setStatus(rs.getString(6));
				o.setAppliedon(rs.getDate(5));
				s.setjobtitle(rs.getString("jobtitle"));
				o.setS(s);
				jlist.add(o);
				
			}}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jlist;
	}

	public static List<Jobapply> getnumofapp(String jobcode, String hostname) {
		List<Jobapply> list = new ArrayList<Jobapply>();
		try {
		Connection con = DBconnect.initializeDatabase(hostname);
        PreparedStatement ps=con.prepareStatement("SELECT count(*) FROM job_apply WHERE jobcode = ?");
		ps.setString(1, jobcode);
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            Jobapply o=new Jobapply();  
			o.setcount(rs.getInt(1));

            list.add(o);  

        }  
        con.close();  
    }catch(Exception e){e.printStackTrace();}  
      
    return list;  
	}
	


}
