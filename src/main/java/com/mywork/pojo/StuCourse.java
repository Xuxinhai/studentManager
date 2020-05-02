package com.mywork.pojo;

public class StuCourse {
    private Integer id;
    private Integer studentid;
    private Integer courseid;
    private Double usualscore;
    private Double finalscore;
    private Double totalscore;
    private String year;

    private Course course;
    private Student student;

    @Override
    public String toString() {
        return "StuCourse{" +
                "id=" + id +
                ", studentid=" + studentid +
                ", courseid=" + courseid +
                ", usualscore=" + usualscore +
                ", finalscore=" + finalscore +
                ", totalscore=" + totalscore +
                ", year='" + year + '\'' +

                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getStudentid() {
        return studentid;
    }

    public void setStudentid(Integer studentid) {
        this.studentid = studentid;
    }

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public Double getUsualscore() {
        return usualscore;
    }

    public void setUsualscore(Double usualscore) {
        this.usualscore = usualscore;
    }

    public Double getFinalscore() {
        return finalscore;
    }

    public void setFinalscore(Double finalscore) {
        this.finalscore = finalscore;
    }

    public Double getTotalscore() {
        return totalscore;
    }

    public void setTotalscore(Double totalscore) {
        this.totalscore = totalscore;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
