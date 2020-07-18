package smart.job.dao;

import smart.job.bean.Jobapply;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import smart.job.bean.Resume;
import java.sql.DriverManager;
import java.sql.Connection;

public class ResumeDao
{
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mariadb://207.246.241.5:3306/2000186_upeta", "2000186_upeta", "Sreyo123");
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
    
    public static int save(final Resume r, final String hostname) {
        int status = 0;
        try {
            final Connection con = DBconnect.initializeDatabase(hostname);
            final PreparedStatement ps = con.prepareStatement("INSERT INTO `job_resume`(  `filename`, `fileextn`,`username`) VALUES (?,?,?)");
            ps.setString(1, r.getFilename());
            ps.setString(2, r.getFileextn());
            ps.setString(3, r.getUsername());
            System.out.println("test"+ps);
            status = ps.executeUpdate();
            con.close();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    public static List<Resume> getResumelist(final String id, final String hostname) {
        final Resume m = new Resume();
        final List<Resume> list = new ArrayList<Resume>();
        try {
            final Connection con = DBconnect.initializeDatabase(hostname);
            final PreparedStatement ps = con.prepareStatement("SELECT id,filename FROM job_resume WHERE username=?");
            ps.setString(1, id);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                final Resume n = new Resume();
                n.setId(rs.getInt(1));
                n.setFilename(rs.getString(2));
                list.add(n);
            }
            con.close();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    public static int jobapply(final Jobapply j, final String usrnm, final String hostname) {
        int status = 0;
        try {
            final Connection con = DBconnect.initializeDatabase(hostname);
            final PreparedStatement ps = con.prepareStatement("SELECT applicantid FROM job_seeker WHERE username=?");
            ps.setString(1, usrnm);
            final ResultSet rs = ps.executeQuery();
            System.out.println(ps);
            String applicantid = null;
            while (rs.next()) {
                applicantid = rs.getString(1);
            }
            final PreparedStatement ins = con.prepareStatement("INSERT INTO `job_apply`(`jobcode`, `applicantid`,`resumename`,`status`) VALUES (?,?,?,?)");
            ins.setString(1, j.getJobcode());
            ins.setString(2, applicantid);
            ins.setString(3, j.getResumename());
            ins.setString(4, "Applied");
            System.out.println(ins);
            status = ins.executeUpdate();
            con.close();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    public static int delete(final String hostname, final String id) {
        int status = 0;
        try {
            final Connection con = DBconnect.initializeDatabase(hostname);
            final PreparedStatement ps = con.prepareStatement("DELETE FROM job_resume WHERE id=?");
            ps.setString(1, id);
            System.out.println(ps);
            status = ps.executeUpdate();
            System.out.println(status);
            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}


