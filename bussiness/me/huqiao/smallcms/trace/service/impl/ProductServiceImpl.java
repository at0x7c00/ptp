package me.huqiao.smallcms.trace.service.impl;
import java.util.List;

import javax.annotation.Resource;

import me.huqiao.smallcms.common.service.impl.BaseServiceImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.dao.IProductDao;
import me.huqiao.smallcms.trace.entity.Product;
import me.huqiao.smallcms.trace.service.IProductService;
import me.huqiao.smallcms.util.web.Page;

import org.springframework.stereotype.Service;
/**
 * 商品Service接口实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Service
public class ProductServiceImpl extends BaseServiceImpl<Product> implements IProductService {
    /**商品DAO对象*/
    @Resource
    private IProductDao productDao;
    @Override
    public Page<Product> getListPage(Product product,Page pageInfo) {
      	pageInfo.setTotalCount(productDao.findListRowCount(product).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "asc": pageInfo.getOrderDirection());
		pageInfo.setList(productDao.findListPage(product,pageInfo));
        return pageInfo;
    }
	@Override
	public Page<HistoryRecord<Product>> getHistoryListPage(Product product, Page pageInfo) {
		pageInfo.setTotalCount(productDao.findHistoryListRowCount(product,pageInfo).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "asc": pageInfo.getOrderDirection());
		pageInfo.setList(productDao.findHistoryListPage(product,pageInfo));
        return pageInfo;
	}
	@Override
	public Product findByVersion(Integer version) {
		return productDao.findByVersion(version);
	}
	@Override
	public Page<Product> queryByKey(String queryKey, Page<Product> pageInfo) {
		int countRecord = productDao.findRowCount(queryKey).intValue();
		Page<Product> page = new Page<Product>(pageInfo == null ? 0 : pageInfo.getPageNum(), countRecord, pageInfo.getNumPerPage());
		List<Product> productList = productDao.findByKey(pageInfo,queryKey);
		page.setList(productList);
		return page;
	}
	@Override
	public List<Product> queryById(Integer[] ids) {
		return productDao.findById(ids);
	}
}