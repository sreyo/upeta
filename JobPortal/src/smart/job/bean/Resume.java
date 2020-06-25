package smart.job.bean;

import java.sql.Blob;

public class Resume {
	Blob filecontent;
	private String applicantid,filename,fileextn,username;
	private int id;
	
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

	public String getFilename() {  
	    return filename;  
	}  
	public void setFilename(String filename) {  
	    this.filename = filename;  
	}  
	public String getFileextn() {  
	    return fileextn;  
	}  
	public void setFileextn(String fileextn) {  
	    this.fileextn = fileextn;  
	}  
	public Blob getFilecontent() {  
	    return filecontent;  
	}  
	public void setFilecontent(Blob filecontent) {  
	    this.filecontent = filecontent;  
	}
	public String getUsername() {  
	    return username;  
	}  
	public void setUsername(String username) {  
	    this.username = username;  
	}  



}
