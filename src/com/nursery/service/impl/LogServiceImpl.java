package com.nursery.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Service;
import com.nursery.model.Admin;
import com.nursery.model.SLog;
import com.nursery.model.jsp.SLogVO;
import com.nursery.service.LogService;
import com.nursery.service.query.AbstractPageQuery;
import com.nursery.service.query.AbstractQuery;
import com.nursery.service.query.DefaultExecutor;
import com.nursery.util.UUIDFactory;

@Service("logService")
public class LogServiceImpl extends DefaultService implements LogService {

	@Override
	public SLogVO findById(String dataId) {
		String sql = new StringBuffer()
		.append(" select a.* ")
		.append(" from s_log a ")
		.append(" where 1=1 and a.id = ?").toString();
		
		AbstractQuery<SLogVO> query = createQuery(sql, SLogVO.class);
		query.addParam(dataId);
		return getObjectDao().getObject(query);
	}

	@Override
	public void save(SLog data) {
		data.setId(UUIDFactory.random());
		data.setSetTime(new Date().getTime());
		Admin admin = (Admin) getSession("user");
		data.setAdminId(admin.getId());
		getObjectDao().save(data);
	}

	@Override
	public void update(SLog data) {
		getObjectDao().update(data);
		
	}
	
	@Override
	public void delete(String id) {
		String sql = "delete from s_log where id = ?";
		DefaultExecutor executor = new DefaultExecutor(sql);
		executor.addParam(id);
		getObjectDao().execute(executor);
	}
	

	@Override
	public List<SLogVO> list(SLogVO data, int index, int size) {
		StringBuffer sql = new StringBuffer()
		.append(" select a.*,b.name adminName ")
		.append(" from s_log a ")
		.append(" left join admin b on a.admin_id = b.id ")
		.append(" where 1=1 ");
		AbstractPageQuery<SLogVO> query = createPageQuery(SLogVO.class,null,index,size);
		if(data != null){
			if(data.getType() != null && !"".equals(data.getType())){
				sql.append(" and a.type = ? ");
				query.addParam(data.getType());
			}
			if(data.getContent() != null && !"".equals(data.getContent())){
				sql.append(" and a.content like ? ");
				query.addParam("%"+data.getContent()+"%");
			}
		}
		sql.append(" order by a.set_time desc");
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}

	@Override
	public Long count(SLogVO data) {
		StringBuffer sql = new StringBuffer(" select count(a.id) ")
		.append(" from s_log a ")
		.append(" where 1=1 ");
		AbstractQuery<Long> query = createQuery(null,Long.class);
		if(data != null){
			if(data.getType() != null && !"".equals(data.getType())){
				sql.append(" and a.type = ? ");
				query.addParam(data.getType());
			}
			if(data.getContent() != null && !"".equals(data.getContent())){
				sql.append(" and a.content like ? ");
				query.addParam("%"+data.getContent()+"%");
			}
		}
		query.setSQL(sql.toString());
		return getObjectDao().getObject(query);
	}

	@Override
	public List<SLogVO> find(SLog data) {
		StringBuffer sql = new StringBuffer()
		.append(" select a.*,b.name adminName ")
		.append(" from s_log a ")
		.append(" left join admin b on a.admin_id = b.id ")
		.append(" where 1=1 ");
		AbstractQuery<SLogVO> query = createQuery(null,SLogVO.class);
		if(data != null){
			if(data.getType() != null && data.getType() != 0){
				sql.append(" and a.type = ? ");
				query.addParam(data.getType());
			}
			if(data.getTextId() != null && !"".equals(data.getTextId())){
				sql.append(" and a.text_id = ? ");
				query.addParam(data.getTextId());
			}
		}
		sql.append(" order by a.set_time ");
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}

	@Override
	public List<SLogVO> lastList() {
		StringBuffer sql = new StringBuffer()
		.append(" select a.*,b.name adminName ")
		.append(" from s_log a ")
		.append(" left join admin b on a.admin_id = b.id ")
		.append(" where 1=1 ");
		AbstractPageQuery<SLogVO> query = createPageQuery(SLogVO.class,null,1,10);
		sql.append(" order by a.set_time desc");
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}

	@Override
	public List<SLogVO> findLast(SLog data) {
		StringBuffer sql = new StringBuffer()
		.append(" select a.*,b.name adminName ")
		.append(" from s_log a ")
		.append(" left join admin b on a.admin_id = b.id ")
		.append(" where 1=1 ");
		AbstractQuery<SLogVO> query = createQuery(null,SLogVO.class);
		if(data != null){
			if(data.getType() != null && data.getType() != 0){
				sql.append(" and a.type = ? ");
				query.addParam(data.getType());
			}
			if(data.getTextId() != null && !"".equals(data.getTextId())){
				sql.append(" and a.text_id = ? ");
				query.addParam(data.getTextId());
			}
		}
		sql.append(" order by a.set_time desc ");
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}



}
