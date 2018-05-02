package me.huqiao.smallcms.trace.dao.impl;
import java.util.ArrayList;
import java.util.List;

import me.huqiao.smallcms.common.dao.impl.BaseDaoImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.history.entity.TestRevisionEntity;
import me.huqiao.smallcms.trace.dao.IRegisterApplyDao;
import me.huqiao.smallcms.trace.entity.RegisterApply;
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
 * 注册申请DAO实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Repository
public class RegisterApplyDaoImpl extends BaseDaoImpl<RegisterApply> implements IRegisterApplyDao {
    @Override
    public Long findListRowCount(RegisterApply registerApply) {
        Criteria criteria = getSession().createCriteria(RegisterApply.class).setProjection(Projections.rowCount());
        queryCause(criteria,registerApply);
        return (Long) criteria.uniqueResult();
    }
	@Override
	public Long findHistoryListRowCount(RegisterApply registerApply,Page pageInfo) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forRevisionsOfEntity(RegisterApply.class, false, true);
		query.add(AuditEntity.property("manageKey").eq(registerApply.getManageKey()));
		queryCause(query,pageInfo);
		query.addProjection(AuditEntity.property("manageKey").count());
		return (Long) query.getSingleResult();
	}
    @SuppressWarnings("unchecked")
    @Override
    public List<RegisterApply> findListPage(RegisterApply registerApply, Page pageInfo){
    	Criteria criteria = getSession().createCriteria(RegisterApply.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage());
        queryCause(criteria,registerApply);
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
	public List<HistoryRecord<RegisterApply>> findHistoryListPage(RegisterApply registerApply, Page pageInfo) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forRevisionsOfEntity(RegisterApply.class, false, true);
		query.setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage());
		query.add(AuditEntity.property("manageKey").eq(registerApply.getManageKey()));
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
		List<HistoryRecord<RegisterApply>> res = new ArrayList<HistoryRecord<RegisterApply>>();
		for(Object obj : list){
			Object[] array = (Object[])obj;
			HistoryRecord<RegisterApply> record = new HistoryRecord<RegisterApply>();
			record.setRecord((RegisterApply)array[0]);
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
      * @param registerApply 查询对象
	  */
    public void queryCause(Criteria criteria,RegisterApply registerApply){
       if(registerApply.getLawPerson()!=null
 && ! registerApply.getLawPerson().trim().equals("")){
		criteria.add(Restrictions.like("lawPerson",registerApply.getLawPerson(),MatchMode.ANYWHERE));
}
       if(registerApply.getAddress()!=null
 && ! registerApply.getAddress().trim().equals("")){
		criteria.add(Restrictions.like("address",registerApply.getAddress(),MatchMode.ANYWHERE));
}
       if(registerApply.getContact()!=null
 && ! registerApply.getContact().trim().equals("")){
		criteria.add(Restrictions.like("contact",registerApply.getContact(),MatchMode.ANYWHERE));
}
       if(registerApply.getName()!=null
 && ! registerApply.getName().trim().equals("")){
		criteria.add(Restrictions.like("name",registerApply.getName(),MatchMode.ANYWHERE));
}
       if(registerApply.getTelq()!=null
 && ! registerApply.getTelq().trim().equals("")){
		criteria.add(Restrictions.like("telq",registerApply.getTelq(),MatchMode.ANYWHERE));
}
       if(registerApply.getEmail()!=null
 && ! registerApply.getEmail().trim().equals("")){
		criteria.add(Restrictions.like("email",registerApply.getEmail(),MatchMode.ANYWHERE));
}
				if(registerApply.getLicense()!=null && registerApply.getLicense().getId() != null ){
					criteria.add(Restrictions.eq("license",registerApply.getLicense()));
				}
				if(registerApply.getLawPersonIDCard()!=null && registerApply.getLawPersonIDCard().getId() != null ){
					criteria.add(Restrictions.eq("lawPersonIDCard",registerApply.getLawPersonIDCard()));
				}
       if(registerApply.getStatus()!=null
){
		criteria.add(Restrictions.eq("status",registerApply.getStatus()));
}
       if(registerApply.getDealRemak()!=null
 && ! registerApply.getDealRemak().trim().equals("")){
		criteria.add(Restrictions.like("dealRemak",registerApply.getDealRemak(),MatchMode.ANYWHERE));
}
    }
	@Override
	public RegisterApply findByVersion(Integer version) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forEntitiesAtRevision(RegisterApply.class, version);
		query.add(AuditEntity.revisionNumber().eq(version));
		List list = query.getResultList();
		if(list!=null && list.size()>0){
			return (RegisterApply)list.get(0);
		}
		return null;
	}
	@Override
	public List<RegisterApply> findByKey(Page pageInfo,String queryKey) {
		Criteria criteria = getSession().createCriteria(RegisterApply.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage()).add(Restrictions.like("name", queryKey,MatchMode.ANYWHERE));
		return criteria.list();
	}
	@Override
	public Long findRowCount(String queryKey) {
		Criteria criteria = getSession().createCriteria(RegisterApply.class)
				.setProjection(Projections.rowCount())
				.add(Restrictions.like("name", queryKey,MatchMode.ANYWHERE));
		return (Long) criteria.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<RegisterApply> findById(Integer[] ids) {
		Criteria criteria = getSession().createCriteria(RegisterApply.class)
		.add(Restrictions.in("id", ids));
		return criteria.list();
	}
}