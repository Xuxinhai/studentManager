package com.mywork.mapper;

import com.mywork.pojo.Teacher;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface TeacherMapper {

    //按条件获取所有的教师信息
    List<Teacher> selAllTea(@Param("teacherno") String teacherno,
                            @Param("teachername") String teachername);

    //通过教工号获取教师信息

    @Select("select * from teacher where id=#{param1} and status=1")
    Teacher selTeaById(int id);

    //更新教师信息
    @Update("update teacher set age=#{age},phone=#{phone},sex=#{sex} where status=1")
    int updateTea(Teacher teacher);

    //通过教工号删除教师
    @Update("update teacher set status=0 where id = #{param1}")
    int delTeaById(int id);

    //插入教师
    @Insert("insert into teacher values(default,#{teacherno},#{teachername},#{sex},#{age},#{phone},1)")
    int insTea(Teacher teacher);

}
