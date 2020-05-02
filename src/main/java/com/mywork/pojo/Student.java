package com.mywork.pojo;

public class Student {
    private Integer id;
    private String studentno;
    private String studentname;
    private Integer grade;
    private Integer classid;
    private Integer age;
    private String phone;
    private Integer sex;

    private Class stuclass;

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", studentno='" + studentno + '\'' +
                ", studentname='" + studentname + '\'' +
                ", grade=" + grade +
                ", classid=" + classid +
                ", stuclass=" + stuclass +
                '}';
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentno() {
        return studentno;
    }

    public void setStudentno(String studentno) {
        this.studentno = studentno;
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Class getStuclass() {
        return stuclass;
    }

    public void setStuclass(Class stuclass) {
        this.stuclass = stuclass;
    }
}
