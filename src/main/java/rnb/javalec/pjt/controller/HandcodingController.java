package rnb.javalec.pjt.controller;

import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import rnb.javalec.pjt.service.HandlerFile;
 

 
@Controller
public class HandcodingController {
    
	private static final Logger logger = LoggerFactory.getLogger(HandcodingController.class);

    @RequestMapping(value="/coding.do")
    public String coding() {
        return "coding";
    }
    
    @RequestMapping(value="/fileUpload.do", method= {RequestMethod.POST,RequestMethod.GET})
    public String fileUpload(MultipartHttpServletRequest multipartRequest) {
        
        String filePath = "C:/fileUpload";
        Map<String, List<String>> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();
        // 실제저장파일명과 원본파일명 DB저장처리
        System.err.println(fileNames.toString());
        
        return "redirect:/coding.do";
    }    
    
    @RequestMapping(value="/fileDownload.do")
    @ResponseBody
    public byte[] fileDownload(HttpServletResponse resp) {
        
        String filePath = "C:/fileUpload";
        String saveName = "20180509-8efb2d09-ea45-4240-af92-52625c97664e.pptx ";
        String oldName = "3조 회사소개ppt.pptx";
        
        return new HandlerFile(resp, filePath, saveName, oldName).getDownloadFileByte();
    }    
    
    @RequestMapping(value="/fileDelete.do")
    public String fileDelete() {
        
        String filePath = "C:/fileUpload";
        String saveName = "실제저장파일명";
        new HandlerFile(filePath, saveName).deleteFileExecute();
        
        return "redirect:/coding.do";
    }        

}