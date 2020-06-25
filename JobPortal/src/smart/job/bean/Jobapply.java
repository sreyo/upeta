package smart.job.bean;

import java.sql.Blob;
import java.util.Date;

public class Jobapply {
	private String applicantid,resumename,status,jobcode;
	private int id;
	private Date appliedon;
	Job s = new Job();
	private int count;
	
	public Job getS() {
		return s;
	}
	public void setS(Job s) {
		this.s = s;
	}
	public int getId() {  
	    return id;  
	}  
	public void setId(int id) {  
	    this.id = id;  
	}  

	public String getApplicantid() {  
	    return applicantid;  
	}  
	public void setApplicantid(String applicantid) {  
	    this.applicantid = applicantid;  
	}  

	public String getResumename() {  
	    return resumename;  
	}  
	public void setResumename(String resumename) {  
	    this.resumename = resumename;  
	}  
	public String status() {  
	    return status;  
	}  
	public void setStatus(String status) {  
	    this.status = status;  
	}  
	public String getJobcode() {  
	    return jobcode;  
	}  
	public void setJobcode(String jobcode) {  
	    this.jobcode = jobcode;  
	}
	public Date getAppliedon() {  
		return appliedon;  
	}  

	public void setAppliedon(Date appliedon) {
	    this.appliedon = appliedon;  
		
	}
	public void setcount(int count) {
	    this.count = count;  
		
	}

}
