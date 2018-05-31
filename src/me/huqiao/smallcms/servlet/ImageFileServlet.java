package me.huqiao.smallcms.servlet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.huqiao.smallcms.common.entity.CommonFile;
import me.huqiao.smallcms.common.listener.ApplicationContextAccessUtilListener;
import me.huqiao.smallcms.common.service.ICommonFileService;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;


/**
 * 验证图片
 * @author NOVOTS
 * @version Version 1.0
 */
public class ImageFileServlet extends HttpServlet {
	
	static Logger logger = Logger.getLogger(ImageFileServlet.class);
    private static final long serialVersionUID = -5429016617547499805L;

	public void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException{
		ApplicationContext ctx = ApplicationContextAccessUtilListener.getContext();
		ICommonFileService fileService = ctx.getBean(ICommonFileService.class);
		viewPic(req.getParameter("manageKey"),req,resp,fileService);
	}
	
	
	public String viewPic(String manageKey,HttpServletRequest request,HttpServletResponse response,ICommonFileService fileeService){
		
		CommonFile filee = fileeService.getEntityByProperty(CommonFile.class, "manageKey", manageKey);
		if(filee==null){
			return null;
		}
		if(filee.isLinkFile()){
			try {
				response.sendRedirect(filee.getFileLink());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		response.setCharacterEncoding("UTF-8");
		///response.setHeader("Info", filee.getFullName());
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache, must-revalidate");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		
		try {
			OutputStream ops = response.getOutputStream();
			logger.info("read file from " + filee.getFullName());
			FileInputStream fis = new FileInputStream(new File(filee.getFullName())); 
			BufferedInputStream bis = new BufferedInputStream(fis);
			byte[] buffer = new byte[1024];
			int i;
			while((i=bis.read(buffer))!=-1){
				ops.write(buffer,0,i);
			}
			ops.close();
			bis.close();
		} catch (IOException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
}
