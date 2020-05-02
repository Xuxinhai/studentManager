package com.mywork.mapper;

import com.mywork.pojo.Major;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface MajorMapper {

    //查找所有专业
    @Select("select distinct * from major where status = 1")
    List<Major> selAllMajor();

    //通过专业号查找专业
    @Select("select * from major where status=1 and majorno=#{param1}")
    Major selMajorByMajorno(String majorno);

    //插入专业信息
    @Insert("insert into major values(default,#{majorno},#{majorname},1)")
    int insMajor(Major major);

    //id删除专业
    @Update("update major set status=0 where id=#{param1}")
    int delMajorById(int id);
}


