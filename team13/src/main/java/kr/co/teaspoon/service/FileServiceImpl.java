package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.FileDAO;
import kr.co.teaspoon.dto.FileDTO;
import kr.co.teaspoon.dto.FileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileServiceImpl implements FileService {

    @Autowired
    FileDAO fileDAO;

    @Override
    public void insertFileboard(FileVO fileboard) throws Exception {
        fileDAO.insertFileboard(fileboard);
    }

    @Override
    public List<FileVO> getFileList() throws Exception {
        return fileDAO.getFileList();
    }

    @Override
    public List<FileDTO> getFileGroupList(int postNo) throws Exception {
        return fileDAO.getFileGroupList(postNo);
    }

    @Override
    public FileVO getFilebord(int postNo) throws Exception {
        return fileDAO.getFilebord(postNo);
    }

    @Override
    public FileVO getFileObject(int no) throws Exception {
        return null;
    }

    @Override
    public void removeFileboard(int postNo) throws Exception {
        fileDAO.removeFileboard(postNo);
    }

    @Override
    public void fileRemove(int no) throws Exception {
        fileDAO.fileRemove(no);
    }

    @Override
    public FileDTO getFile(int no) throws Exception {
        return fileDAO.getFile(no);
    }

    @Override
    public void updateFileboard(FileVO fileboard) throws Exception {
        fileDAO.updateFileboard(fileboard);
    }
    @Override
    public void removeFileAll(int postNo) throws Exception {
        fileDAO.removeFileAll(postNo);
    }
}