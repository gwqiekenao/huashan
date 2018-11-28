package cn.pms.mapper.xitong;

import java.util.ArrayList;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.Fast;
import cn.pms.pojo.PageModel;

public interface FastMapper {
	//查询得到所有的快码表
	public List<Fast> selectAllFast();
	
	//模糊分页
	public int getCount(@Param("code")String code, @Param("codeName")String codeName,
			@Param("fastTypeName")String fastTypeName);
	//模糊查询
    public ArrayList<Fast> findFastForm(@Param("pageModel")PageModel pageModel, @Param("nowPage")int nowPage, 
    		@Param("code")String code, @Param("codeName")String codeName, @Param("fastTypeName")String fastTypeName);
    //根据Id来修改信息
	public Fast updateById(@Param("id")int id);
	//修改信息
	public void updatePro(Fast fast);
	//启动
	public void insertFast(Fast fast);

	public void deleteFast(@Param("id1")String[] id1);

	public void deleteFasts(@Param("id1")String[] id1);

	public void deleteFastss(String code);

	public ArrayList<Fast> finFastYZ(@Param("code")String code);

	public ArrayList<Fast> finFastCodeName(@Param("fastType")String fastType, @Param("code")String code);

	public ArrayList<Fast> finFastType(@Param("fastType")String fastType);

	public void deleteFastsss(@Param("code")String code);

	public ArrayList<Fast> findFast();

	public Fast selectFastByCode(String code);

	
}