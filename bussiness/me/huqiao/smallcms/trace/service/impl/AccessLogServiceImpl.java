package me.huqiao.smallcms.trace.service.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import me.huqiao.smallcms.common.service.impl.BaseServiceImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.sys.entity.User;
import me.huqiao.smallcms.trace.dao.IAccessLogDao;
import me.huqiao.smallcms.trace.entity.AccessLog;
import me.huqiao.smallcms.trace.service.IAccessLogService;
import me.huqiao.smallcms.util.Md5Util;
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
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "desc": pageInfo.getOrderDirection());
		pageInfo.setList(accessLogDao.findListPage(accessLog,pageInfo));
        return pageInfo;
    }
	@Override
	public Page<HistoryRecord<AccessLog>> getHistoryListPage(AccessLog accessLog, Page pageInfo) {
		pageInfo.setTotalCount(accessLogDao.findHistoryListRowCount(accessLog,pageInfo).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "desc": pageInfo.getOrderDirection());
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
	@Override
	public boolean addLog(String ip, String sessionId, String productId,String username, String page,String agent) {
		AccessLog log = new AccessLog();
		log.setAccessTime(new Date());
		log.setIp(ip);
		log.setManageKey(Md5Util.getManageKey());
		log.setPage(page);
		log.setProductId(productId);
		log.setSessionID(sessionId);
		log.setUserID(username);
		log.setUserAgent(agent);
		log.parsePositionInfos();
		List<AccessLog> existedList = getByProperties(AccessLog.class, new String[]{"sessionID","page"}, new Object[]{sessionId,page}, null, 2);
		boolean addQueryCount = existedList.size()==0;
		add(log);
		return addQueryCount;
	}
	@Override
	public List<RegionStat> regionStat(Date start, Date end, User user,
			String productId) {
		List<RegionStat> list = accessLogDao.regionStat(start,end,user,productId);
		Map<String,RegionStat> map = new HashMap<String,RegionStat>();
		for(RegionStat stat:list){
			map.put(stat.getId(), stat);
		}
		List<RegionStat> adds = new ArrayList<RegionStat>();
		for(Map.Entry<String,String> entry : RegionStat.nameIdMap.entrySet()){
			RegionStat stat = map.get(entry.getValue());
			if(stat==null){
				stat = new RegionStat(entry.getValue(), 0);
				stat.setId(entry.getValue());
				stat.setName(entry.getKey());
				adds.add(stat);
			}
		}
		list.addAll(adds);
		return list;
	}
	@Override
	public PVSummary pvStat(Date start, Date end, User user,
			String productId) {
		return new PVSummary(accessLogDao.pvStat(start, end, user, productId)).calcute(start, end);
	}
	@Override
	public PVSummary uvStat(Date start, Date end, User user,
			String productId) {
		return new PVSummary(accessLogDao.uvStat(start, end, user, productId)).calcute(start, end);
	}
}