package cn.pms.service;

import java.util.ArrayList;

import cn.pms.pojo.Material;
import cn.pms.pojo.PageModel;

public interface MaterialService {
	public ArrayList<Material> findMaterial(PageModel pageModel,String mCode,String mName,String mType);
	public int getCount(String mCode,String mName,String mType);
}
