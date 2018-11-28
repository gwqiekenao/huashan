package cn.pms.service;

import java.util.ArrayList;
 
import java.util.List;
 

import cn.pms.pojo.Fast;
import cn.pms.pojo.PageModel;

public interface FastService {
	//查询得到所有的快码表
	public List<Fast> selectAllFast();
	public int getCount(String code, String codeName, String fastTypeName) throws Exception;

	public ArrayList<Fast> findFastForm(PageModel pageModel, int nowPage, String code,
			String codeName, String fastTypeName) throws Exception;
	//获得修改的行ID
	public Fast updateById(int id)throws Exception;
	//修改页面
	public void updatePro(Fast fast)throws Exception;
	//增加
	public void insertFast(Fast fast)throws Exception;
	//启动
	public void deleteFast(String[] id1)throws Exception;
	//禁用
	public void deleteFasts(String[] id1)throws Exception;
	//批量禁用
	public void deleteFastss(String code)throws Exception;
	//查询是否重复
	public ArrayList<Fast> finFastYZ(String code)throws Exception;
	//查询信息
	public ArrayList<Fast> finFastCodeName(String fastType, String code)throws Exception;
	//查询信息fastType
	public ArrayList<Fast> finFastType(String fastType)throws Exception;
	//批量启动
	public void deleteFastsss(String code)throws Exception;
	//查询编码类型
	public ArrayList<Fast> findFast();
	//根据code查询
	public Fast selectFastByCode(String code);
 

}
