package me.huqiao.smallcms.trace.service.impl;
import java.util.List;

import javax.annotation.Resource;

import me.huqiao.smallcms.common.service.impl.BaseServiceImpl;
import me.huqiao.smallcms.history.entity.HistoryRecord;
import me.huqiao.smallcms.trace.dao.IRegisterApplyDao;
import me.huqiao.smallcms.trace.entity.RegisterApply;
import me.huqiao.smallcms.trace.service.IRegisterApplyService;
import me.huqiao.smallcms.util.web.Page;

import org.springframework.stereotype.Service;
/**
 * 注册申请Service接口实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Service
public class RegisterApplyServiceImpl extends BaseServiceImpl<RegisterApply> implements IRegisterApplyService {
    /**注册申请DAO对象*/
    @Resource
    private IRegisterApplyDao registerApplyDao;
    @Override
    public Page<RegisterApply> getListPage(RegisterApply registerApply,Page pageInfo) {
      	pageInfo.setTotalCount(registerApplyDao.findListRowCount(registerApply).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "desc": pageInfo.getOrderDirection());
		pageInfo.setList(registerApplyDao.findListPage(registerApply,pageInfo));
        return pageInfo;
    }
	@Override
	public Page<HistoryRecord<RegisterApply>> getHistoryListPage(RegisterApply registerApply, Page pageInfo) {
		pageInfo.setTotalCount(registerApplyDao.findHistoryListRowCount(registerApply,pageInfo).intValue());
		pageInfo.setOrderField(pageInfo.getOrderField() == null ? "id": pageInfo.getOrderField());
		pageInfo.setOrderDirection(pageInfo.getOrderDirection() == null ? "desc": pageInfo.getOrderDirection());
		pageInfo.setList(registerApplyDao.findHistoryListPage(registerApply,pageInfo));
        return pageInfo;
	}
	@Override
	public RegisterApply findByVersion(Integer version) {
		return registerApplyDao.findByVersion(version);
	}
	@Override
	public Page<RegisterApply> queryByKey(String queryKey, Page<RegisterApply> pageInfo) {
		int countRecord = registerApplyDao.findRowCount(queryKey).intValue();
		Page<RegisterApply> page = new Page<RegisterApply>(pageInfo == null ? 0 : pageInfo.getPageNum(), countRecord, pageInfo.getNumPerPage());
		List<RegisterApply> registerApplyList = registerApplyDao.findByKey(pageInfo,queryKey);
		page.setList(registerApplyList);
		return page;
	}
	@Override
	public List<RegisterApply> queryById(Integer[] ids) {
		return registerApplyDao.findById(ids);
	}
}