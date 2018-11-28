package cn.pms.service;

import java.util.ArrayList;

import cn.pms.pojo.Material;
import cn.pms.pojo.Page;
import cn.pms.pojo.QueryVo;

public interface Xtgl_wzzsjService {

	//查询物质分页对象
	public Page<Material> queryMaterialList(QueryVo vo);
	
	public ArrayList<Material> queryAllMaterialList();

//	//通过id查找物资
	public Material queryMaterialById(Integer id);
//
//	//更新物资
	public void updateMaterial(Material material);
	
	//新增物资
	public void insertMaterial(Material material);
	
	//删除物资
	public void deleteMaterial(Integer id);
	
	//批量删除
	public void delsMaterial(Integer[] ids);

}
