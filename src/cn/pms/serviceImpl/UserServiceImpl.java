package cn.pms.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.pms.mapper.xitong.UserMapper;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.User;
import cn.pms.service.UserService;
@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userMapper;

	@Override
	public User findUserLogin(User user) {
		
		return userMapper.findUserLogin(user);
	}
	
	@Override
	public int getCount(String userCode, String userName, String userTel) throws Exception {
	 
		return userMapper.getCount(userCode,userName,userTel);
	}

	@Override
	public ArrayList<User> findUserForm(PageModel pageModel, int nowPage, String userCode, String userName,
			String userTel) throws Exception {
		
		return userMapper.findUserForm(pageModel,nowPage,userCode,userName,userTel);
	}

	@Override
	public void insertUser(User user) throws Exception {
		userMapper.insertUser(user);
		
	}
	
	@Override
	public User updateUserById(int id) {
	
		return userMapper.updateUserById(id);
	}

	@Override
	public void updateUser(User user) {
	 
		userMapper.updateUser(user);
	}

	public void deleteUser(String[] id1) throws Exception {
		
		userMapper.deleteUser(id1);
	}

	@Override
	public void deleteUsers(String userCode) {
		 
		userMapper.deleteUsers(userCode);
	}

	@Override
	public User updateUserByIdss(String id) {
		// TODO Auto-generated method stub
		return userMapper.updateUserByIdss(id);
	}

	@Override
	public List<User> findUserAll() {
		// TODO Auto-generated method stub
		return userMapper.findUserAll();
	}

	@Override
	public User selectUserByUserCode(String userCode) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByUserCode(userCode);
	}

}
