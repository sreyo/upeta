package smart.job.dao;

import java.awt.HeadlessException;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMail {

	/*
	 * public static void main(String args[String to,String userpassword]) { new
	 * JavaMail().email(to, userpassword); }
	 */
    public static int email(String to,String userpassword) {
        String from = "dharmasenaofficial@gmail.com";
        String password = "Standwithdharma2020";
        String subject = "Job Portal Registration Complete";
        String msg = "Your username" +to+ "and password "+userpassword;
        Properties properties = System.getProperties();
        properties = setProp(from, to);
        Session session = Session.getDefaultInstance(properties);

        try {
            Address address = new InternetAddress(to, "noreply@UPETA");
            MimeMessage message = new MimeMessage(session);
            message.setFrom(address);
            message.addRecipient(Message.RecipientType.TO, address);
            message.setSubject(subject);
            message.setText(msg);
            message.saveChanges();
            Transport transport = session.getTransport();
            System.out.println("connecting...");
            transport.connect(from, password);
            System.out.println("connected!");
            System.out.println("sending...");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            System.out.println("Sent message successfully....");
            return 1;

        } catch (Exception mex) {
            mex.printStackTrace();
        }
		return 0;
    }

    private static Properties setProp(String email, String targetEmail) {
        Properties props = null;
        try {
            props = System.getProperties();
            if (email.contains(",") || targetEmail.contains(",")) {
                System.out.println("Please send one email to one person at a time...");
            } else if (email.contains("@yahoo.com")) {
                props.put("mail.smtp.host", "smtp.mail.yahoo.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.host", "smtp.mail.yahoo.com");
                props.put("mail.smtp.auth", true);
            } else if (email.contains("@gmail.com")) {
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
            } else {
                System.out.println("Your Email Address is invalid\n or host not supported!");
            }

        } catch (HeadlessException exp) {
            System.out.println(exp);
        }           

        return props;
    }

}
