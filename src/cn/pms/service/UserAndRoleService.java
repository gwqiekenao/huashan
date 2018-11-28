package cn.pms.service;

import java.util.ArrayList;


import cn.pms.pojo.Userandrole;

public interface UserAndRoleService {
	public ArrayList<Integer> findUserRole(int userId);

	public void insertUserAndRole(Userandrole userandrole);

	 
	public ArrayList<Userandrole> findAllURId(int userId);

 

	public void deleteUserAndRole(Userandrole userandrole);

	public void deleteCondition(Integer userId);

	 
}
