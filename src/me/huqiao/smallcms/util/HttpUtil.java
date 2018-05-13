package me.huqiao.smallcms.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import me.huqiao.smallcms.common.entity.CommonFile;
import me.huqiao.smallcms.common.entity.CommonFolder;

public class HttpUtil {

	//static Logger log = Logger.getLogger(HttpUtil.class);
	
	public static void main(String[] args) throws ConnectException {
		
		String address = "http://wms.cdfg.com.cn/wmprd/wms/wmsapp.ctrl";
		String data = "I|LOGINSLOT:0|0|_focus|password=zhangyang1&S|G|P=16B0088D0A99FB734D8E5D82B2D5B981&S|G|E=0A13274CDEFF2D7B61586CFCC9560D4A&S|G|N=Login%20Screen&S|G|W=0&S|G|Z=homeInteractionId&S|G|IN=%E4%B8%BB%E9%A1%B5&S|G|ST=1&S|G|O=0&S|G|OIN=&S|G|loginRequest=25454&S|G|CS=0&S|G|VI=ctrl_click_0&S|G|Y=0&S|G|AE=0&H=loginTrigger&T=1&loginPage=1&loginTriggerClicked=1";
		
		System.out.println(">>>"+postRequest(address,data));
		
	}
	
	/**
	 * 发起POST请求
	 * @param address
	 * @param params
	 * @return
	 */
	public static String postRequest(String address,String data)throws ConnectException{
		data = data.replaceAll("\r", "");
		data = data.replaceAll("\n", "");
		long current = System.currentTimeMillis();
		URL u = null;
		HttpURLConnection con = null;
		try {
			u = new URL(address);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
			osw.write(data);
			osw.flush();
			osw.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}
		// 读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
				buffer.append("\n");
			}
		} catch (Exception e) {
			//e.printStackTrace();
		}
		//log.info(address+",data=" + data);
		//log.info("time ask ShuZhiYun:"+(System.currentTimeMillis() - current));
		return buffer.toString();
	}
	
	/**
	 * 发起GET请求
	 * @param address
	 * @return
	 */
	public static String getRequest(String address){
		URLConnection conn = null;
		StringBuffer content = new StringBuffer();
		try{
			URL url = new URL(address);
			conn = url.openConnection();
			InputStream is = conn.getInputStream();
			byte[] buffer = new byte[1024];
			int i;
			while((i = is.read(buffer))!=-1){
				content.append(new String(buffer,0,i,"UTF8"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return content.toString();
		
	}
	
	 /**
     * 向指定URL发送GET方法的请求
     * 
     * @param url
     *            发送请求的URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     * 
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }

	public static byte[] save(CommonFolder folder, CommonFile filee, String downloadUrl) {
		 try {
		      URL url = new URL(downloadUrl);
		      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		      conn.setDoInput(true);
		      conn.setRequestMethod("GET");

		      // 根据内容类型获取扩展名
		      String fileExt = conn.getHeaderField("Content-Type");
		      
		      String fileName = conn.getHeaderField("Content-Disposition");
		      if(fileName!=null && fileName.indexOf("=")>=0){
		    	  fileName = fileName.substring(fileName.indexOf("=")+1,fileName.length()-1);
		    	  fileName = fileName.substring(fileName.indexOf("."));
		      }else{
		    	  fileName = Md5Util.getManageKey();
		      }
		      
		      // fileName = fileName.
		      // 将mediaId作为文件名
		      byte[] bytes = null;
		      BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		      ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		      byte[] buf = new byte[8096];
		      int size = 0;
		      while ((size = bis.read(buf)) != -1){
		    	  outputStream.write(buf, 0, size);
		      }
		      outputStream.close();
		      bis.close();
		      bytes =  outputStream.toByteArray();
		      conn.disconnect();
		   
			filee.setExtensionName(fileExt);
			filee.setName(fileName);
			filee.setManageKey(Md5Util.getManageKey());
			filee.setFolder(folder);
			return bytes;
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		 return null;
	}    
	
}
