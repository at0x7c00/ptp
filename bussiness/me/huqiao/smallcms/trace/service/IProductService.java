package me.huqiao.smallcms.trace.service;
import java.util.List;

import me.huqiao.smallcms.common.service.IBaseService;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.entity.Product;
import me.huqiao.smallcms.util.web.Page;
/**
 * 商品Service接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface IProductService extends IBaseService<Product> {
    /**
     * 商品分页查询
     * @param product 查询对象
     * @param pageInfo 分页查询对象
     * @return Page<Product> 商品分页信息对象
     */
    public Page<Product> getListPage(Product product,Page pageInfo);
	/**
	  * 商品历史记录分页查询
	  * @param product 查询对象
	  * @param pageInfo 分页查询对象
	  * @return Page<HistoryRecord<Product>> 商品历史分页信息对象
	  */
	public Page<HistoryRecord<Product>> getHistoryListPage(Product product,Page pageInfo);
	/**
	 * 商品版本号查询
	 * @param version 查询版本号
	 * @return Product 商品历史记录
	 */
	public Product findByVersion(Integer version);
	/**
	 * 商品关键字查询
	 * @param  queryKey 关键字
	 * @param  pageInfo 分页查询对象
	 * @return Page<Product> 商品分页信息对象
	 * 
	 */
	Page<Product> queryByKey(String queryKey, Page<Product> pageInfo);
	/**
	 * 查找多个商品
	 * @param ids id数组
	 * @return List<Product> 商品列表
	 * 
	 */
	List<Product> queryById(Integer[] ids);
	
	public boolean addQueryCount(Integer id);
}