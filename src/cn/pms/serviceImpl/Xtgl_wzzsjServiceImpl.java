package cn.pms.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.xitong.MaterialMapper;
import cn.pms.pojo.Material;
import cn.pms.pojo.Page;
import cn.pms.pojo.QueryVo;
import cn.pms.service.Xtgl_wzzsjService;


@Service
public class Xtgl_wzzsjServiceImpl implements Xtgl_wzzsjService{

	@Autowired 
	private MaterialMapper materialMapper;
	
	//查询物质分页对象
	public Page<Material> queryMaterialList(QueryVo vo) {
		Page<Material> materialPage = new Page<Material>();
		//判断当前页
		if (null != vo) {
			//每页显示条数
			materialPage.setSize(vo.getSize());
			//判断当前页
			if(null != vo.getPage()) {
				materialPage.setPage(vo.getPage());
				if(vo.getPage() == 0) {
					vo.setStartRow(0);
				}else {
					vo.setStartRow((vo.getPage() - 1)*vo.getSize());
				}
			}
			//设置总条数,结果集
			materialPage.setTotal(materialMapper.queryTotalRows(vo));
			materialPage.setRows(materialMapper.materialEnquiry(vo));
		}
		return materialPage;
	}
	
	//通过id查找物资
	public Material queryMaterialById(Integer id) {
		
		return materialMapper.queryMaterialById(id);
	}

	//更新物资
	public void updateMaterial(Material material) {
		materialMapper.updateMaterial(material);
	}

	//新增物资
	public void insertMaterial(Material material) {
		materialMapper.insertMaterial(material);
	}

	//删除物资
	public void deleteMaterial(Integer id) {
		materialMapper.deleteMaterial(id);
	}

	//批量删除
	public void delsMaterial(Integer[] ids) {
		for(int i = 0; i < ids.length; i++) {
			materialMapper.deleteMaterial(ids[i]);
		}
	}

	@Override
	public ArrayList<Material> queryAllMaterialList() {
		return materialMapper.queryAllMaterialList();
	}

}
