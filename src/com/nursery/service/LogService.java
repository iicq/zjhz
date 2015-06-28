package com.nursery.service;

import java.util.List;
import com.nursery.model.SLog;
import com.nursery.model.jsp.SLogVO;

public interface LogService {

	public void save(SLog data);

	public void update(SLog data) ;

	public void delete(String id) ;

	public SLogVO findById(String id);

	public List<SLogVO> list(SLogVO dataVO, int index, int size);

	public Long count(SLogVO dataVO);
	/**
	 * 获取记录 排序时间由远到近
	 * @param data
	 * @return
	 */
	public List<SLogVO> find(SLog data);
	/**
	 * 获取记录 排序时间由近到远
	 * @param data
	 * @return
	 */
	public List<SLogVO> findLast(SLog data);

	public List<SLogVO> lastList();

}
