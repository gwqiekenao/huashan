package cn.pms.service;

import java.util.ArrayList;
import java.util.List;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.User;

public interface UserService {

	public User findUserLogin(User user);
	
	public int getCount(String userCode, String userName, String userTel)  throws Exception;

	public ArrayList<User> findUserForm(PageModel pageModel, int nowPage, String userCode, String userName,
			String userTel)  throws Exception;
	//根据Id修改
	 
	public void insertUser(User user) throws Exception;

	public User updateUserById(int id);

	public void updateUser(User user);

	
	 

	public void deleteUser(String[] id1)throws Exception;

	 
	public void deleteUsers(String userCode);

	public User updateUserByIdss(String id);


	public List<User> findUserAll();

 

	public User selectUserByUserCode(String userCode);

	 

	 

}
