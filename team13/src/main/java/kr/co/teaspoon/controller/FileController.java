package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.FileBoard;
import kr.co.teaspoon.dto.FileDTO;
import kr.co.teaspoon.dto.FileVO;
import kr.co.teaspoon.service.FileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Controller
@RequestMapping("/file/*")
public class FileController {

    private static final Logger log = LoggerFactory.getLogger(FileController.class);

    @Resource(name="uploadPath")
    String uploadPath;

    @Autowired
    private FileService fileService;

    @Autowired
    HttpSession session; // 세션 생성

    @GetMapping("fileupload1.do")
    public String fileUploadForm(){
        return "/fileboard/fileupload";
    }

    @PostMapping("fileupload1.do")
    public String fileUpload1(MultipartHttpServletRequest files, HttpServletRequest req, Model model) throws Exception {

        //파라미터 분리
        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
        }

        //제목 및 내용 분리
        FileBoard board = new FileBoard();
        board.setTitle((String) map.get("title"));
        board.setContent((String) map.get("content"));
        //uploadPath; //dispatcher-servlet에서 지정한 경로
        //req.getContextPath(); //현재 프로젝트 홈 경로 - /pro3_war
        //req.getServletPath();   //요청된 URL - /pro3_war/file/fileupload1.do
        req.getRealPath("/resources/upload");  //현재 프로젝트에 저장될 실제 경로
        String devFolder = uploadPath + "/resources/upload";    //개발자용 컴퓨터에 업로드 디렉토리 지정
        String uploadFolder = req.getRealPath("/resources/upload");
        File folder = new File(uploadFolder);
        if(!folder.exists())
            folder.mkdirs();
        log.info("-----------------------------------");
        log.info(" 현재 프로젝트 홈 : "+req.getContextPath());
        log.info(" dispatcher-servlet에서 지정한 경로 : "+uploadPath);
        log.info(" 요청 URL : "+req.getServletPath());
        log.info(" 프로젝트 저장 경로 : "+req.getRealPath("/resources/upload"));
        //여러 파일 반복 저장
        List<FileDTO> fileList = new ArrayList<>();
        Iterator<String> it = files.getFileNames();
        while(it.hasNext()){
            String paramfName = it.next();
            MultipartFile file = files.getFile(paramfName);
            log.info("-----------------------------------");
            log.info("name : "+file.getOriginalFilename());
            log.info("size : "+file.getSize());
            log.info("path : ");

            File saveFile = new File(uploadFolder, file.getOriginalFilename()); //실제 파일 객체 생성
//            File devFile = new File(devFolder, file.getOriginalFilename()); //개발자용 컴퓨터에 해당파일 생성

            FileDTO data = new FileDTO();
            data.setSaveFolder(uploadFolder);
            data.setOriginFile(file.getOriginalFilename());
            data.setSaveFile(saveFile.getPath());
            data.setFileSize(file.getSize());
            Date today = new Date();
            data.setUploadDate(today.toString());
            fileList.add(data);

            try {
                file.transferTo(saveFile);  //실제 디렉토리에 해당파일 저장
//                file.transferTo(devFile); //개발자용 컴퓨터에 해당파일 저장
            } catch(IllegalStateException e1){
                log.info(e1.getMessage());
            } catch(IOException e2){
                log.info(e2.getMessage());
            }
        }

        FileVO fileboard = new FileVO();
        fileboard.setFileList(fileList);
        fileboard.setFileBoard(board);

        fileService.insertFileboard(fileboard);

        return "redirect:filelist1.do";
    }

    @GetMapping("filelist1.do")
    public String getFileList(HttpServletResponse response, Model model) throws Exception {
        if(session.getAttribute("sid") != null && !"".equals(session.getAttribute("sid"))) {
            List<FileVO> fileboardList = fileService.getFileList();
            model.addAttribute("fileboardList", fileboardList);
            return "/fileboard/filelist1";
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('해당 페이지는 회원만 접근 가능합니다.');</script>");
            out.flush();
            return "/index";
        }
    }

    //getFileboard.do
    @GetMapping("getFileboard.do")
    public String getFileboard(@RequestParam int postNo, Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        model.addAttribute("fileboard", fileboard);
        return "/fileboard/getFileboard";
    }

    @GetMapping("removeFileboard.do")
    public String removeFileboard(@RequestParam int postNo, HttpServletRequest req) throws Exception {

        //실제 파일 삭제 로직
        //파일 경로 지정
        String path = req.getRealPath("/resources/upload");
        List<FileDTO> fileList = fileService.getFileGroupList(postNo);
        for(FileDTO fileobj : fileList) {
            File file = new File(path + "/" + fileobj.getOriginFile());
            if (file.exists()) { // 해당 파일이 존재하면
                file.delete(); // 파일 삭제
            }
        }
        //데이터베이스의 파일 자료실과 파일의 내용 삭제
        fileService.removeFileboard(postNo);
        return "redirect:filelist1.do";
    }

    @GetMapping("modifyFileboard.do")
    public String modifyFileboard(@RequestParam int postNo, Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        model.addAttribute("fileboard", fileboard);
        return "/fileboard/modifyFileboard";
    }

    @PostMapping("modifyFileboard.do")
    public String modifyFileboard2(@RequestParam int postNo, MultipartHttpServletRequest files, HttpServletRequest req,Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
//        model.addAttribute("fileboard", fileboard);
        /////////////
        //파라미터 분리
        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
            System.out.println("map : "+map.toString());
        }
        //제목 및 내용 분리
        FileBoard board = new FileBoard();
        board.setPostNo(postNo);
        board.setTitle((String) map.get("title"));
        board.setContent((String) map.get("content"));


        //uploadPath; //dispatcher-servlet에서 지정한 경로
        //req.getContextPath(); //현재 프로젝트 홈 경로 - /pro3_war
        //req.getServletPath();   //요청된 URL - /pro3_war/file/fileupload1.do
        req.getRealPath("/resources/upload");  //현재 프로젝트에 저장될 실제 경로
        String devFolder = uploadPath + "/resources/upload/";    //개발자용 컴퓨터에 업로드 디렉토리 지정
        String uploadFolder = req.getRealPath("/resources/upload");
        log.info("-----------------------------------");
        log.info(" 현재 프로젝트 홈 : "+req.getContextPath());
        log.info(" dispatcher-servlet에서 지정한 경로 : "+uploadPath);
        log.info(" 요청 URL : "+req.getServletPath());
        log.info(" 프로젝트 저장 경로 : "+req.getRealPath("/resources/upload"));
        //여러 파일 반복 저장
        List<FileDTO> fileList = new ArrayList<>();
        Iterator<String> it = files.getFileNames();

        while(it.hasNext()){
            String paramfName = it.next();
            MultipartFile file = files.getFile(paramfName);
            log.info("-----------------------------------");
            log.info("name : "+file.getOriginalFilename());
            log.info("size : "+file.getSize());
            log.info("path : ");

            File saveFile = new File(uploadFolder, file.getOriginalFilename()); //실제 파일 객체 생성
//            File devFile = new File(devFolder, file.getOriginalFilename()); //개발자용 컴퓨터에 해당파일 생성

            FileDTO data = new FileDTO();
            data.setSaveFolder(uploadFolder);
            data.setOriginFile(file.getOriginalFilename());
            data.setSaveFile(saveFile.getPath());
            data.setFileSize(file.getSize());
            Date today = new Date();
            data.setUploadDate(today.toString());
            data.setPostNo(postNo);
            fileList.add(data);

            try {
                file.transferTo(saveFile);  //실제 디렉토리에 해당파일 저장
//                file.transferTo(devFile); //개발자용 컴퓨터에 해당파일 저장
            } catch(IllegalStateException e1){
                log.info(e1.getMessage());
            } catch(IOException e2){
                log.info(e2.getMessage());
            }

//                if (!fileList.isEmpty()) {
            if (!file.getOriginalFilename().equals("")) {
                fileService.removeFileAll(postNo);
            }

//                fileService.updateFileboard(fileboard);
        }

        fileboard.setFileList(fileList);
        fileboard.setFileBoard(board); //글 제목 내용
//        fileService.removeFileAll(postNo);
        fileService.updateFileboard(fileboard);

        /////////////
        return "redirect:getFileboard.do?postNo="+postNo;
    }


    @PostMapping("fileRemove.do")
    public String fileRemove(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        String path = request.getRealPath("/resources/upload");
        FileDTO fileobj = fileService.getFile(no);
        File file = new File(path + "/" + fileobj.getOriginFile());
        if (file.exists()) { // 해당 파일이 존재하면
            file.delete(); // 파일 삭제
            fileService.fileRemove(no);
            log.info("file delete");
        }
        return "/fileboard/getFileboard.do?postNo="+postNo;
    }
}
