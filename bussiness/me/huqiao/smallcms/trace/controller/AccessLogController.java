package me.huqiao.smallcms.trace.controller;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import me.huqiao.smallcms.common.controller.BaseController;
import me.huqiao.smallcms.common.entity.Select2;
import me.huqiao.smallcms.trace.entity.AccessLog;
import me.huqiao.smallcms.trace.service.IAccessLogService;
import me.huqiao.smallcms.util.Md5Util;
import me.huqiao.smallcms.util.web.JsonResult;
import me.huqiao.smallcms.util.web.Page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 访问日志控制器
 * @author NOVOTS
 * @version Version 1.0
 */
@Controller
@RequestMapping("accessLog")
public class AccessLogController  extends BaseController {
   /**访问日志服务*/
    @Resource
    private IAccessLogService accessLogService;
 /**
  * 注册属性编辑器
  * @param binder 数据绑定器
  */
    @InitBinder
	public void initPropEditor(WebDataBinder binder){
	}
    //复杂关联关系的Service
		/**
		  * 初始化ModelAttribute
		  * @param manageKey md5管理ID （非空时自动加载指定对象）
		  * @param model 页面model对象
		  * @return AccessLog 访问日志对象
		  */
		@ModelAttribute(value="accessLog")
		public AccessLog initModelAttribute(@RequestParam(value = "manageKey", required = false) String manageKey, Model model) {
		AccessLog accessLog = null;
		if (manageKey == null ||manageKey.equals("")) {
			accessLog = new AccessLog();
		} else {
			accessLog =  accessLogService.getEntityByProperty(AccessLog.class,"manageKey", manageKey);
			if (accessLog==null) {
				accessLog=new AccessLog();
			}
		}
		return accessLog;
	}
    /**
     * 访问日志分页查询
     * @param request HttpServletRequest对象
     * @param accessLog 访问日志查询对象
     * @param pageInfo 分页查询对象
     * 
     */
    @RequestMapping(value="/list")
    public void list(HttpServletRequest request,AccessLog accessLog,Page pageInfo) {
        Page<AccessLog> accessLogPage = accessLogService.getListPage(accessLog,pageInfo);
        request.setAttribute("pageBean", accessLogPage);
		listFormParam(request,accessLog,pageInfo);
    }
 	/**
     * 为访问日志分页查询表单准备数据
     * @param request HttpServletRequest对象
     * @param accessLog 访问日志查询对象
     * @param pageInfo 分页查询对象
     * 
     */
	public void listFormParam(HttpServletRequest request,AccessLog accessLog,Page pageInfo){
		//复杂关联关系数据准备
	}
    /**
     * 添加访问日志页面
     * @param request HttpServletRequest对象
     * @param callBack  回调函数名称
     *
     */
    @RequestMapping(value="/add",method=RequestMethod.GET)
    public void addUI(HttpServletRequest request,@RequestParam(value = "callBack",required = false)String callBack) {
    	//复杂关联关系数据准备
		//clearTempDataList(request.getSession(),"accessLog");
		request.setAttribute("callBack", callBack);
    }
    /**
     * 添加访问日志
     * @param request HttpServletRequest对象
     * @param accessLog 要添加的对象
     * @return JsonResult 操作结果
     */
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult add(HttpServletRequest request,
	@Valid @ModelAttribute("accessLog") AccessLog accessLog,
	@RequestParam(value = "callBack",required = false)String callBack,
	BindingResult result) {
    	JsonResult jsonResult = new JsonResult();
    	//默认系统时间类型保存
	/*
		#ONE_TO_MANY_VALUE_SAVE_ADD
	*/
	    //保存多对多关联关系
	//保持一对多关联关系
	accessLog.setManageKey(Md5Util.getManageKey());
    	accessLogService.add(accessLog);
        jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.add.success"));
        return jsonResult;
    }
    /**
     * 修改访问日志页面
     * @param accessLog 需要修改的对象实体
     * @param request HttpServletRequest请求对象
     * 
     */
    @RequestMapping(value="/update",method=RequestMethod.GET)
	public void updateUI(@ModelAttribute(value="accessLog") AccessLog accessLog,HttpServletRequest request) {
	request.setAttribute("tempBean", accessLog);
    	//复杂关联关系数据准备
	//clearTempDataList(request.getSession(),"accessLog");
    }
    /**
     *  修改访问日志 
     * @param accessLog 待修改的实体对象
     * @param request HttpServletRequest对象
     * @return JsonResult 操作结果
     *
     */
    @RequestMapping(value="/update",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult update(HttpServletRequest request,
	@ModelAttribute(value="accessLog") AccessLog accessLog,
	BindingResult result) {
    	JsonResult jsonResult = new JsonResult();
    	if(!validate(jsonResult,result)){
    		return jsonResult;
    	}
	    //保存多对多关联关系
		//保持一对多关联关系
        accessLogService.update(accessLog);
	// jsonResult.setNavTabId(rel);
        jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.update.success"));
        return jsonResult;
    }
	/**
	 *  查看访问日志页面
     * @param accessLog 需要查看的实体对象
     * @param request HttpServletRequest对象
     * 
     */
    @RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detail(@ModelAttribute(value="accessLog") AccessLog accessLog,HttpServletRequest request) {
	request.setAttribute("tempBean", accessLog);
    	//复杂关联关系数据准备
        listFormParam(request,accessLog,null);
    }
	/**
     * 删除单个访问日志对象
     * @param request HttpServletRequest对象
     * @param accessLog 待删除对象
     * @return JsonResult 操作结果
     * 
     */
    @RequestMapping(value="/delete",method=RequestMethod.GET)
    @ResponseBody
    public JsonResult delete(HttpServletRequest request,@ModelAttribute AccessLog accessLog) {
        JsonResult jsonResult = new JsonResult();
        jsonResult.setCallbackType("");
        try {
        	accessLogService.delete(accessLog);
		} catch (RuntimeException re) {
			jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.delete.inuse"));
			return jsonResult;
		}catch (Exception e) {
			jsonResult.setMessage(e.toString());
			return jsonResult;
		}
	//jsonResult.setNavTabId(rel);
        jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.delete.success"));
        return jsonResult;
    }
    /**
     * 删除多个对象
     * @param manageKeys 唯一识别ID数组
     * @return JsonResult 操作结果
     * 
     */
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
	public JsonResult batchDelete(HttpServletRequest request,@RequestParam("manageKeys") String[] manageKeys) {
    	AccessLog accessLog = null;
		JsonResult jsonResult = new JsonResult();
    	for(String manageKey : manageKeys){
			 try {
    			accessLog = accessLogService.getEntityByProperty(AccessLog.class,"manageKey",manageKey);
    			accessLogService.delete(accessLog);
			}catch (RuntimeException re) {
				jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.delete.inuse"));
				return jsonResult;
			}catch (Exception e) {
				jsonResult.setMessage(e.toString());
				return jsonResult;
			}
    	}
		jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.delete.success"));
    	return jsonResult;
    } 
	 /**
	  *选择对象返回html
      *@param request HttpServletRequest对象
	  *@param manageKeys manageKey 数组
	  *@return String 返回jsp页面路径
      */
	@RequestMapping(value = "/selectList",params = "htmlType")
	public String selectListWithHtml(HttpServletRequest request,
			@RequestParam(value = "manageKey",required = false)String[] manageKeys
			){
		List<AccessLog> accessLogs = new ArrayList<AccessLog>();
		if(manageKeys!=null){
			for(String manageKey : manageKeys){
				AccessLog temp_accessLog = accessLogService.getEntityByProperty(AccessLog.class, "manageKey", manageKey);
				if(temp_accessLog!=null && !accessLogs.contains(temp_accessLog)){
					accessLogs.add(temp_accessLog);
				}
			}
		}
		request.setAttribute("showCheckBox",request.getParameter("showCheckBox"));
		request.setAttribute("keyName",request.getParameter("keyName"));
		request.setAttribute("accessLogs",accessLogs);
		return "accessLog/select-list-html";
	}
	/**
	 *  历史记录列表
     * @param request HttpServletRequest对象
	 * @param accessLog 查询对象
     * @param pageInfo 分页查询对象
     * @return String 显示页面路径
     * 
	@RequestMapping(value = "history",params="list")
	public String historyList(HttpServletRequest request,AccessLog accessLog,Page pageInfo){
		Page<HistoryRecord<AccessLog>> accessLogPage = accessLogService.getHistoryListPage(accessLog, pageInfo);
		request.setAttribute("pageBean", accessLogPage);
		request.setAttribute("manageKey", accessLog.getManageKey());
	    return "accessLog/history-list";
	} */
	/**
	 * 查看历史记录
     * @param request HttpServletRequest对象
     * @param version 版本号
     * @return String 显示页面路径
     *
	@RequestMapping(value = "history",params="view")
	public String historyView(HttpServletRequest request,@RequestParam(value = "version")Integer version){
		AccessLog accessLog = accessLogService.findByVersion(version);
		AccessLog preAccessLog = (AccessLog)accessLogService.findByPreVersion(AccessLog.class,accessLog.getManageKey(),version);
		if(preAccessLog!=null && preAccessLog.getManageKey().equals(accessLog.getManageKey())){
			Map<String,CheckResult> checkResult = BeanPropUtil.propValueCheck(preAccessLog, accessLog);
			request.setAttribute("checkResult", checkResult);
		}
		request.setAttribute("tempBean", accessLog);
		request.setAttribute("showOk", "no");
		request.setAttribute("historyView", true);
		return "accessLog/detail";
	}*/
	/**
	 * 根据关键字获取访问日志select2对象
	 * @param queryKey 查询关键字
	 * @param pageInfo 查询分页信息
	 * @param response HttpServletResponse对象
	 * @return Select2<AccessLog> 访问日志Select2对象
	 */
	@RequestMapping(value="/select2Query")
	@ResponseBody 
	public Select2<AccessLog> select2Query(String queryKey,Page<AccessLog> pageInfo, HttpServletResponse response) {
		Page<AccessLog> page = accessLogService.queryByKey(queryKey, pageInfo);
		Select2<AccessLog> select2 = new Select2<AccessLog>();
		select2.setTotal_count(page.getTotalCount());
		select2.setItems(page.getList());
		return select2;
	}
	/**
	 * 查找多个访问日志
	 * @param ids id数组
	 * @param response HttpServletResponse 对象
	 * @return List<AccessLog> 访问日志列表
	 */
	@RequestMapping(value="/queryById")
	@ResponseBody
public List<AccessLog> queryById(Integer[] ids,HttpServletResponse response) {
		List<AccessLog> accessLogList = accessLogService.queryById(ids);
		return accessLogList;
	}
	/**
	 * tab页添加表单
	 * @param trTarget tr的target值
	 * @param trIndex tr的序号
     * @param propName 表单元素name前缀
	 * @return String jsp路径
	 */
	@RequestMapping(value = "/tabAddForm")
public String tabAddForm(
			@ModelAttribute(value="accessLog") AccessLog accessLog,
			@RequestParam(value= "trTarget") String trTarget,
			@RequestParam(value= "trIndex") Integer trIndex,
			@RequestParam(value = "propName") String propName,
			HttpServletRequest request) {
		addUI(request, null);
		request.setAttribute("tempBean",accessLog);
		request.setAttribute("trTarget", trTarget);
		request.setAttribute("trIndex", trIndex);
		request.setAttribute("propName", propName);
		return "accessLog/tab-add-form";
	}
/**
	 * tab页查看详情页面
	 * @param trTarget tr的target值
	 * @param trIndex tr的序号
     * @param propName 表单元素name前缀
	 * @return String jsp路径
	 */
	@RequestMapping(value = "/tabDetailForm")
	public String tabDetailForm(
			@ModelAttribute(value="accessLog") AccessLog accessLog,
			@RequestParam(value= "trTarget") String trTarget,
			@RequestParam(value= "trIndex") Integer trIndex,
			@RequestParam(value = "propName") String propName,
			HttpServletRequest request) {
		addUI(request, null);
		request.setAttribute("tempBean",accessLog);
		request.setAttribute("trTarget", trTarget);
		request.setAttribute("trIndex", trIndex);
		request.setAttribute("propName", propName);
		return "accessLog/tab-detail-form";
	}
}