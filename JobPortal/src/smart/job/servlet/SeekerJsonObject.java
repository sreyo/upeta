package smart.job.servlet;

import java.util.List;

import smart.job.bean.Seeker;

public class SeekerJsonObject {
    int iTotalRecords;

    int iTotalDisplayRecords;

    String sEcho;

    String sColumns;

    List<Seeker> aaData;

    public int getiTotalRecords() {
    return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
    this.iTotalRecords = iTotalRecords;
    }

    public int getiTotalDisplayRecords() {
    return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
    this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public String getsEcho() {
    return sEcho;
    }

    public void setsEcho(String sEcho) {
    this.sEcho = sEcho;
    }

    public String getsColumns() {
    return sColumns;
    }

    public void setsColumns(String sColumns) {
    this.sColumns = sColumns;
    }

    public List<Seeker> getAaData() {
        return aaData;
    }

    public void setAaData(List<Seeker> aaData) {
        this.aaData = aaData;
    }


}
