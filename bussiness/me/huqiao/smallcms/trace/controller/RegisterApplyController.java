package me.huqiao.smallcms.trace.controller;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import me.huqiao.smallcms.common.controller.BaseController;
import me.huqiao.smallcms.common.entity.CommonFile;
import me.huqiao.smallcms.common.entity.Select2;
import me.huqiao.smallcms.common.entity.propertyeditor.CommonFileEditor;
import me.huqiao.smallcms.common.service.ICommonFileService;
import me.huqiao.smallcms.trace.entity.RegisterApply;
import me.huqiao.smallcms.trace.entity.enumtype.RegisterApplyStatus;
import me.huqiao.smallcms.trace.service.IRegisterApplyService;
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
 * 注册申请控制器
 * @author NOVOTS
 * @version Version 1.0
 */
@Controller
@RequestMapping("registerApply")
public class RegisterApplyController  extends BaseController {
   /**注册申请服务*/
    @Resource
    private IRegisterApplyService registerApplyService;
 /**
  * 注册属性编辑器
  * @param binder 数据绑定器
  */
    @InitBinder
	public void initPropEditor(WebDataBinder binder){
         binder.registerCustomEditor(CommonFile.class,new CommonFileEditor(commonFileService));
	}
    //复杂关联关系的Service
@Resource private ICommonFileService commonFileService;
		/**
		  * 初始化ModelAttribute
		  * @param manageKey md5管理ID （非空时自动加载指定对象）
		  * @param model 页面model对象
		  * @return RegisterApply 注册申请对象
		  */
		@ModelAttribute(value="registerApply")
		public RegisterApply initModelAttribute(@RequestParam(value = "manageKey", required = false) String manageKey, Model model) {
		RegisterApply registerApply = null;
		if (manageKey == null ||manageKey.equals("")) {
			registerApply = new RegisterApply();
		} else {
			registerApply =  registerApplyService.getEntityByProperty(RegisterApply.class,"manageKey", manageKey);
			if (registerApply==null) {
				registerApply=new RegisterApply();
			}
		}
		return registerApply;
	}
    /**
     * 注册申请分页查询
     * @param request HttpServletRequest对象
     * @param registerApply 注册申请查询对象
     * @param pageInfo 分页查询对象
     * 
     */
    @RequestMapping(value="/list")
    public void list(HttpServletRequest request,RegisterApply registerApply,Page pageInfo) {
        Page<RegisterApply> registerApplyPage = registerApplyService.getListPage(registerApply,pageInfo);
        request.setAttribute("pageBean", registerApplyPage);
		listFormParam(request,registerApply,pageInfo);
    }
 	/**
     * 为注册申请分页查询表单准备数据
     * @param request HttpServletRequest对象
     * @param registerApply 注册申请查询对象
     * @param pageInfo 分页查询对象
     * 
     */
	public void listFormParam(HttpServletRequest request,RegisterApply registerApply,Page pageInfo){
		//复杂关联关系数据准备
		request.setAttribute("registerApplyStatusMap",RegisterApplyStatus.registerApplyStatusMap);
	}
    /**
     * 添加注册申请页面
     * @param request HttpServletRequest对象
     * @param callBack  回调函数名称
     *
     */
    @RequestMapping(value="/add",method=RequestMethod.GET)
    public void addUI(HttpServletRequest request,@RequestParam(value = "callBack",required = false)String callBack) {
    	//复杂关联关系数据准备
    	request.setAttribute("registerApplyStatusMap",RegisterApplyStatus.registerApplyStatusMap);
		//clearTempDataList(request.getSession(),"registerApply");
		request.setAttribute("callBack", callBack);
    }
    /**
     * 添加注册申请
     * @param request HttpServletRequest对象
     * @param registerApply 要添加的对象
     * @return JsonResult 操作结果
     */
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult add(HttpServletRequest request,
	@Valid @ModelAttribute("registerApply") RegisterApply registerApply,
	@RequestParam(value = "callBack",required = false)String callBack,
	BindingResult result) {
    	JsonResult jsonResult = new JsonResult();
    	//默认系统时间类型保存
	/*
		#ONE_TO_MANY_VALUE_SAVE_ADD
	*/
	    //保存多对多关联关系
		registerApply.setLicense(parseFilee(request,"licenseKeys",null));
		registerApply.setLawPersonIDCard(parseFilee(request,"lawPersonIDCardKeys",null));
	//保持一对多关联关系
		registerApply.otherQualificationsListToSet(request);
	registerApply.setManageKey(Md5Util.getManageKey());
    	registerApplyService.add(registerApply);
        jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.add.success"));
        return jsonResult;
    }
    /**
     * 修改注册申请页面
     * @param registerApply 需要修改的对象实体
     * @param request HttpServletRequest请求对象
     * 
     */
    @RequestMapping(value="/update",method=RequestMethod.GET)
	public void updateUI(@ModelAttribute(value="registerApply") RegisterApply registerApply,HttpServletRequest request) {
	request.setAttribute("tempBean", registerApply);
    	//复杂关联关系数据准备
		request.setAttribute("registerApplyStatusMap",RegisterApplyStatus.registerApplyStatusMap);
		//clearTempDataList(request.getSession(),"registerApply");
    }
    /**
     *  修改注册申请 
     * @param registerApply 待修改的实体对象
     * @param request HttpServletRequest对象
     * @return JsonResult 操作结果
     *
     */
    @RequestMapping(value="/update",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult update(HttpServletRequest request,
	@ModelAttribute(value="registerApply") RegisterApply registerApply,
	BindingResult result) {
    	JsonResult jsonResult = new JsonResult();
    	if(!validate(jsonResult,result)){
    		return jsonResult;
    	}
	    //保存多对多关联关系
		String oldKey = null;
		if(registerApply.getLicense()!=null){
			oldKey = registerApply.getLicense().getManageKey();
		}
		registerApply.setLicense(parseFilee(request,"licenseKeys",oldKey));
		String oldKey2 = null;
		if(registerApply.getLawPersonIDCard()!=null){
			oldKey2 = registerApply.getLawPersonIDCard().getManageKey();
		}
		registerApply.setLawPersonIDCard(parseFilee(request,"lawPersonIDCardKeys",oldKey2));
		//保持一对多关联关系
		registerApply.otherQualificationsListToSet(request);
        registerApplyService.update(registerApply);
	// jsonResult.setNavTabId(rel);
        jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.update.success"));
        return jsonResult;
    }
	/**
	 *  查看注册申请页面
     * @param registerApply 需要查看的实体对象
     * @param request HttpServletRequest对象
     * 
     */
    @RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detail(@ModelAttribute(value="registerApply") RegisterApply registerApply,HttpServletRequest request) {
	request.setAttribute("tempBean", registerApply);
    	//复杂关联关系数据准备
        listFormParam(request,registerApply,null);
    }
	/**
     * 删除单个注册申请对象
     * @param request HttpServletRequest对象
     * @param registerApply 待删除对象
     * @return JsonResult 操作结果
     * 
     */
    @RequestMapping(value="/delete",method=RequestMethod.GET)
    @ResponseBody
    public JsonResult delete(HttpServletRequest request,@ModelAttribute RegisterApply registerApply) {
        JsonResult jsonResult = new JsonResult();
        jsonResult.setCallbackType("");
        try {
        	registerApplyService.delete(registerApply);
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
    	RegisterApply registerApply = null;
		JsonResult jsonResult = new JsonResult();
    	for(String manageKey : manageKeys){
			 try {
    			registerApply = registerApplyService.getEntityByProperty(RegisterApply.class,"manageKey",manageKey);
		markFileAsUnuse(registerApply.getLicense());
		markFileAsUnuse(registerApply.getLawPersonIDCard());
    			registerApplyService.delete(registerApply);
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
	  *@param manageKeys manageKey ���组
	  *@return String 返回jsp页面路径
      */
	@RequestMapping(value = "/selectList",params = "htmlType")
	public String selectListWithHtml(HttpServletRequest request,
			@RequestParam(value = "manageKey",required = false)String[] manageKeys
			){
		List<RegisterApply> registerApplys = new ArrayList<RegisterApply>();
		if(manageKeys!=null){
			for(String manageKey : manageKeys){
				RegisterApply temp_registerApply = registerApplyService.getEntityByProperty(RegisterApply.class, "manageKey", manageKey);
				if(temp_registerApply!=null && !registerApplys.contains(temp_registerApply)){
					registerApplys.add(temp_registerApply);
				}
			}
		}
		request.setAttribute("showCheckBox",request.getParameter("showCheckBox"));
		request.setAttribute("keyName",request.getParameter("keyName"));
		request.setAttribute("registerApplys",registerApplys);
		return "registerApply/select-list-html";
	}
	/**
	 *  历史记录列表
     * @param request HttpServletRequest对象
	 * @param registerApply 查询对象
     * @param pageInfo 分页查询对象
     * @return String 显示页面路径
     * 
	@RequestMapping(value = "history",params="list")
	public String historyList(HttpServletRequest request,RegisterApply registerApply,Page pageInfo){
		Page<HistoryRecord<RegisterApply>> registerApplyPage = registerApplyService.getHistoryListPage(registerApply, pageInfo);
		request.setAttribute("pageBean", registerApplyPage);
		request.setAttribute("manageKey", registerApply.getManageKey());
	    return "registerApply/history-list";
	} */
	/**
	 * 查看历史记录
     * @param request HttpServletRequest对象
     * @param version 版本号
     * @return String 显示页面路径
     *
	@RequestMapping(value = "history",params="view")
	public String historyView(HttpServletRequest request,@RequestParam(value = "version")Integer version){
		RegisterApply registerApply = registerApplyService.findByVersion(version);
		RegisterApply preRegisterApply = (RegisterApply)registerApplyService.findByPreVersion(RegisterApply.class,registerApply.getManageKey(),version);
		if(preRegisterApply!=null && preRegisterApply.getManageKey().equals(registerApply.getManageKey())){
			Map<String,CheckResult> checkResult = BeanPropUtil.propValueCheck(preRegisterApply, registerApply);
			request.setAttribute("checkResult", checkResult);
		}
		request.setAttribute("tempBean", registerApply);
		request.setAttribute("showOk", "no");
		request.setAttribute("historyView", true);
		return "registerApply/detail";
	}*/
	/**
	 * 根据关键字获取注册申请select2对象
	 * @param queryKey 查询关键字
	 * @param pageInfo 查询分页信息
	 * @param response HttpServletResponse对象
	 * @return Select2<RegisterApply> 注册申请Select2对象
	 */
	@RequestMapping(value="/select2Query")
	@ResponseBody 
	public Select2<RegisterApply> select2Query(String queryKey,Page<RegisterApply> pageInfo, HttpServletResponse response) {
		Page<RegisterApply> page = registerApplyService.queryByKey(queryKey, pageInfo);
		Select2<RegisterApply> select2 = new Select2<RegisterApply>();
		select2.setTotal_count(page.getTotalCount());
		select2.setItems(page.getList());
		return select2;
	}
	/**
	 * 查找多个注册申请
	 * @param ids id数组
	 * @param response HttpServletResponse 对象
	 * @return List<RegisterApply> 注册申请列表
	 */
	@RequestMapping(value="/queryById")
	@ResponseBody
public List<RegisterApply> queryById(Integer[] ids,HttpServletResponse response) {
		List<RegisterApply> registerApplyList = registerApplyService.queryById(ids);
		return registerApplyList;
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
			@ModelAttribute(value="registerApply") RegisterApply registerApply,
			@RequestParam(value= "trTarget") String trTarget,
			@RequestParam(value= "trIndex") Integer trIndex,
			@RequestParam(value = "propName") String propName,
			HttpServletRequest request) {
		addUI(request, null);
		request.setAttribute("tempBean",registerApply);
		request.setAttribute("trTarget", trTarget);
		request.setAttribute("trIndex", trIndex);
		request.setAttribute("propName", propName);
		return "registerApply/tab-add-form";
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
			@ModelAttribute(value="registerApply") RegisterApply registerApply,
			@RequestParam(value= "trTarget") String trTarget,
			@RequestParam(value= "trIndex") Integer trIndex,
			@RequestParam(value = "propName") String propName,
			HttpServletRequest request) {
		addUI(request, null);
		request.setAttribute("tempBean",registerApply);
		request.setAttribute("trTarget", trTarget);
		request.setAttribute("trIndex", trIndex);
		request.setAttribute("propName", propName);
		return "registerApply/tab-detail-form";
	}
}