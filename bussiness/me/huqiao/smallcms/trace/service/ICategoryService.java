package me.huqiao.smallcms.trace.service;
import java.util.Collection;
import java.util.List;

import me.huqiao.smallcms.common.service.IBaseService;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.entity.Category;
import me.huqiao.smallcms.util.web.Page;
/**
 * 类目Service接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface ICategoryService extends IBaseService<Category> {
    /**
     * 类目分页查询
     * @param category 查询对象
     * @param pageInfo 分页查询对象
     * @return Page<Category> 类目分页信息对象
     */
    public Page<Category> getListPage(Category category,Page pageInfo);
	/**
	  * 类目历史记录分页查询
	  * @param category 查询对��
	  * @param pageInfo 分页查询对象
	  * @return Page<HistoryRecord<Category>> 类目历史分页信息对象
	  */
	public Page<HistoryRecord<Category>> getHistoryListPage(Category category,Page pageInfo);
	/**
	 * 类目版本号查询
	 * @param version 查询版本号
	 * @return Category 类目历史记录
	 */
	public Category findByVersion(Integer version);
	/**
	 * 类目关键字查询
	 * @param  queryKey 关键字
	 * @param  pageInfo 分页查询对象
	 * @return Page<Category> 类目分页信息对象
	 * 
	 */
	Page<Category> queryByKey(String queryKey, Page<Category> pageInfo);
	/**
	 * 查找多个类目
	 * @param ids id数组
	 * @return List<Category> 类目列表
	 * 
	 */
	List<Category> queryById(Integer[] ids);
	public void tree(Collection<Category> topCategories, String prefixCode,
			List<Category> result, Integer filterId);
}