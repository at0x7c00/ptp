package me.huqiao.smallcms.trace.entity.propertyeditor;
import java.beans.PropertyEditorSupport;

import me.huqiao.smallcms.trace.entity.Product;
import me.huqiao.smallcms.trace.service.IProductService;
/**
 * 商品编辑器
 * @author NOVOTS
 * @version Version 1.0
 */
public class ProductEditor extends PropertyEditorSupport{
    public IProductService productService;
    public ProductEditor(IProductService productService){
        this.productService = productService;
    }
    public String getAsText(){
        Product product = (Product)getValue();
        if(product==null){
            return "";
        }
        return String.valueOf(product.getId());
    }
    public void setAsText(String key)throws IllegalArgumentException {
        Product product = null;
product = productService.getEntityByProperty(Product.class,"manageKey",key);
if(product==null){
            Integer integerId = null;
            try {integerId = Integer.parseInt(key);} catch (Exception e) {}
            product = productService.getById(Product.class,integerId);
}
if(key!=null && !key.trim().equals("") && product==null){
product=new Product();
}
        setValue(product);
    }
}