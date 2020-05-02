package com.mywork.service;

import com.mywork.mapper.StudentMapper;
import com.mywork.pojo.Student;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface StudentService {

    Student selStuById(int id);

    //检查学生是否存在
    boolean selStu(String sno);

    //通过学号获取学生信息
    Student selStuByStudentno(String sno);

    //通过学号获取学生信息，包括班级专业
    Student selStudentBySnoWithClass(String studentno);

    List<Student> selAllStu(String studentno,String studentname,Integer grade,Integer majorid,Integer classid);

    int insStu(Student student);

    int updateStu(Student student);

    int delStuById(int id);

}
