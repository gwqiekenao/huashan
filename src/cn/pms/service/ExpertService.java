package cn.pms.service;

import java.util.ArrayList;

import cn.pms.pojo.Expert;
import cn.pms.pojo.PageModel;

public interface ExpertService {
	public int getCount(String expertCode,String name);
	   
	public ArrayList<Expert> findExpert(PageModel pageModel, String expertCode,String name);
}
