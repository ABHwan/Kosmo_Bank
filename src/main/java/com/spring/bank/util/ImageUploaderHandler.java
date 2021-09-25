package com.spring.bank.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.ui.Model;

public class ImageUploaderHandler {
    private String uploadPath;
    
    public void setUploadPath(String url) {
        this.uploadPath = url;
    }
    
    public void imageUpload(HttpServletRequest req, Model model)
    		throws ServletException, IOException {
    	
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            uploadDir.setWritable(true);
            uploadDir.setReadable(true);
            uploadDir.setExecutable(true);

            String fileName = "";
            for (Part part : req.getParts()) {
                System.out.println(part.getHeader("content-disposition"));
                fileName = getFileName(part);
                if (fileName != null && !"".equals(fileName)) {
                    part.write(uploadPath + File.separator + fileName);
                    req.setAttribute("fileName", fileName);
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        // res.setContentType("text/html");
        // res.getWriter().println("업로드 완료");
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null; // filename이 없는 경우 (폼필드 데이터인 경우):
    }
}
