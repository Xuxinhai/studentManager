package com.mywork.mapper;
import com.mywork.pojo.Class;

import com.mywork.pojo.Teacher;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ClassMapper {

    //查找所有的班级
    @Select("select distinct * from class where status = 1")
    List<Class> selAllClass();

    //查找所有的班级，包括专业和教师信息
    List<Class> selAllClassWithMajorAndTeacher();

    //插入一个班级
    @Insert("insert into class values(default,#{classno},#{majorid},#{teacherid},1)")
    int insClass(Class cla);

    //通过班级号查找班级
    @Select("select * from class where status=1 and classno=#{param1}")
    Class selClassByClassno(String classno);

    //id删除班级
    @Update("update class set status=0 where id=#{param1}")
    int delClassById(int id);

    //更新班级
    @Update("update class set teacherid=#{param2} where status=1 and id=#{param1}")
    int updClassByTeacherid(Integer id,Integer teacherid);
}
