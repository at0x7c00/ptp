package me.huqiao.smallcms.trace.service.impl;
import java.util.List;

import javax.annotation.Resource;

import me.huqiao.smallcms.common.service.impl.BaseServiceImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.dao.IAccessLogDao;
import me.huqiao.smallcms.trace.entity.AccessLog;
import me.huqiao.smallcms.trace.service.IAccessLogService;
import me.huqiao.smallcms.util.web.Page;

import org.springframework.stereotype.Service;
/**
 * 访问日志Service接口实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Service
public class AccessLogServiceImpl extends BaseServiceImpl<AccessLog> implements IAccessLogService {
    /**访问日志DAO对象*/
    @Resource
    private IAccessLogDao accessLogDao;
    @Override
    public Page<AccessLog> getListPage(AccessLog accessLog,Page pageInfo) {
      	pageInfo.setTotalCount(accessLogDao.findListRowCount(accessLog).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "asc": pageInfo.getOrderDirection());
		pageInfo.setList(accessLogDao.findListPage(accessLog,pageInfo));
        return pageInfo;
    }
	@Override
	public Page<HistoryRecord<AccessLog>> getHistoryListPage(AccessLog accessLog, Page pageInfo) {
		pageInfo.setTotalCount(accessLogDao.findHistoryListRowCount(accessLog,pageInfo).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "asc": pageInfo.getOrderDirection());
		pageInfo.setList(accessLogDao.findHistoryListPage(accessLog,pageInfo));
        return pageInfo;
	}
	@Override
	public AccessLog findByVersion(Integer version) {
		return accessLogDao.findByVersion(version);
	}
	@Override
	public Page<AccessLog> queryByKey(String queryKey, Page<AccessLog> pageInfo) {
		int countRecord = accessLogDao.findRowCount(queryKey).intValue();
		Page<AccessLog> page = new Page<AccessLog>(pageInfo == null ? 0 : pageInfo.getPageNum(), countRecord, pageInfo.getNumPerPage());
		List<AccessLog> accessLogList = accessLogDao.findByKey(pageInfo,queryKey);
		page.setList(accessLogList);
		return page;
	}
	@Override
	public List<AccessLog> queryById(Integer[] ids) {
		return accessLogDao.findById(ids);
	}
}