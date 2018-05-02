package me.huqiao.smallcms.trace.dao;
import java.util.List;

import me.huqiao.smallcms.common.dao.IBaseDao;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.entity.Category;
import me.huqiao.smallcms.util.web.Page;

import org.hibernate.Criteria;
/**
 * 类目DAO接口
 * @author NOVOTS
 * @version Version 1.0
 */
public interface ICategoryDao extends IBaseDao<Category> {
    /**
     * 类目查询记录数量
     * @param category 查询对象
     * @return Long 记录数量
     */
	Long findListRowCount(Category category);
	/**
	 * 类目历史记录数量
     * @param category 查询对象
     * @param pageInfo 分页查询对象
	 * @return Long 历史记录数量
     */
	Long findHistoryListRowCount(Category category,Page pageInfo);
    /**
     * 类目分页查询
     * @param category 查询对象
     * @param pageInfo 分页查询对象
     * @return  List<Category>  类目列表 
     */
    List<Category> findListPage(Category category, Page pageInfo);
	/**
	 * 类目历史记录分页查询
     * @param category 查询对象
     * @param pageInfo 分页查询对象
     * @return List<HistoryRecord<Category>>  类目历史列表
	 */
    List<HistoryRecord<Category>> findHistoryListPage(Category category, Page pageInfo);
	/**
     * 类目版本号查询
     * @param version 版本号
	 * @return Category 类目历史记录
     */
	Category findByVersion(Integer version);
	/**
	 * 添加类目查询条件
	 * @param criteria Hibernate Criteria对象
	 * @param category 查询对象
	 */
	public void queryCause(Criteria criteria, Category category);
	/**
	 * 类目关键字查询
	 * @param  queryKey 查询关键字
	 * @return List<Category> 类目列表
	 */
	List<Category> findByKey(Page pageInfo,String queryKey);
	/**
	 * 类目关键字查询数量
	 * @param queryKey 查询关键字
	 * @return Long 记录数量
	 */
	Long findRowCount(String queryKey);
    /**
     * 查找多个类目
     * @param  ids id数组
	 * @return List<Category>  类目列表
     */
	List<Category> findById(Integer[] ids);
}