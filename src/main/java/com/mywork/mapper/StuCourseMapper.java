package com.mywork.mapper;


import com.mywork.pojo.StuCourse;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface StuCourseMapper {

    //查询某学生所有课程信息
    List<StuCourse> selAllStuCourseByStudentid(@Param("id") int id, @Param("coursename") String coursename,
                                               @Param("teachername") String teachername, @Param("year") String year);

    //查询某学生所有成绩
    List<StuCourse> selAllStuScoreByStudentid(@Param("id") int id,
                                              @Param("coursename") String coursename,
                                              @Param("year") String year);

    //按条件分页查询所有学生的课程信息
    List<StuCourse> selAllStuCourse(@Param("studentno") String studentno,@Param("coursename") String coursename,
                                    @Param("grade") Integer grade,@Param("majorid") Integer majorid,@Param("year") Integer year);


    //插入学生课程信息
    @Insert("insert into stu_course values(default,#{studentid},#{courseid},null,null,null,#{year},1)")
    int insStuCourse(StuCourse stuCourse);

    //删除一条记录
    @Update("update stu_course set status=0 where id=#{param1}")
    int delStuCourse(int id);

    //按条件分页查询所有学生的成绩信息
    List<StuCourse> selAllScore(@Param("studentno") String studentno,
                                @Param("coursename") String coursename, @Param("year") Integer year);


    //插入学生成绩信息
    @Update("update stu_course set usualscore=#{usualscore},finalscore=#{finalscore}," +
            "totalscore=#{finalscore} where status=1 and id=#{id}")
    int insScore(StuCourse stuCours);


    //通过学生id、课程id、年级查询
    @Select("select * from stu_course where status=1 and studentid=#{param1} and courseid=#{param2} and year=#{param3}")
    StuCourse selStuCourseBySidAndCidAndYear(int studentid,int courseid,String year);


    //删除成绩
    @Update("update stu_course set usualscore=null,finalscore=null,totalscore=null where id=#{param1}")
    int delScore(int id);

}


