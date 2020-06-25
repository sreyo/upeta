package smart.job.bean;

public class Job {
	private String jobcode,jobtitle	,jobtype,jobdesc,createdby,state,city,zip,country,remotejob,phone,email	;
	private int id;
	String jobstatus,editor;
	private int count;

	
	public int getId() {  
	    return id;  
	}  
	public void setId(int id) {  
	    this.id = id;  
	}  

	public String getjobcode() {  
	    return jobcode;  
	}  
	public void setjobcode(String jobcode) {  
	    this.jobcode = jobcode;  
	}  

	public String getjobtitle() {  
	    return jobtitle;  
	}  
	public void setjobtitle(String jobtitle) {  
	    this.jobtitle = jobtitle;  
	}  
	public String getjobstatus() {  
	    return jobstatus;  
	}  
	public void setjobstatus(String jobstatus) {  
	    this.jobstatus = jobstatus;  
	}  

	public String getremotejob() {  
	    return remotejob;  
	}  
	public void setremotejob(String remotejob) {  
	    this.remotejob = remotejob;  
	}  

	public String getjobtype() {  
	    return jobtype;  
	}  
	public void setjobtype(String jobtype) {  
	    this.jobtype = jobtype;  
	}  
	public String getjobdesc() {  
		return jobdesc;  
	}  
	public void setjobdesc(String jobdesc) {  
	    this.jobdesc = jobdesc;  
	}  
	public String getCreatedby() {  
		return createdby;  
	}  
	public void setCreatedby(String createdby) {
	    this.createdby = createdby;  
		
	}  
	public String getCity() {  
		return city;  
	}  
	public void setCity(String city) {
	    this.city = city;  
	}
	public String getState() {  
		return state;  
	}  
	public void setState(String state) {
	    this.state = state;  
	}	
	public String getCountry() {  
		return country;  
	}  
	public void setCountry(String country) {
	    this.country = country;  
	}	
	public String getZip() {  
		return zip;  
	}  
	public void setZip(String zip) {
	    this.zip = zip;  
	}	

	public String getPhone() {  
		return phone;  
	}  
	public void setPhone(String phone) {
	    this.phone = phone;  
	}	

	public String getEditor() {  
		return editor;  
	}  
	public void setEditor(String editor) {
	    this.editor = editor;  
	}
	public String getEmail() {
		return email;  
	}	
	public void setEmail(String email) {
	    this.email = email;  
	}
	public void setcount(int count) {
	    this.count = count;  

	}

}
