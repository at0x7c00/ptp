package me.huqiao.smallcms.trace.dao;
import java.util.List;

import me.huqiao.smallcms.common.dao.IBaseDao;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.entity.Product;
import me.huqiao.smallcms.util.web.Page;

import org.hibernate.Criteria;
/**
 * 商品DAO接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface IProductDao extends IBaseDao<Product> {
    /**
     * 商品查询记录数量
     * @param product 查询对象
     * @return Long 记录数量
     */
	Long findListRowCount(Product product);
	/**
	 * 商品历史记录数量
     * @param product 查询对象
     * @param pageInfo 分页查询对象
	 * @return Long 历史记录数量
     */
	Long findHistoryListRowCount(Product product,Page pageInfo);
    /**
     * 商品分页查询
     * @param product 查询对象
     * @param pageInfo 分页查询对象
     * @return  List<Product>  商品列表 
     */
    List<Product> findListPage(Product product, Page pageInfo);
	/**
	 * 商品历史记录分页查询
     * @param product 查询对象
     * @param pageInfo 分页查询对象
     * @return List<HistoryRecord<Product>>  商品历史列表
	 */
    List<HistoryRecord<Product>> findHistoryListPage(Product product, Page pageInfo);
	/**
     * 商品版本号查询
     * @param version 版本号
	 * @return Product 商品历史记录
     */
	Product findByVersion(Integer version);
	/**
	 * 添加商品查询条件
	 * @param criteria Hibernate Criteria对象
	 * @param product 查询对象
	 */
	public void queryCause(Criteria criteria, Product product);
	/**
	 * 商品关键字查询
	 * @param  queryKey 查询关键字
	 * @return List<Product> 商品列表
	 */
	List<Product> findByKey(Page pageInfo,String queryKey);
	/**
	 * 商品关键字查询数量
	 * @param queryKey 查询关键字
	 * @return Long 记录数量
	 */
	Long findRowCount(String queryKey);
    /**
     * 查找多个商品
     * @param  ids id数组
	 * @return List<Product>  商品列表
     */
	List<Product> findById(Integer[] ids);
}