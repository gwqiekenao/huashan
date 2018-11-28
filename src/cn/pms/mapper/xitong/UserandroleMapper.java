package cn.pms.mapper.xitong;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.Userandrole;

public interface UserandroleMapper {
	public ArrayList<Integer> findUserRole(@Param("userId")int userId);
	//增加权限
	public void insertUserAndRole(Userandrole userandrole);
	//删除权限
	 
	//查询权限
	public ArrayList<Userandrole> findAllURId(int userId);
	
	public void deleteUserAndRole(Userandrole userandrole);
	//当增加的是超级用户权限时,删除其他权限
	public void deleteCondition(Integer userId);
 
}