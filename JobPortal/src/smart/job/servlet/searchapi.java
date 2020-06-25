package smart.job.servlet;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.simple.JSONObject;

import smart.job.dao.JobDao;
public class searchapi {
   public static void main(String args[]) {
		  List<Object> list=new ArrayList<Object>();
	        JSONArray ja = new JSONArray();
	        JSONObject obj = new JSONObject();


	        try{  
	            Connection con=JobDao.getConnection();  
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
	            	
	            	
	            }  System.out.println(ja.toString());
	            obj.put("demo",ja);System.out.println(obj.toString());
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
   }
}
