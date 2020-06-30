package com.fdream.util;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class FileUploadUtil {
	public static String getRandomCode(HttpServletRequest request){
		long startTime = System.currentTimeMillis();
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
		request.getSession().getServletContext());
		
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {
					/*String addFileName = RandomStringUtil.getRandomCode(10, 4)+"."+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
					String path = "D:/fdream/file/" + addFileName ;
					// 上传URLDecoder.decode("%E5%95%8A", "UTF-8")
					file.transferTo(new File(path));
					String fileurl="http://localhost:88/fdream/file/"+addFileName;
					LearnFile learnfile = new LearnFile(file.getOriginalFilename(), fileurl, lf.getUplodetime());
					fileService.uplodeFile(learnfile);*/
				}else{
					System.out.println("上传文件不能为空");
				}

			}

		}
		long endTime = System.currentTimeMillis();
		System.out.println("上传所花时间：" + String.valueOf(endTime - startTime) + "ms");
		return null;
	}
}
