package smart.job.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement; 
public class DbFile {


public static String fileupload(String namefile, String ext,String content,String username) throws SQLException, IOException {
Connection connection = null;
PreparedStatement statement = null;
FileInputStream imageInputStream = null;
try {
// retrieve connection 
connection = DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta","2000186_upeta","Sreyo123");
// get statement object 	                       

statement = connection.prepareStatement( "INSERT INTO `job_resume`( `filename`, `fileextn`,`filecontent`,`username`) values(?,?,?,?)");
			/*
			 * // create an input stream pointing to the image file to store
			 * imageInputStream = new FileInputStream(new File("d:\\download.png")); //
			 * inform the statement that first parameter in the query is of binary type
			 * statement.setBinaryStream(1, imageInputStream);
			 */// execute query
System.out.println("here"+statement);
statement.execute();
} catch (SQLException sqe) {
throw sqe;
} finally {
// close resources 
if (connection != null) {
connection.close();
}
if(imageInputStream!=null){
imageInputStream.close();
}
}
return "done";
}}