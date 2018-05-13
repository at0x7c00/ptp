package me.huqiao.smallcms.trace.dao.impl;
import java.util.ArrayList;
import java.util.List;

import me.huqiao.smallcms.common.dao.impl.BaseDaoImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.history.entity.TestRevisionEntity;
import me.huqiao.smallcms.trace.dao.IProductDao;
import me.huqiao.smallcms.trace.entity.Product;
import me.huqiao.smallcms.util.web.Page;

import org.hibernate.Criteria;
import org.hibernate.Query;
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
 * 商品DAO实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Repository
public class ProductDaoImpl extends BaseDaoImpl<Product> implements IProductDao {
    @Override
    public Long findListRowCount(Product product) {
        Criteria criteria = getSession().createCriteria(Product.class).setProjection(Projections.rowCount());
        queryCause(criteria,product);
        return (Long) criteria.uniqueResult();
    }
	@Override
	public Long findHistoryListRowCount(Product product,Page pageInfo) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forRevisionsOfEntity(Product.class, false, true);
		query.add(AuditEntity.property("manageKey").eq(product.getManageKey()));
		queryCause(query,pageInfo);
		query.addProjection(AuditEntity.property("manageKey").count());
		return (Long) query.getSingleResult();
	}
    @SuppressWarnings("unchecked")
    @Override
    public List<Product> findListPage(Product product, Page pageInfo){
    	Criteria criteria = getSession().createCriteria(Product.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage());
        queryCause(criteria,product);
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
	public List<HistoryRecord<Product>> findHistoryListPage(Product product, Page pageInfo) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forRevisionsOfEntity(Product.class, false, true);
		query.setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage());
		query.add(AuditEntity.property("manageKey").eq(product.getManageKey()));
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
		List<HistoryRecord<Product>> res = new ArrayList<HistoryRecord<Product>>();
		for(Object obj : list){
			Object[] array = (Object[])obj;
			HistoryRecord<Product> record = new HistoryRecord<Product>();
			record.setRecord((Product)array[0]);
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
	  * 根据查询对象往criteria对���增加查询条件
      * @param criteria Hibernate criteria对象
      * @param product 查询对象
	  */
    public void queryCause(Criteria criteria,Product product){
       if(product.getName()!=null
 && ! product.getName().trim().equals("")){
		criteria.add(Restrictions.like("name",product.getName(),MatchMode.ANYWHERE));
}
       if(product.getBrand()!=null
 && ! product.getBrand().trim().equals("")){
		criteria.add(Restrictions.like("brand",product.getBrand(),MatchMode.ANYWHERE));
}
				if(product.getCategory()!=null && product.getCategory().getId() != null ){
					criteria.add(Restrictions.eq("category",product.getCategory()));
				}
				if(product.getPicture()!=null && product.getPicture().getId() != null ){
					criteria.add(Restrictions.eq("picture",product.getPicture()));
				}
       if(product.getDescription()!=null
 && ! product.getDescription().trim().equals("")){
		criteria.add(Restrictions.like("description",product.getDescription(),MatchMode.ANYWHERE));
}
       if(product.getSpec()!=null
 && ! product.getSpec().trim().equals("")){
		criteria.add(Restrictions.like("spec",product.getSpec(),MatchMode.ANYWHERE));
}
				if(product.getQrCode()!=null && product.getQrCode().getId() != null ){
					criteria.add(Restrictions.eq("qrCode",product.getQrCode()));
				}
       if(product.getProductAddr()!=null
 && ! product.getProductAddr().trim().equals("")){
		criteria.add(Restrictions.like("productAddr",product.getProductAddr(),MatchMode.ANYWHERE));
}
       if(product.getTrace()!=null
 && ! product.getTrace().trim().equals("")){
		criteria.add(Restrictions.like("trace",product.getTrace(),MatchMode.ANYWHERE));
}
if(product.getDeadlineStart()!=null){
criteria.add(Restrictions.ge("deadline",product.getDeadlineStart()));
}
if(product.getDeadlineEnd()!=null){
criteria.add(Restrictions.le("deadline",product.getDeadlineEnd()));
}
       if(product.getBatchNum()!=null
 && ! product.getBatchNum().trim().equals("")){
		criteria.add(Restrictions.like("batchNum",product.getBatchNum(),MatchMode.ANYWHERE));
}
       if(product.getStandard()!=null
 && ! product.getStandard().trim().equals("")){
		criteria.add(Restrictions.like("standard",product.getStandard(),MatchMode.ANYWHERE));
}
       if(product.getTel()!=null
 && ! product.getTel().trim().equals("")){
		criteria.add(Restrictions.like("tel",product.getTel(),MatchMode.ANYWHERE));
}
       if(product.getStatus()!=null
){
		criteria.add(Restrictions.eq("status",product.getStatus()));
}
				if(product.getCreator()!=null && product.getCreator().getId() != null ){
					criteria.add(Restrictions.eq("creator",product.getCreator()));
				}
    }
	@Override
	public Product findByVersion(Integer version) {
		AuditReader reader = AuditReaderFactory.get(getSession());
		AuditQueryCreator queryCreator2 = reader.createQuery();
		AuditQuery query = queryCreator2.forEntitiesAtRevision(Product.class, version);
		query.add(AuditEntity.revisionNumber().eq(version));
		List list = query.getResultList();
		if(list!=null && list.size()>0){
			return (Product)list.get(0);
		}
		return null;
	}
	@Override
	public List<Product> findByKey(Page pageInfo,String queryKey) {
		Criteria criteria = getSession().createCriteria(Product.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage()).add(Restrictions.like("name", queryKey,MatchMode.ANYWHERE));
		return criteria.list();
	}
	@Override
	public Long findRowCount(String queryKey) {
		Criteria criteria = getSession().createCriteria(Product.class)
				.setProjection(Projections.rowCount())
				.add(Restrictions.like("name", queryKey,MatchMode.ANYWHERE));
		return (Long) criteria.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findById(Integer[] ids) {
		Criteria criteria = getSession().createCriteria(Product.class)
		.add(Restrictions.in("id", ids));
		return criteria.list();
	}
	@Override
	public boolean addQueryCount(Integer id) {
		Query query = getSession().createSQLQuery("update trace_product p set p.query_count = p.query_count+1 where p.id=:id");
		query.setParameter("id", id);
		int updated = query.executeUpdate();
		return updated == 1;
	}
}