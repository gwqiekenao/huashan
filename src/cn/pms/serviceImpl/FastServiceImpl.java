package cn.pms.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.xitong.FastMapper;
import cn.pms.pojo.Fast;
import cn.pms.pojo.PageModel;
import cn.pms.service.FastService;

@Service
public class FastServiceImpl implements FastService {

	@Autowired
	FastMapper fastMapper;
	
	@Override
	public List<Fast> selectAllFast() {
		return fastMapper.selectAllFast();
	}	
	@Override//分页
	public int getCount(String code, String codeName, String fastTypeName) throws Exception {
		 
		return fastMapper.getCount(code , codeName ,fastTypeName);
	}

	@Override//模糊分页
	public ArrayList<Fast> findFastForm(PageModel pageModel, int nowPage, String code, String codeName, String fastTypeName)
			throws Exception {
		 
		return fastMapper.findFastForm(pageModel,nowPage,code,codeName , fastTypeName);
	}

	@Override//获取修改的id的信息
	public Fast updateById(int id) throws Exception {
	 
		return fastMapper.updateById(id);
	}

	@Override//修改
	public void updatePro(Fast fast) throws Exception {
	 
		fastMapper.updatePro(fast);
	}

	@Override//增加
	public void insertFast(Fast fast) throws Exception {
		 fastMapper.insertFast(fast);
		
	}

	@Override//单个删除
	public void deleteFast(String[] id1) throws Exception {
		fastMapper.deleteFast(id1);
	}

	@Override//批量删除
	public void deleteFasts(String[] id1)  throws Exception{
		fastMapper.deleteFasts(id1);
		
	}

	@Override
	public void deleteFastss(String code) throws Exception {
		fastMapper.deleteFastss(code);
		
	}

	@Override
	public ArrayList<Fast> finFastYZ(String code) throws Exception {
	 
		return fastMapper.finFastYZ(code);
	}

	@Override
	public ArrayList<Fast> finFastCodeName(String fastType, String code) throws Exception {
	 
		return fastMapper.finFastCodeName(fastType,code);
	}

	@Override
	public ArrayList<Fast> finFastType(String fastType) throws Exception {
		 
		return fastMapper.finFastType(fastType);
	}

	@Override
	public void deleteFastsss(String code) throws Exception {
		fastMapper.deleteFastsss(code);		
	}

	@Override
	public ArrayList<Fast> findFast() {
		 
		return fastMapper.findFast();
	}
	@Override
	public Fast selectFastByCode(String code) {
		// TODO Auto-generated method stub
		return fastMapper.selectFastByCode(code);
	}

	}


