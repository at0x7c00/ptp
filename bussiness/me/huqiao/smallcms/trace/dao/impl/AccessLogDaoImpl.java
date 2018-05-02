package me.huqiao.smallcms.trace.dao.impl;
import java.util.ArrayList;
import java.util.List;

import me.huqiao.smallcms.common.dao.impl.BaseDaoImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.history.entity.TestRevisionEntity;
import me.huqiao.smallcms.trace.dao.IAccessLogDao;
import me.huqiao.smallcms.trace.entity.AccessLog;
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
public class AccessLogDaoImpl extends BaseDaoImpl<AccessLog> implements IAccessLogDao {
    @Override
    public Long findListRowCount(AccessLog accessLog) {
        Criteria criteria = getSession().createCriteria(AccessLog.class).setProjection(Projections.rowCount());
        queryCause(criteria,accessLog);
        return (Long) criteria.uniqueResult();
    }
	@Override
	public Long findHistoryListRowCount(AccessLog accessLog,Page pageInfo) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forRevisionsOfEntity(AccessLog.class, false, true);
		query.add(AuditEntity.property("manageKey").eq(accessLog.getManageKey()));
		queryCause(query,pageInfo);
		query.addProjection(AuditEntity.property("manageKey").count());
		return (Long) query.getSingleResult();
	}
    @SuppressWarnings("unchecked")
    @Override
    public List<AccessLog> findListPage(AccessLog accessLog, Page pageInfo){
    	Criteria criteria = getSession().createCriteria(AccessLog.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage());
        queryCause(criteria,accessLog);
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
	public List<HistoryRecord<AccessLog>> findHistoryListPage(AccessLog accessLog, Page pageInfo) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forRevisionsOfEntity(AccessLog.class, false, true);
		query.setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage());
		query.add(AuditEntity.property("manageKey").eq(accessLog.getManageKey()));
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
		List<HistoryRecord<AccessLog>> res = new ArrayList<HistoryRecord<AccessLog>>();
		for(Object obj : list){
			Object[] array = (Object[])obj;
			HistoryRecord<AccessLog> record = new HistoryRecord<AccessLog>();
			record.setRecord((AccessLog)array[0]);
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
      * @param accessLog 查询对象
	  */
    public void queryCause(Criteria criteria,AccessLog accessLog){
       if(accessLog.getIp()!=null
 && ! accessLog.getIp().trim().equals("")){
		criteria.add(Restrictions.like("ip",accessLog.getIp(),MatchMode.ANYWHERE));
}
       if(accessLog.getPage()!=null
 && ! accessLog.getPage().trim().equals("")){
		criteria.add(Restrictions.like("page",accessLog.getPage(),MatchMode.ANYWHERE));
}
       if(accessLog.getUserID()!=null
 && ! accessLog.getUserID().trim().equals("")){
		criteria.add(Restrictions.like("userID",accessLog.getUserID(),MatchMode.ANYWHERE));
}
if(accessLog.getAccessTimeStart()!=null){
criteria.add(Restrictions.ge("accessTime",accessLog.getAccessTimeStart()));
}
if(accessLog.getAccessTimeEnd()!=null){
criteria.add(Restrictions.le("accessTime",accessLog.getAccessTimeEnd()));
}
       if(accessLog.getSessionID()!=null
 && ! accessLog.getSessionID().trim().equals("")){
		criteria.add(Restrictions.like("sessionID",accessLog.getSessionID(),MatchMode.ANYWHERE));
}
    }
	@Override
	public AccessLog findByVersion(Integer version) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forEntitiesAtRevision(AccessLog.class, version);
		query.add(AuditEntity.revisionNumber().eq(version));
		List list = query.getResultList();
		if(list!=null && list.size()>0){
			return (AccessLog)list.get(0);
		}
		return null;
	}
	@Override
	public List<AccessLog> findByKey(Page pageInfo,String queryKey) {
		Criteria criteria = getSession().createCriteria(AccessLog.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage()).add(Restrictions.like("manageKey", queryKey,MatchMode.ANYWHERE));
		return criteria.list();
	}
	@Override
	public Long findRowCount(String queryKey) {
		Criteria criteria = getSession().createCriteria(AccessLog.class)
				.setProjection(Projections.rowCount())
				.add(Restrictions.like("manageKey", queryKey,MatchMode.ANYWHERE));
		return (Long) criteria.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<AccessLog> findById(Integer[] ids) {
		Criteria criteria = getSession().createCriteria(AccessLog.class)
		.add(Restrictions.in("id", ids));
		return criteria.list();
	}
}