package cn.pms.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.xitong.MaterialMapper;
import cn.pms.pojo.Material;
import cn.pms.pojo.PageModel;
import cn.pms.service.MaterialService;

@Service
public class MaterialServiceImpl implements MaterialService{

	@Autowired
	MaterialMapper materialMapper;
	
	@Override
	public ArrayList<Material> findMaterial(PageModel pageModel, String mCode, String mName, String mType) {
		return materialMapper.findMaterial(pageModel, mCode, mName, mType);
	}

	@Override
	public int getCount(String mCode, String mName, String mType) {
		return materialMapper.getCount(mCode, mName, mType);
	}

}
