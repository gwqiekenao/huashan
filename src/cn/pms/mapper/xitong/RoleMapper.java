package cn.pms.mapper.xitong;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.Role;

public interface RoleMapper {
	
	
	public int getCount(@Param("roleName")String roleName);
	
	public ArrayList<Role> findRoleForm(@Param("pageModel")PageModel pageModel, @Param("nowPage")int nowPage, 
			@Param("roleName")String roleName);

	public Role updateRoleById(@Param("id")int id);

	public void updateRole(Role role);

	public void insertRole(Role role);

	public void deleteRole(String id);

	 

	public void deleteRoles(String roleName);

	public ArrayList<Role> findAllByName();

	public Role selectRoleByRoleName(@Param("roleName")String roleName);

	public List<Role> findRoleAll();
   
}