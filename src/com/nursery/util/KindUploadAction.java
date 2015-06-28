package com.nursery.util;

import com.nursery.action.DefaultAction;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

@Scope("prototype")
@Controller
public class KindUploadAction extends DefaultAction {
    // 保存路径
    private static String SAVE_PATH = "/upload/web/";
    // 保存路径
    private static String SAVE_HEAD = "/upload/headimage/";
    // 文件允许格式
    private static String[] ALLOW_FILES = { ".gif", ".png", ".jpg", ".jpeg"};
    // 文件大小限制，单位KB
    private static int MAX_SIZE = 1024 * 1024 * 1024;

    public String kind() throws IOException {
        String scriptHtml;
        if(!checkFileType(getImgFileFileName())) {
            scriptHtml = "{\"error\":1, \"message\":\"请上传正确格式的文件！\"}";;
        }else if(getImgFile().length() > MAX_SIZE) {
            scriptHtml = "{\"error\":1, \"message\":\"上传的文件过大，请上传不超过1MB的图片文件！\"}";
        } else {
            String url = SAVE_PATH + System.currentTimeMillis() + getImgFileFileName().substring(getImgFileFileName().lastIndexOf("."));
            String realPath = ServletActionContext.getServletContext().getRealPath(url);
            FileUtils.copyFile(getImgFile(), new File(realPath));
            scriptHtml = "{\"error\":0, \"url\":\""+url+"\"}";
    }
        stringBack(scriptHtml);
        return null;
    }

    /**
     * 上传图片
     * @return
     * 路径从url中取
     * 1 无图片
     * 2 图片格式不正确
     * 3 图片过大
     * @throws java.io.IOException
     */
    public String headUpload() throws IOException {
        String scriptHtml;
        if(getUp() == null) {
            scriptHtml = "<script type='text/javascript'>alert('未选择图片');</script>";
        }else if(!checkFileType(getUpFileName())) {
            scriptHtml = "<script type='text/javascript'>alert('文件格式不正确');</script>";
        }else if(getUp().length() > MAX_SIZE) {
            scriptHtml = "<script type='text/javascript'>alert('文件太大');</script>";
        } else {
            String url = SAVE_HEAD + System.currentTimeMillis() + getUpFileName().substring(getUpFileName().lastIndexOf("."));
            String realPath = ServletActionContext.getServletContext().getRealPath(url);
            FileUtils.copyFile(getUp(), new File(realPath));
            scriptHtml = "<script type='text/javascript'>parent.document.getElementById('" + getTagId() + "').value='" + url + "';alert('上传成功');</script>";
        }
        stringBack(scriptHtml);
        return null;
    }

    /**
     * 用于删除图片
     * @return
     * @throws java.io.IOException
     */
    public String delete() throws IOException {
        String realPath = ServletActionContext.getServletContext().getRealPath(getImageSrc());
        FileUtils.deleteQuietly(new File(realPath));
        jsonBack(SUCCESS);
        return null;
    }

    /**
     * 文件类型判断
     *
     * @param fileName
     * @return
     */
    private boolean checkFileType(String fileName) {
        Iterator<String> type = Arrays.asList(ALLOW_FILES).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileName.toLowerCase().endsWith(ext)) {
                return true;
            }
        }
        return false;
    }

    public File getUp() {
        return up;
    }

    public void setUp(File up) {
        this.up = up;
    }

    public String getUpFileName() {
        return upFileName;
    }

    public void setUpFileName(String upFileName) {
        this.upFileName = upFileName;
    }

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getImageSrc() {
        return imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public File getImgFile() {
        return imgFile;
    }

    public void setImgFile(File imgFile) {
        this.imgFile = imgFile;
    }

    public String getImgFileFileName() {
        return imgFileFileName;
    }

    public void setImgFileFileName(String imgFileFileName) {
        this.imgFileFileName = imgFileFileName;
    }

    private File up;
    private String upFileName;
    private String tagId;

    private String imageSrc;

    private String dir;
    private File imgFile;
    private String imgFileFileName;
}
