package me.huqiao.smallcms.trace.service.impl;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import me.huqiao.smallcms.common.service.impl.BaseServiceImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.dao.ICategoryDao;
import me.huqiao.smallcms.trace.entity.Category;
import me.huqiao.smallcms.trace.service.ICategoryService;
import me.huqiao.smallcms.util.StringUtil;
import me.huqiao.smallcms.util.web.Page;

import org.springframework.stereotype.Service;
/**
 * 类目Service接口实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Service
public class CategoryServiceImpl extends BaseServiceImpl<Category> implements ICategoryService {
    /**类目DAO对象*/
    @Resource
    private ICategoryDao categoryDao;
    @Override
    public Page<Category> getListPage(Category category,Page pageInfo) {
      	pageInfo.setTotalCount(categoryDao.findListRowCount(category).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "asc": pageInfo.getOrderDirection());
		pageInfo.setList(categoryDao.findListPage(category,pageInfo));
        return pageInfo;
    }
	@Override
	public Page<HistoryRecord<Category>> getHistoryListPage(Category category, Page pageInfo) {
		pageInfo.setTotalCount(categoryDao.findHistoryListRowCount(category,pageInfo).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "asc": pageInfo.getOrderDirection());
		pageInfo.setList(categoryDao.findHistoryListPage(category,pageInfo));
        return pageInfo;
	}
	@Override
	public Category findByVersion(Integer version) {
		return categoryDao.findByVersion(version);
	}
	@Override
	public Page<Category> queryByKey(String queryKey, Page<Category> pageInfo) {
		int countRecord = categoryDao.findRowCount(queryKey).intValue();
		Page<Category> page = new Page<Category>(pageInfo == null ? 0 : pageInfo.getPageNum(), countRecord, pageInfo.getNumPerPage());
		List<Category> categoryList = categoryDao.findByKey(pageInfo,queryKey);
		page.setList(categoryList);
		return page;
	}
	@Override
	public List<Category> queryById(Integer[] ids) {
		return categoryDao.findById(ids);
	}
	@Override
	public void tree(Collection<Category> topCategories, String prefixCode,List<Category> result, Integer filterId) {
		if (topCategories == null)
			return;
		int count = 0;
		for (Category subCategory : topCategories) {
			count++;
			Category tmpCategory = new Category();
			tmpCategory.setId(subCategory.getId());
			tmpCategory.setParent(subCategory.getParent());
			tmpCategory.setOrderNum(subCategory.getOrderNum());
			tmpCategory.setManageKey(subCategory.getManageKey());
			tmpCategory.setStatus(subCategory.getStatus());
			String prefix = parsePrefix(prefixCode);
			if (count == topCategories.size()) {
				if (filterId == null || subCategory.getId() != filterId) {
					tmpCategory.setName(prefix + "┗━" + StringUtil.htmlJsonSecuritify(subCategory.getName()));
					result.add(tmpCategory);
					tree(subCategory.getChildren(), prefixCode + "0", result, filterId);
				}
			} else {
				if (filterId == null || subCategory.getId() != filterId) {
					tmpCategory.setName(prefix + "┣━" + StringUtil.htmlJsonSecuritify(subCategory.getName()));
					result.add(tmpCategory);
					tree(subCategory.getChildren(), prefixCode + "1", result, filterId);
				}
			}
		}
	}
	
	/**
	 * 解析前缀，生成复制Department的名称的前缀
	 * 
	 * @param prefixCode
	 *            要解析对象
	 * @return String 生成复制Department的名称的前缀
	 */
	private static String parsePrefix(String prefixCode) {
		String str = " ";
		char[] array = prefixCode.toCharArray();
		for (int i = 0; i < array.length; i++) {
			char c = array[i];
			if (c == '1') {
				str += "┃&nbsp;&nbsp;";
			} else {
				str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			}
		}
		return str;
	}
}