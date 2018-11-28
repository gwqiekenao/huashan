 package cn.pms.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.xitong.UserandroleMapper;

import cn.pms.pojo.Userandrole;
import cn.pms.service.UserAndRoleService;

@Service
public class UserAndRoleServiceImpl implements UserAndRoleService {
	
	@Autowired
	UserandroleMapper userandroleMapper;
	@Override
	public ArrayList<Integer> findUserRole(int userId) {
		return userandroleMapper.findUserRole(userId);
	}
	@Override
	public void insertUserAndRole(Userandrole userandrole) {
		userandroleMapper.insertUserAndRole(userandrole);
		}
	 
	@Override
	public void deleteUserAndRole(Userandrole userandrole) {
		 
		userandroleMapper.deleteUserAndRole(userandrole);
	}
	@Override
	public ArrayList<Userandrole> findAllURId(int userId) {
	 
		return userandroleMapper.findAllURId(userId);
	}
	@Override
	public void deleteCondition(Integer userId) {
		 
		userandroleMapper.deleteCondition(userId);
	}
	 
	
}
