package com.mywork.pojo;

public class Class {
    private Integer id;
    private String classno;
    private Integer majorid;
    private Integer teacherid;

    private Major major;
    private Teacher teacher;

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", classno='" + classno + '\'' +
                ", majorid=" + majorid +
                ", teacherid=" + teacherid +
                ", major=" + major +
                '}';
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassno() {
        return classno;
    }

    public void setClassno(String classno) {
        this.classno = classno;
    }

    public Integer getMajorid() {
        return majorid;
    }

    public void setMajorid(Integer majorid) {
        this.majorid = majorid;
    }

    public Integer getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }
}
