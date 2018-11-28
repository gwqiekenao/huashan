package cn.pms.mapper.xitong;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.User;

public interface UserMapper {

	//通过User.userCode User.userPwd(用户编号，和密码)查找用户
	public User findUserLogin(User user);
	//模糊查询
	public  int getCount(@Param("userCode")String userCode, @Param("userName")String userName, 
			@Param("userTel")String userTel);
	//分页
	public  ArrayList<User> findUserForm(@Param("pageModel")PageModel pageModel, @Param("nowPage")int nowPage, 
			@Param("userCode")String userCode,
			@Param("userName")String userName, @Param("userTel")String userTel);

	 
	//单个删除
	public void deleteUser(@Param("id1")String[] id1);
	//修改
	public void insertUser(User user);
	
    //根据id查询
	public User updateUserById(@Param("id")int id);

	 

	public void updateUser(User user);

	 

	public void deleteUsers(String userCode);
	
	public User updateUserByIdss(String id);
	
	public List<User> findUserAll();
	
	 
	public User selectUserByUserCode(String userCode);

}