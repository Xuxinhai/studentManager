package com.mywork.service.impl;

import com.mywork.mapper.StudentMapper;
import com.mywork.pojo.Student;
import com.mywork.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public Student selStuById(int id) {
        return studentMapper.selStuById(id);
    }

    @Override
    public boolean selStu(String sno) {
        Student stu = studentMapper.selStuBySno(sno);
        if(stu != null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Student selStuByStudentno(String sno) {
        return studentMapper.selStuBySno(sno);
    }

    @Override
    public Student selStudentBySnoWithClass(String studentno) {
        return studentMapper.selStudentBySnoWithClass(studentno);
    }

    @Override
    public List<Student> selAllStu(String studentno, String studentname, Integer grade, Integer majorid, Integer classid) {
        return studentMapper.selAllStu(studentno,studentname,grade,majorid,classid);
    }

    @Override
    public int insStu(Student student) {
        return studentMapper.insStu(student);
    }

    @Override
    public int updateStu(Student student) {
        return studentMapper.updateStu(student);
    }

    @Override
    public int delStuById(int id) {
        return studentMapper.delStuById(id);
    }


}
