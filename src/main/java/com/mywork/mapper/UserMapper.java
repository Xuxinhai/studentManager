package com.mywork.mapper;

import com.mywork.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {

    //检查用户名密码
    @Select("select * from user where username=#{username} and password=#{password} and status = 1")
    User selUser(User user);

    //检查用户名是否重复
    @Select("select * from user where username=#{username} and status=1")
    User selByUsername(String username);

    //查询学生是否已经注册过
    @Select("select * from user where sno = #{sno} and status=1")
    User selBySno(String sno);


    //插入用户
    @Insert("insert into user values(default,#{username},#{password},#{age},#{sex},#{phone},null,0,#{sno},1)")
    int insUser(User user);

    //更新用户
    @Update("update user set sex=#{sex},age=#{age},phone=#{phone} where id=#{id}")
    int updateUser(User user);

    //通过id查用户
    @Select("select * from user where id = #{id} and status=1")
    User selUserById(int id);

    //修改密码
    @Update("update user set password=#{param1} where id=#{param2} and status=1")
    int updatePassword(String password,int id);
}
