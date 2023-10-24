package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Infomation;
import kr.co.teaspoon.service.InfoUniServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/infoUni/*")
public class InfoUniCtrl {

    @Autowired
    private InfoUniServiceImpl infoService;

    @Autowired
    HttpSession session; // 세션 생성

    @GetMapping("list.do")		//info/list.do
    public String getinfoList(HttpServletResponse response, Model model) throws Exception {
        if(session.getAttribute("sid") != null && !"".equals(session.getAttribute("sid"))) {
            List<Infomation> infomationList = infoService.infoList();
            model.addAttribute("infoList", infomationList);
            return "/infoUni/infoList";
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('해당 페이지는 회원만 접근 가능합니다.');</script>");
            out.flush();
            return "/index";
        }
    }

    @GetMapping("detail.do")	//info/detail.do?bno=1
    public String getinfoDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Infomation dto = infoService.infoDetail(bno);
        model.addAttribute("dto", dto);
        return "/infoUni/infoDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/infoUni/infoInsert";
    }

    @PostMapping("insert.do")
    public String infoInsert(HttpServletRequest request, Model model) throws Exception {
        Infomation dto = new Infomation();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        infoService.infoInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String infoDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        infoService.infoDelete(bno);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Infomation dto = infoService.infoDetail(bno);
        model.addAttribute("dto", dto);
        return "/infoUni/infoEdit";
    }

    @PostMapping("edit.do")
    public String infoEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Infomation dto = new Infomation();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        infoService.infoEdit(dto);
        return "redirect:/infoUni/detail.do?bno="+bno;
    }

    //ckeditor를 이용한 이미지 업로드
    @RequestMapping(value="imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
//            String path = "D:\\kim\\spring1\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";	// 이미지 경로 설정(폴더 자동 생성)
            String path = "D:\\spring_study\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/pro3_war/info/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value="ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
            , @RequestParam(value="fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        //서버에 저장된 이미지 경로
//        String path = "D:\\kim\\spring1\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";	// 저장된 이미지 경로
        String path = "D:\\spring_study\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";
        System.out.println("path:"+path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
}
