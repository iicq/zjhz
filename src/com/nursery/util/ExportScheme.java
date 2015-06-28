package com.nursery.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class ExportScheme {
	public static void exportScheme(FileInputStream fileInputStream,String fileName) throws IOException{
		ActionContext context = ActionContext.getContext();  
		HttpServletResponse response = (HttpServletResponse) context.get(ServletActionContext.HTTP_RESPONSE);  
		response.setContentType("application/x-download");
		response.setHeader("Content-Length", String.valueOf(fileInputStream.available()));
	    response.setHeader("Content-Disposition","attachment;filename="+fileName);
		 // 得到响应输出流对象
        OutputStream output;
		try {
			output = response.getOutputStream();
			// 根据文件服务器物理路径创建文件读取对象
	        FileInputStream fs = fileInputStream;
	        // 输出文件
	        byte[] b = new byte[1024];
	        int i = 0;
 	        while ((i = fs.read(b)) > 0) {
	            output.write(b, 0, i);
	        }
	        output.flush();
	        //fs.close();
	        fs = null;
	       // output.close();
	        
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        output = null;
		
	}
}
