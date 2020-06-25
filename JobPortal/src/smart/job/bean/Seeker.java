package smart.job.bean;
import java.sql.Blob;
import java.sql.Time;
import java.util.Date;

public class Seeker 
{
	private int id;
	private String firstname,lastname,email,createdby,phone, address, gender,username,password,state,city,zip,country;
	Blob upload;
	private String applicantid;
	String[] filename;

	private String dob;

	public int getId() {  
	    return id;  
	}  
	public void setId(int id) {  
	    this.id = id;  
	}  
	public String getFirstname() {  
	    return firstname;  
	}  
	public void setFirstname(String firstname) {  
	    this.firstname = firstname;  
	}  
	public String getLastname() {  
	    return lastname;  
	}  
	public void setLastname(String lastname) {  
	    this.lastname = lastname;  
	}  

	public String getEmail() {  
	    return email;  
	}  
	public void setEmail(String email) {  
	    this.email = email;  
	}  
	public String getPhone() {  
	    return phone;  
	}  
	public void setPhone(String phone) {  
	    this.phone = phone;  
	}  
	public String getDob() {  
		return dob;  
	}  
	public void setDob(String dob) {  
	    this.dob = dob;  
	}  
	public String getAddress() {  
		return address;  
	}  
	public void setAddress(String address) {  
	    this.address = address;  
	}  
	public void setApplicantid(String applicantid) {
	    this.applicantid = applicantid;  
	}  
	public String getApplicantid() {  
		return applicantid;  
	}  
	public String getGender() {  
		return gender;  
	}  
	public void setGender(String gender) {
	    this.gender = gender;  
	}  
	public String getUsername() {  
		return username;  
	}  
	public void setUsername(String username) {
	    this.username = username;  
	}  
	public String getPassword() {  
		return password;  
	}  
	public void setPassword(String password) {
	    this.password = password;  
		
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
	public String[] getFilename() {  
		return filename;  
	}  
	public void setFilename(String[] filename) {
	    this.filename = filename;  
	}	

	public Blob getUpload() {  
		return upload;  
	}  
	public void setUpload(Blob upload) {
	    this.upload = upload;  
	}	


}  
	

	




