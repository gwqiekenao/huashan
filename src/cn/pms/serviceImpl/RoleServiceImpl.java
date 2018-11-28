package cn.pms.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.xitong.RoleMapper;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Role;
import cn.pms.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	RoleMapper roleMapper;

	@Override
	public int getCount(String roleName) throws Exception {
		 
		return roleMapper.getCount(roleName);
	}

	@Override
	public ArrayList<Role> findRoleForm(PageModel pageModel, int nowPage, String roleName) throws Exception {
		 
		return roleMapper.findRoleForm(pageModel,nowPage,roleName);
	}

	@Override
	public Role updateRoleById(int id) {
		 
		return roleMapper.updateRoleById(id);
	}

	@Override
	public void updateRole(Role role) {
		 roleMapper.updateRole(role);
	}

	@Override
	public void insertRole(Role role) throws Exception {
	 
		roleMapper.insertRole(role);
	}

	@Override
	public void deleteRole(String  id) throws Exception {
		 roleMapper.deleteRole(id);
		
	}

	@Override
	public void deleteRoles(String roleName) throws Exception {
	 
		roleMapper.deleteRoles(roleName);
	}

	@Override
	public ArrayList<Role> findAllByName() throws Exception {
		 
		return roleMapper.findAllByName();
		 
	}

	@Override
	public List<Role> findRoleAll() {
		// TODO Auto-generated method stub
		return roleMapper.findRoleAll();
	}

	@Override
	public Role selectRoleByRoleName(String roleName) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleByRoleName(roleName);
	}
}
