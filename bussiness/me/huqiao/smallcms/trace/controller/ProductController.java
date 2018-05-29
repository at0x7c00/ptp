package me.huqiao.smallcms.trace.controller;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
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
import me.huqiao.smallcms.sys.entity.User;
import me.huqiao.smallcms.sys.entity.enumtype.YesNo;
import me.huqiao.smallcms.sys.entity.propertyeditor.UserEditor;
import me.huqiao.smallcms.sys.service.IUserService;
import me.huqiao.smallcms.trace.entity.Category;
import me.huqiao.smallcms.trace.entity.Product;
import me.huqiao.smallcms.trace.entity.enumtype.ProductStatus;
import me.huqiao.smallcms.trace.entity.propertyeditor.CategoryEditor;
import me.huqiao.smallcms.trace.service.ICategoryService;
import me.huqiao.smallcms.trace.service.IProductService;
import me.huqiao.smallcms.trace.util.ShortUrlGenerator;
import me.huqiao.smallcms.util.Md5Util;
import me.huqiao.smallcms.util.StringUtil;
import me.huqiao.smallcms.util.web.JsonResult;
import me.huqiao.smallcms.util.web.Page;

import org.springframework.beans.factory.annotation.Value;
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
 * 商品控制器
 * @author NOVOTS
 * @version Version 1.0
 */
@Controller
@RequestMapping("product")
public class ProductController  extends BaseController {
   /**商品服务*/
    @Resource
    private IProductService productService;
    @Resource
    private ICommonFileService fileService;
    @Value("${system.rooturl}")
    private String systemRootUrl;

 /**
  * 注册属性编辑器
  * @param binder 数据绑定器
  */
    @InitBinder
	public void initPropEditor(WebDataBinder binder){
         binder.registerCustomEditor(Category.class,new CategoryEditor(categoryService));
         binder.registerCustomEditor(CommonFile.class,new CommonFileEditor(commonFileService));
         binder.registerCustomEditor(CommonFile.class,new CommonFileEditor(commonFileService));
         binder.registerCustomEditor(User.class,new UserEditor(userService));
	}
    //复杂关联关系的Service
@Resource private ICategoryService categoryService;
@Resource private ICommonFileService commonFileService;
@Resource private IUserService userService;
		/**
		  * 初始化ModelAttribute
		  * @param manageKey md5管理ID （非空时自动加载指定对象）
		  * @param model 页面model对象
		  * @return Product 商品对象
		  */
		@ModelAttribute(value="product")
		public Product initModelAttribute(@RequestParam(value = "manageKey", required = false) String manageKey, Model model) {
		Product product = null;
		if (manageKey == null ||manageKey.equals("")) {
			product = new Product();
		} else {
			product =  productService.getEntityByProperty(Product.class,"manageKey", manageKey);
			if (product==null) {
				product=new Product();
			}
		}
		return product;
	}
    /**
     * 商品分页查询
     * @param request HttpServletRequest对象
     * @param product 商品查询对象
     * @param pageInfo 分页查询对象
     * 
     */
    @RequestMapping(value="/list")
    public void list(HttpServletRequest request,Product product,Page pageInfo) {
        Page<Product> productPage = productService.getListPage(product,pageInfo);
        request.setAttribute("pageBean", productPage);
		listFormParam(request,product,pageInfo);
    }
    @RequestMapping(value="/myList")
    public String myList(HttpServletRequest request,Product product,Page pageInfo) {
    	product.setCreator(getCurrentUser());
    	list(request,product,pageInfo);
    	request.setAttribute("my", true);
    	return "product/list";
    }
 	/**
     * 为商品分页查询表单准备数据
     * @param request HttpServletRequest对象
     * @param product 商���查询对象
     * @param pageInfo 分页查询对象
     * 
     */
	public void listFormParam(HttpServletRequest request,Product product,Page pageInfo){
    	List<Category> topCategories = categoryService.getByProperties(Category.class, new String[] {"parent" }, new Object[] {null}, "orderNum", null);
		List<Category> categoryList = new ArrayList<Category>();
		categoryService.tree(topCategories,"",categoryList,null);
		request.setAttribute("categoryList", categoryList);
		
		request.setAttribute("productStatusMap",ProductStatus.productStatusMap);
		request.setAttribute("userList",userService.findAll(User.class));
	}
    /**
     * 添加商品页面
     * @param request HttpServletRequest对象
     * @param callBack  回调函数名称
     *
     */
    @RequestMapping(value="/add",method=RequestMethod.GET)
    public void addUI(HttpServletRequest request,@RequestParam(value = "callBack",required = false)String callBack) {
    	List<Category> topCategories = categoryService.getByProperties(Category.class, new String[] {"status","parent" }, new Object[] {YesNo.Yes,null}, "orderNum", null);
		List<Category> categoryList = new ArrayList<Category>();
		categoryService.tree(topCategories,"",categoryList,null);
		request.setAttribute("categoryList", categoryList);
    	
		request.setAttribute("productStatusMap",ProductStatus.productStatusMap);
		List<User> userList = userService.getByProperties(User.class,null,null,null,null);
		request.setAttribute("userList",userList);
		request.setAttribute("callBack", callBack);
    }
    
    @RequestMapping(value="/myAdd",method=RequestMethod.GET)
    public String myAddUI(HttpServletRequest request,@RequestParam(value = "callBack",required = false)String callBack) {
    	addUI(request,callBack);
    	request.setAttribute("my", true);
    	return "product/add";
    }
    /**
     * 添加商品
     * @param request HttpServletRequest对象
     * @param product 要添加的对象
     * @return JsonResult 操作结果
     */
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult add(HttpServletRequest request,
	@Valid @ModelAttribute("product") Product product,
	@RequestParam(value = "callBack",required = false)String callBack,
	BindingResult result) {
    	JsonResult jsonResult = new JsonResult();
	    //保存多对多关联关系
		product.setPicture(parseFilee(request,"pictureKeys",null));
		product.setQrCode(parseFilee(request,"qrCodeKeys",null));
		
		//保持一对多关联关系
		List<CommonFile> checkPictures = parseFilee(request.getParameterValues("checkPicturesKeys"),product.getCheckPicturesKeys().split(","));
		if(product.getCheckPictures()==null){
			product.setCheckPictures(new HashSet<CommonFile>());
		}
		product.getCheckPictures().clear();
		product.getCheckPictures().addAll(checkPictures);
		
		product.otherQualificationsListToSet(request);
		
		List<CommonFile> otherQualificationseys = parseFilee(request.getParameterValues("otherQualificationsKeys"),product.getOtherQualificationsKeys().split(","));
		if(product.getOtherQualifications()==null){
			product.setOtherQualifications(new HashSet<CommonFile>());
		}
		product.getOtherQualifications().clear();
		product.getOtherQualifications().addAll(otherQualificationseys);
		
		product.setManageKey(Md5Util.getManageKey());
		User u = product.getCreator();
		String uuid = ShortUrlGenerator.generateShortUuid();
		uuid = u.getRegisterApplyId() + "L" + uuid;
		product.setUuid(uuid);
		product.setStatus(ProductStatus.UnSubmit);
		product.addLog(getCurrentUser().getDesc(),"添加商品");
    	productService.add(product);
        jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.add.success"));
        return jsonResult;
    }
    
    @RequestMapping(value="/myAdd",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult myAdd(HttpServletRequest request,
    		@Valid @ModelAttribute("product") Product product,
    		@RequestParam(value = "callBack",required = false)String callBack,BindingResult result) {
    	product.setCreator(getCurrentUser());
    	return add(request,product,callBack,result);
    }
    /**
     * 修改商品页面
     * @param product 需要修改的对象实体
     * @param request HttpServletRequest请求对象
     * 
     */
    @RequestMapping(value="/update",method=RequestMethod.GET)
	public void updateUI(@ModelAttribute(value="product") Product product,HttpServletRequest request) {
    	request.setAttribute("tempBean", product);
		List<Category> topCategories = categoryService.getByProperties(Category.class, new String[] {"status","parent" }, new Object[] {YesNo.Yes,null}, "orderNum", null);
		List<Category> categoryList = new ArrayList<Category>();
		categoryService.tree(topCategories,"",categoryList,null);
		request.setAttribute("categoryList", categoryList);
		
		request.setAttribute("productStatusMap",ProductStatus.productStatusMap);
		List<User> userList = userService.getByProperties(User.class,null,null,null,null);
		request.setAttribute("userList",userList);
		//clearTempDataList(request.getSession(),"product");
    }
    @RequestMapping(value="/myUpdate",method=RequestMethod.GET)
 	public String myUpdateUI(@ModelAttribute(value="product") Product product,HttpServletRequest request) {
    	updateUI(product,request);
    	request.setAttribute("my", true);
    	return "product/update";
    }
    
    
    @RequestMapping(value="/myUpdate",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult myUpdate(HttpServletRequest request,
	@ModelAttribute(value="product") Product product,
	BindingResult result) {
    	if(!product.getCanUpdate()){
    		return JsonResult.error("非法操作，该商品状态为\"" + product.getStatus().getDescription() + "\",不允许进行修改操作!");
    	}
    	product.setCreator(getCurrentUser());
    	return update(request,product,result);
    }
    /**
     *  修改商品 
     * @param product 待修改的实体对象
     * @param request HttpServletRequest对象
     * @return JsonResult 操作结果
     *
     */
    @RequestMapping(value="/update",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult update(HttpServletRequest request,
	@ModelAttribute(value="product") Product product,
	BindingResult result) {
    	JsonResult jsonResult = new JsonResult();
    	if(!validate(jsonResult,result)){
    		return jsonResult;
    	}
	    //保存多对多关联���系
		String oldKey = null;
		if(product.getPicture()!=null){
			oldKey = product.getPicture().getManageKey();
		}
		product.setPicture(parseFilee(request,"pictureKeys",oldKey));
		//保持一对多关联关系
		List<CommonFile> checkPictures = parseFilee(request.getParameterValues("checkPicturesKeys"),product.getCheckPicturesKeys().split(","));
		if(product.getCheckPictures()==null){
			product.setCheckPictures(new HashSet<CommonFile>());
		}
		product.getCheckPictures().clear();
		product.getCheckPictures().addAll(checkPictures);
		
		product.otherQualificationsListToSet(request);
		
		List<CommonFile> otherQualificationseys = parseFilee(request.getParameterValues("otherQualificationsKeys"),product.getOtherQualificationsKeys().split(","));
		if(product.getOtherQualifications()==null){
			product.setOtherQualifications(new HashSet<CommonFile>());
		}
		product.getOtherQualifications().clear();
		product.getOtherQualifications().addAll(otherQualificationseys);
		product.addLog(getCurrentUser().getDesc(),"修改商品");
        productService.update(product);
	// jsonResult.setNavTabId(rel);
        jsonResult.setMessage(getI18NMessage(request, "base.common.controller.operate.update.success"));
        return jsonResult;
    }
    
    @RequestMapping(value="/myUpdate",method=RequestMethod.POST,params = {"submit=yes"})
    @ResponseBody
    public JsonResult submit(HttpServletRequest request,
	@ModelAttribute(value="product") Product product,
	BindingResult result) {
    	try{
    		if(product.getCanSubmit()){
    			product.setStatus(ProductStatus.UnApprove);
    			product.addLog(getCurrentUser().getDesc(),"提交审核");
    			productService.update(product);
    			return JsonResult.success("提交成功!");
    		}else{
    			return JsonResult.error("非法操作!");
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    		return JsonResult.error(e.getMessage());
    	}
    }
    
    @RequestMapping(value="/myUpdate",method=RequestMethod.POST,params = {"cancel=yes"})
    @ResponseBody
    public JsonResult cancel(HttpServletRequest request,
	@ModelAttribute(value="product") Product product,
	BindingResult result) {
    	try{
    		if(product.getCanCancel()){
    			product.setStatus(ProductStatus.UnSubmit);
    			product.addLog(getCurrentUser().getDesc(),"取消审核");
    			productService.update(product);
    			return JsonResult.success("取消成功!");
    		}else{
    			return JsonResult.error("非法操作!");
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    		return JsonResult.error(e.getMessage());
    	}
    }
    
    
    @RequestMapping(value="/myUpdate",method=RequestMethod.POST,params = {"down=yes"})
    @ResponseBody
    public JsonResult down(HttpServletRequest request,
	@ModelAttribute(value="product") Product product,
	BindingResult result) {
    	try{
    		if(product.getCanDown()){
    			product.setStatus(ProductStatus.Down);
    			product.addLog(getCurrentUser().getDesc(),"下架");
    			productService.update(product);
    			return JsonResult.success("下架成功!");
    		}else{
    			return JsonResult.error("非法操作!");
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    		return JsonResult.error(e.getMessage());
    	}
    }
    
    @RequestMapping(value="/myUpdate",method=RequestMethod.POST,params = {"downAndEdit=yes"})
    @ResponseBody
    public JsonResult downAndEdit(HttpServletRequest request,
	@ModelAttribute(value="product") Product product,
	BindingResult result) {
    	try{
    		if(product.getCanDownAndEdit()){
    			product.setStatus(ProductStatus.UnSubmit);
    			product.addLog(getCurrentUser().getDesc(),"下架重新修改");
    			productService.update(product);
    			return JsonResult.success("操作成功!");
    		}else{
    			return JsonResult.error("非法操作!");
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    		return JsonResult.error(e.getMessage());
    	}
    }
    
    @RequestMapping(value="/myUpdate",method=RequestMethod.POST,params = {"up=yes"})
    @ResponseBody
    public JsonResult up(HttpServletRequest request,
	@ModelAttribute(value="product") Product product,
	BindingResult result) {
    	try{
    		if(product.getCanUp()){
    			product.setStatus(ProductStatus.Up);
    			product.addLog(getCurrentUser().getDesc(),"上架");
    			productService.update(product);
    			return JsonResult.success("上架成功!");
    		}else{
    			return JsonResult.error("非法操作!");
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    		return JsonResult.error(e.getMessage());
    	}
    }

    
    @RequestMapping(value="/approve",method=RequestMethod.GET)
 	public String approveUI(@ModelAttribute(value="product") Product product,HttpServletRequest request) {
    	updateUI(product,request);
    	return "product/approve";
    }
    
    @RequestMapping(value="/approve",method=RequestMethod.POST)
    @ResponseBody
    public JsonResult approve(HttpServletRequest request,
	@ModelAttribute(value="product") Product product,
	@RequestParam(value = "pass",required = false)String pass,
	@RequestParam(value = "remark",required = false)String remark,
	BindingResult result) {
    	try{
    		if(product.getCanApprove()){
    			boolean ok = pass.equals("Yes");
    			product.addLog(getCurrentUser().getDesc(),"审核"+(ok?"通过":"拒绝")+":"+(StringUtil.isEmpty(remark) ? "" : remark));
    			product.setStatus(ok ? ProductStatus.Success : ProductStatus.Failed);
    			if(ok && product.getQrCode()==null){
    				try {
    					InputStream in = this.getClass().getClassLoader().getResourceAsStream("qr-base.png");
    					String url = systemRootUrl; 
    					if(!url.endsWith("/")){
    						url += "/";
    					}
    					url += "query/" + product.getUuid() + ".do";
    					CommonFile file = fileService.mkQrCode(in,url,product.getUuid());
    					product.setQrCode(file);
    					in.close();
    				} catch (Exception e) {
    					e.printStackTrace();
    				}
    				
    			}
    			productService.update(product);
    			return JsonResult.success("审核成功!");
    		}else{
    			return JsonResult.error("非法操作!");
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    		return JsonResult.error(e.getMessage());
    	}
    }
    
    @RequestMapping(value="/myDetail",method=RequestMethod.GET)
  	public void myDetail(@ModelAttribute(value="product") Product product,HttpServletRequest request) {
    	request.setAttribute("my", true);
    	detail(product,request);
    }
    
	/**
	 *  查看商品页面
     * @param product 需���查看的实体对象
     * @param request HttpServletRequest对象
     * 
     */
    @RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detail(@ModelAttribute(value="product") Product product,HttpServletRequest request) {
    	request.setAttribute("tempBean", product);
        listFormParam(request,product,null);
    }
    
    @RequestMapping(value="/detail",method=RequestMethod.GET,params = {"uuid"})
	public void detailByUuid(@RequestParam(value="uuid") String uuid,HttpServletRequest request) {
    	Product product = productService.getEntityByProperty(Product.class, "uuid", uuid);
    	request.setAttribute("tempBean", product);
        listFormParam(request,product,null);
    }
    
    @RequestMapping(value="/myDelete",method=RequestMethod.GET)
    @ResponseBody
    public JsonResult myDelete(HttpServletRequest request,@ModelAttribute Product product) {
    	return delete(request,product);
    }
	/**
     * 删除单个商品对象
     * @param request HttpServletRequest对象
     * @param product 待删除对象
     * @return JsonResult 操作结果
     * 
     */
    @RequestMapping(value="/delete",method=RequestMethod.GET)
    @ResponseBody
    public JsonResult delete(HttpServletRequest request,@ModelAttribute Product product) {
        JsonResult jsonResult = new JsonResult();
        jsonResult.setCallbackType("");
        try {
        	productService.delete(product);
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
    	Product product = null;
		JsonResult jsonResult = new JsonResult();
    	for(String manageKey : manageKeys){
			 try {
    			product = productService.getEntityByProperty(Product.class,"manageKey",manageKey);
		markFileAsUnuse(product.getPicture());
		markFileAsUnuse(product.getQrCode());
    			productService.delete(product);
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
		List<Product> products = new ArrayList<Product>();
		if(manageKeys!=null){
			for(String manageKey : manageKeys){
				Product temp_product = productService.getEntityByProperty(Product.class, "manageKey", manageKey);
				if(temp_product!=null && !products.contains(temp_product)){
					products.add(temp_product);
				}
			}
		}
		request.setAttribute("showCheckBox",request.getParameter("showCheckBox"));
		request.setAttribute("keyName",request.getParameter("keyName"));
		request.setAttribute("products",products);
		return "product/select-list-html";
	}
	/**
	 *  历史记录列表
     * @param request HttpServletRequest对象
	 * @param product 查询对象
     * @param pageInfo 分页查询对象
     * @return String 显示页面路径
     * 
	@RequestMapping(value = "history",params="list")
	public String historyList(HttpServletRequest request,Product product,Page pageInfo){
		Page<HistoryRecord<Product>> productPage = productService.getHistoryListPage(product, pageInfo);
		request.setAttribute("pageBean", productPage);
		request.setAttribute("manageKey", product.getManageKey());
	    return "product/history-list";
	} */
	/**
	 * 查看历史记录
     * @param request HttpServletRequest对象
     * @param version 版本号
     * @return String 显示页面路径
     *
	@RequestMapping(value = "history",params="view")
	public String historyView(HttpServletRequest request,@RequestParam(value = "version")Integer version){
		Product product = productService.findByVersion(version);
		Product preProduct = (Product)productService.findByPreVersion(Product.class,product.getManageKey(),version);
		if(preProduct!=null && preProduct.getManageKey().equals(product.getManageKey())){
			Map<String,CheckResult> checkResult = BeanPropUtil.propValueCheck(preProduct, product);
			request.setAttribute("checkResult", checkResult);
		}
		request.setAttribute("tempBean", product);
		request.setAttribute("showOk", "no");
		request.setAttribute("historyView", true);
		return "product/detail";
	}*/
	/**
	 * 根据关键字获取商品select2对象
	 * @param queryKey 查询关键字
	 * @param pageInfo 查询分页信息
	 * @param response HttpServletResponse对象
	 * @return Select2<Product> 商品Select2对象
	 */
	@RequestMapping(value="/select2Query")
	@ResponseBody 
	public Select2<Product> select2Query(String queryKey,Page<Product> pageInfo, HttpServletResponse response) {
		Page<Product> page = productService.queryByKey(queryKey, pageInfo);
		Select2<Product> select2 = new Select2<Product>();
		select2.setTotal_count(page.getTotalCount());
		select2.setItems(page.getList());
		return select2;
	}
	/**
	 * 查找多个商品
	 * @param ids id数组
	 * @param response HttpServletResponse 对象
	 * @return List<Product> 商品列表
	 */
	@RequestMapping(value="/queryById")
	@ResponseBody
public List<Product> queryById(Integer[] ids,HttpServletResponse response) {
		List<Product> productList = productService.queryById(ids);
		return productList;
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
			@ModelAttribute(value="product") Product product,
			@RequestParam(value= "trTarget") String trTarget,
			@RequestParam(value= "trIndex") Integer trIndex,
			@RequestParam(value = "propName") String propName,
			HttpServletRequest request) {
		addUI(request, null);
		request.setAttribute("tempBean",product);
		request.setAttribute("trTarget", trTarget);
		request.setAttribute("trIndex", trIndex);
		request.setAttribute("propName", propName);
		return "product/tab-add-form";
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
			@ModelAttribute(value="product") Product product,
			@RequestParam(value= "trTarget") String trTarget,
			@RequestParam(value= "trIndex") Integer trIndex,
			@RequestParam(value = "propName") String propName,
			HttpServletRequest request) {
		addUI(request, null);
		request.setAttribute("tempBean",product);
		request.setAttribute("trTarget", trTarget);
		request.setAttribute("trIndex", trIndex);
		request.setAttribute("propName", propName);
		return "product/tab-detail-form";
	}
}