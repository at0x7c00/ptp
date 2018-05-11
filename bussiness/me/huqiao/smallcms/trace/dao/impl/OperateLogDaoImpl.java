package me.huqiao.smallcms.trace.dao.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import me.huqiao.smallcms.common.dao.impl.BaseDaoImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.history.entity.TestRevisionEntity;
import me.huqiao.smallcms.trace.dao.IOperateLogDao;
import me.huqiao.smallcms.trace.entity.OperateLog;
import me.huqiao.smallcms.util.DateUtil;
import me.huqiao.smallcms.util.web.Page;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.RevisionType;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;
import org.hibernate.envers.query.AuditQueryCreator;
import org.springframework.stereotype.Repository;
/**
 * 访问日志DAO实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Repository
public class OperateLogDaoImpl extends BaseDaoImpl<OperateLog> implements IOperateLogDao {
    @Override
    public Long findListRowCount(OperateLog operateLog) {
        Criteria criteria = getSession().createCriteria(OperateLog.class).setProjection(Projections.rowCount());
        queryCause(criteria,operateLog);
        return (Long) criteria.uniqueResult();
    }
	@Override
	public Long findHistoryListRowCount(OperateLog operateLog,Page pageInfo) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forRevisionsOfEntity(OperateLog.class, false, true);
		query.add(AuditEntity.property("manageKey").eq(operateLog.getManageKey()));
		queryCause(query,pageInfo);
		query.addProjection(AuditEntity.property("manageKey").count());
		return (Long) query.getSingleResult();
	}
    @SuppressWarnings("unchecked")
    @Override
    public List<OperateLog> findListPage(OperateLog operateLog, Page pageInfo){
    	Criteria criteria = getSession().createCriteria(OperateLog.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage());
        queryCause(criteria,operateLog);
        if(pageInfo.getOrderField()!=null && !pageInfo.getOrderField().trim().equals("")){
         	if(pageInfo.getOrderDirection()==null || pageInfo.getOrderDirection().trim().equals("asc")){
         		criteria.addOrder(Order.asc(pageInfo.getOrderField()));
         	}else{
         		criteria.addOrder(Order.desc(pageInfo.getOrderField()));
         	}
         }else{
         	criteria.addOrder(Order.asc("id")); 
         }
        return criteria.list();
    }
	@SuppressWarnings("unchecked")
	@Override
	public List<HistoryRecord<OperateLog>> findHistoryListPage(OperateLog operateLog, Page pageInfo) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forRevisionsOfEntity(OperateLog.class, false, true);
		query.setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage());
		query.add(AuditEntity.property("manageKey").eq(operateLog.getManageKey()));
		queryCause(query,pageInfo);
		if (pageInfo.getOrderField() != null && !pageInfo.getOrderField().trim().equals("")) {
			if (pageInfo.getOrderDirection() == null || pageInfo.getOrderDirection().trim().equals("asc")) {
				query.addOrder(AuditEntity.property(pageInfo.getOrderField()).asc());
			} else {
				query.addOrder(AuditEntity.property(pageInfo.getOrderField()).desc());
			}
		} else {
			query.addOrder(AuditEntity.property("id").desc());
		}
		List list = query.getResultList();
		List<HistoryRecord<OperateLog>> res = new ArrayList<HistoryRecord<OperateLog>>();
		for(Object obj : list){
			Object[] array = (Object[])obj;
			HistoryRecord<OperateLog> record = new HistoryRecord<OperateLog>();
			record.setRecord((OperateLog)array[0]);
			record.setRevisionEntity((TestRevisionEntity)array[1]);
			record.setType((RevisionType)array[2]);
			res.add(record);
		}
		return res;
	}
	/**
	  * 添加历史记录查询条件
      * @param query 历史查询对象
      * @param pageInfo 历史记录分页查询对象
	  */
	public void queryCause(AuditQuery query,Page pageInfo) {
		if(pageInfo.getOperateDateStart()!=null){
			query.add(AuditEntity.revisionProperty("timestamp").ge(pageInfo.getOperateDateStart()));
		}
		if(pageInfo.getOperateDateEnd()!=null){
			query.add(AuditEntity.revisionProperty("timestamp").le(pageInfo.getOperateDateEnd()));
		}
		if(pageInfo.getOperator()!=null && !pageInfo.getOperator().trim().equals("")){
			query.add(AuditEntity.revisionProperty("username").like(pageInfo.getOperator(),MatchMode.ANYWHERE));
		}
		if(pageInfo.getOperateType()!=null && !pageInfo.getOperateType().trim().equals("")){
			query.add(AuditEntity.revisionType().eq(RevisionType.valueOf(pageInfo.getOperateType())));
		}
	}
	/**
	  * 根据查询对象往criteria对象增加查询条件
      * @param criteria Hibernate criteria对象
      * @param operateLog 查询对象
	  */
    public void queryCause(Criteria criteria,OperateLog operateLog){
       if(operateLog.getIp()!=null
		 && ! operateLog.getIp().trim().equals("")){
				criteria.add(Restrictions.like("ip",operateLog.getIp(),MatchMode.ANYWHERE));
		}
		       if(operateLog.getType()!=null
		 && ! operateLog.getType().trim().equals("")){
				criteria.add(Restrictions.eq("page",operateLog.getType()));
		}
		       if(operateLog.getUserID()!=null
		 && ! operateLog.getUserID().trim().equals("")){
				criteria.add(Restrictions.like("userID",operateLog.getUserID(),MatchMode.ANYWHERE));
		}
		if(operateLog.getOperateTimeStart()!=null){
		criteria.add(Restrictions.ge("operateTime",operateLog.getOperateTimeStart()));
		}
		if(operateLog.getOperateTimeEnd()!=null){
		criteria.add(Restrictions.le("operateTime",operateLog.getOperateTimeEnd()));
		}
       if(operateLog.getSessionID()!=null
		 && ! operateLog.getSessionID().trim().equals("")){
				criteria.add(Restrictions.like("sessionID",operateLog.getSessionID(),MatchMode.ANYWHERE));
		}
    }
	@Override
	public OperateLog findByVersion(Integer version) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forEntitiesAtRevision(OperateLog.class, version);
		query.add(AuditEntity.revisionNumber().eq(version));
		List list = query.getResultList();
		if(list!=null && list.size()>0){
			return (OperateLog)list.get(0);
		}
		return null;
	}
	@Override
	public List<OperateLog> findByKey(Page pageInfo,String queryKey) {
		Criteria criteria = getSession().createCriteria(OperateLog.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage()).add(Restrictions.like("manageKey", queryKey,MatchMode.ANYWHERE));
		return criteria.list();
	}
	@Override
	public Long findRowCount(String queryKey) {
		Criteria criteria = getSession().createCriteria(OperateLog.class)
				.setProjection(Projections.rowCount())
				.add(Restrictions.like("manageKey", queryKey,MatchMode.ANYWHERE));
		return (Long) criteria.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<OperateLog> findById(Integer[] ids) {
		Criteria criteria = getSession().createCriteria(OperateLog.class)
		.add(Restrictions.in("id", ids));
		return criteria.list();
	}
	
	@Override
	public boolean existedBefore(String number, Date date) {
		Criteria criteria = getSession().createCriteria(OperateLog.class).setProjection(Projections.rowCount());
		criteria.add(Restrictions.ge("operateTime", date));
		criteria.add(Restrictions.eq("operate", "getCode:" + number));
		criteria.add(Restrictions.eq("type","INFO"));
        long count = (Long) criteria.uniqueResult();
        return count>0;
	}
	
	@Override
	public boolean existedBefore(String number, Date date,String code) {
		Criteria criteria = getSession().createCriteria(OperateLog.class).setProjection(Projections.rowCount());
		criteria.add(Restrictions.ge("operateTime", date));
		criteria.add(Restrictions.eq("operate", "getCode:" + number));
		criteria.add(Restrictions.eq("type","INFO"));
		criteria.add(Restrictions.eq("description",code));
		long count = (Long) criteria.uniqueResult();
		return count>0;
	}
	
	@Override
	public Long countForIP(String ip, Date date) {
		Criteria criteria = getSession().createCriteria(OperateLog.class).setProjection(Projections.rowCount());
		criteria.add(Restrictions.ge("operateTime", date));
		criteria.add(Restrictions.eq("ip",ip));
		criteria.add(Restrictions.eq("ip",ip));
		criteria.add(Restrictions.eq("type","INFO"));
		return (Long) criteria.uniqueResult();
	}
}