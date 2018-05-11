package me.huqiao.smallcms.trace.service.impl;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import me.huqiao.smallcms.common.service.impl.BaseServiceImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.dao.IOperateLogDao;
import me.huqiao.smallcms.trace.entity.OperateLog;
import me.huqiao.smallcms.trace.service.IOperateLogService;
import me.huqiao.smallcms.util.DateUtil;
import me.huqiao.smallcms.util.Md5Util;
import me.huqiao.smallcms.util.web.Page;

import org.springframework.stereotype.Service;
/**
 * 访问日志Service接口实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Service
public class OperateLogServiceImpl extends BaseServiceImpl<OperateLog> implements IOperateLogService {
    /**访问日志DAO对象*/
    @Resource
    private IOperateLogDao operateLogDao;
    @Override
    public Page<OperateLog> getListPage(OperateLog operateLog,Page pageInfo) {
      	pageInfo.setTotalCount(operateLogDao.findListRowCount(operateLog).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "asc": pageInfo.getOrderDirection());
		pageInfo.setList(operateLogDao.findListPage(operateLog,pageInfo));
        return pageInfo;
    }
	@Override
	public Page<HistoryRecord<OperateLog>> getHistoryListPage(OperateLog operateLog, Page pageInfo) {
		pageInfo.setTotalCount(operateLogDao.findHistoryListRowCount(operateLog,pageInfo).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "asc": pageInfo.getOrderDirection());
		pageInfo.setList(operateLogDao.findHistoryListPage(operateLog,pageInfo));
        return pageInfo;
	}
	@Override
	public OperateLog findByVersion(Integer version) {
		return operateLogDao.findByVersion(version);
	}
	@Override
	public Page<OperateLog> queryByKey(String queryKey, Page<OperateLog> pageInfo) {
		int countRecord = operateLogDao.findRowCount(queryKey).intValue();
		Page<OperateLog> page = new Page<OperateLog>(pageInfo == null ? 0 : pageInfo.getPageNum(), countRecord, pageInfo.getNumPerPage());
		List<OperateLog> operateLogList = operateLogDao.findByKey(pageInfo,queryKey);
		page.setList(operateLogList);
		return page;
	}
	@Override
	public List<OperateLog> queryById(Integer[] ids) {
		return operateLogDao.findById(ids);
	}
	@Override
	public void addLog(String type, String ip, String operate, String description) {
		OperateLog log = new OperateLog();
		log.setOperateTime(new Date());
		log.setOperate(operate);
		log.setDescription(description);
		log.setType(type);
		log.setIp(ip);
		log.setManageKey(Md5Util.getManageKey());
		add(log);
	}
	@Override
	public boolean hasCodeCreated(String number,Long secondsAgo) {
		return operateLogDao.existedBefore(number,DateUtil.datePlus(new Date(), Calendar.SECOND, -secondsAgo.intValue()));
	}
	
	@Override
	public boolean hasCodeCreated(String number,Long secondsAgo,String code) {
		return operateLogDao.existedBefore(number,DateUtil.datePlus(new Date(), Calendar.SECOND, -secondsAgo.intValue()),code);
	}
	
	@Override
	public boolean ipValidate(String ip, Integer ipLimitOfDay) {
		Long count = operateLogDao.countForIP(ip,DateUtil.getBeginDateOfDate(new Date()));
		return count <= ipLimitOfDay;
	}
}