package cn.pms.mapper.xitong;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.pms.pojo.Material;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.QueryVo;

@Repository
public interface MaterialMapper {

	//查询物质总条数
	public Integer queryTotalRows(QueryVo vo);
//
//	//查询物质分页结果集
	public List<Material> materialEnquiry(QueryVo vo);
//
//	//通过id查找物资
	public Material queryMaterialById(Integer id);
//
//	//更新物资
	public void updateMaterial(Material material);
	
	//新增物资
	public void insertMaterial(Material material);
	
	public ArrayList<Material> findMaterial(@Param("pageModel")PageModel pageModel,
			@Param("materialCode")String materialCode,@Param("materialName")String materialName,
			@Param("materialType")String materialType);
	
	public int getCount(@Param("materialCode")String materialCode,@Param("materialName")String materialName,
			@Param("materialType")String materialType);
	
	//删除物资
	public void deleteMaterial(Integer id);
	
	public ArrayList<Material> queryAllMaterialList();

}
