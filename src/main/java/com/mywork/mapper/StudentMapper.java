package com.mywork.mapper;

import com.mywork.pojo.Student;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface StudentMapper {

    //通过id获取学生信息
    @Select("select * from student where id = #{param1} and status=1")
    Student selStuById(int id);

    //通过学号获取学生信息
    @Select("select * from student where studentno = #{param1} and status=1")
    Student selStuBySno(String sno);

    //通过学号获取学生信息包括班级信息
    Student selStudentBySnoWithClass(String studnetno);

    //查询所有的学生信息（学生列表）
    List<Student> selAllStu(@Param("studentno") String studentno,
                            @Param("studentname") String studentname,
                            @Param("grade") Integer grade,
                            @Param("majorid") Integer majorid,
                            @Param("classid") Integer classid);

    //插入学生
    @Insert("insert into student values(default,#{studentno},#{studentname}," +
            "#{grade},#{classid},#{phone},#{age},#{sex},1)")
    int insStu(Student student);

    //更新学生信息
    @Update("update student set age=#{age},phone=#{phone},grade=#{grade}" +
            ",classid=#{classid},sex=#{sex} where id=#{id} and status=1")
    int updateStu(Student stu);

    //删除学生
    @Update("update student set status=0 where id = #{id}")
    int delStuById(int id);

}
