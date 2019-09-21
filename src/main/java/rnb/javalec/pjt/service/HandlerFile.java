package rnb.javalec.pjt.service;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
 
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
 
/**
 * HandlerFile
 * @author 이승환
 * @version 2017.09.27 v2.0
 */
public class HandlerFile {
 
    private String filePath; // common
    private MultipartHttpServletRequest multipartRequest; // upload
    private Map<String, List<String>> fileNames; // upload
    private String oldName; // down
    private HttpServletResponse response; // down
    private byte[] fileByte; // down
 
    public HandlerFile() {}
    
    /**
     * common filePath
     * @return filePath
     */
    public String getFilePath(){
        return filePath;
    }
    /**
     * upload 생성자
     * @param multipartRequest
     * @param filePath
     */
    public HandlerFile(MultipartHttpServletRequest multipartRequest, String filePath) {
        this.multipartRequest = multipartRequest;
        this.filePath = filePath;
        fileNames = new HashMap<String, List<String>>();
    }
    /**
     * upload 임시저장 처리 생성자
     * @param multipartRequest
     */
    public HandlerFile(MultipartHttpServletRequest multipartRequest) {
        this.multipartRequest = multipartRequest;
        this.filePath = multipartRequest.getSession().getServletContext().getRealPath("/resources/tempfile");
        fileNames = new HashMap<String, List<String>>();
    }
    /**
     * upload setter
     * @param multipartRequest
     * @param filePath
     * @return this
     */
    public HandlerFile setUpload(MultipartHttpServletRequest multipartRequest, String filePath) {
        this.multipartRequest = multipartRequest;
        this.filePath = filePath;
        fileNames = new HashMap<String, List<String>>();
        return this;
    }
    /**
     * upload 임시저장 처리 setter
     * @param multipartRequest
     * @return this
     */
    public HandlerFile setUpload(MultipartHttpServletRequest multipartRequest) {
        this.multipartRequest = multipartRequest;
        this.filePath = multipartRequest.getSession().getServletContext().getRealPath("/resources/tempfile");
        fileNames = new HashMap<String, List<String>>();
        return this;
    }
    /**
     * upload
     * @return Map<String, List<String>> fileNames
     */
    public Map<String, List<String>> getUploadFileName() {
        upload(true);
        return fileNames;
    }
    /**
     * upload save이름 생성여부
     * @param saveNameCreate
     * @return Map<String, List<String>> fileNames
     */
    public Map<String, List<String>> getUploadFileName(boolean saveNameCreate) {
        upload(saveNameCreate);
        return fileNames;
    }
    /**
     * 파일 업로드 처리
     * @param saveNameCreate
     */
    private void upload(boolean saveNameCreate) {
        Iterator<String> itr = multipartRequest.getFileNames();
        List<String> oldNames = new ArrayList<String>();
        List<String> saveNames = new ArrayList<String>();
        StringBuffer sb = null;
        while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            sb = new StringBuffer();
            String oldFileName = mpf.getOriginalFilename(); // 파일명
            String saveFileName = sb.append(new SimpleDateFormat("yyyyMMdd").format(System.currentTimeMillis()))
                                    .append("-")
                                    .append(UUID.randomUUID().toString())
                                    .append(oldFileName.substring(oldFileName.lastIndexOf("."))).toString();
            String fileFullPath = null; // 파일 전체 경로
            if(saveNameCreate) {
                fileFullPath = filePath + "/" + saveFileName; 
            }else {
                fileFullPath = filePath + "/" + oldFileName;
            }
            try {
                // 경로가 없으면 생성
                File targetDir = new File(fileFullPath);
                if(!targetDir.exists()) {
                    targetDir.mkdirs();
                }
                // 파일 저장
                mpf.transferTo(new File(fileFullPath));
                oldNames.add(oldFileName);
                if(saveNameCreate) {
                    saveNames.add(saveFileName);
                }else {
                    saveNames.add(oldFileName);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        fileNames.put("oldNames", oldNames);
        fileNames.put("saveNames", saveNames);
    }
    
    /**
     * down 생성자
     * @param response
     * @param filePath
     * @param saveName
     * @param oldName
     */
    public HandlerFile(HttpServletResponse response, String filePath, String saveName, String oldName) {
        this.response = response;
        this.filePath = filePath + "/" + saveName;
        this.oldName = oldName;
    }
    /**
     * down setter
     * @param response
     * @param filePath
     * @param saveName
     * @param oldName
     * @return this
     */
    public HandlerFile setDown(HttpServletResponse response, String filePath, String saveName, String oldName) {
        this.response = response;
        this.filePath = filePath + "/" + saveName;
        this.oldName = oldName;
        return this;
    }
    /**
     * down
     * @return byte[] fileByte
     */
    public byte[] getDownloadFileByte() {
        dowonload();
        return fileByte;
    }
    /**
     * down
     */
    private void dowonload() {
        try {
            fileByte = FileUtils.readFileToByteArray(new File(filePath));
            response.setContentType("application/octet-stream");
            response.setContentLength(fileByte.length);
            // 다운로드시 변경할 파일명
            response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(oldName, "UTF-8") + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * delete 생성자
     * @param filePath
     * @param saveName
     */
    public HandlerFile(String filePath, String saveName) {
        this.filePath = filePath + "/" + saveName;
    }
    /**
     * delete setter
     * @param filePath
     * @param saveName
     * @return this
     */
    public HandlerFile setDelete(String filePath, String saveName) {
        this.filePath = filePath + "/" + saveName;
        return this;
    }
    /**
     * delete
     * @return boolean check
     */
    public boolean deleteFileExecute() {
        boolean check = false;
        File file = new File(filePath);
        if(file.exists()) {
            check = file.delete();
        }
        return check;
    }
    
}


