package cn.pms.service;

import java.util.ArrayList;
import java.util.List;

import cn.pms.pojo.Fast;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Role;

public interface RoleService {

	public int getCount(String roleName) throws Exception;

	public ArrayList<Role> findRoleForm(PageModel pageModel, int nowPage, String roleName)
			throws Exception;

	 
	//获取修改id的信息
	public Role updateRoleById(int id)throws Exception;
	//修改
	public void updateRole(Role role)throws Exception;
	
	//增加
	public void insertRole(Role role)throws Exception;

	public void deleteRole(String id)throws Exception;

	public void deleteRoles(String roleName)throws Exception;

	public ArrayList<Role>findAllByName()throws Exception;

	public List<Role> findRoleAll();

	public Role selectRoleByRoleName(String roleName);

	 
 
}
