package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.FileBoard;
import kr.co.teaspoon.dto.FileDTO;
import kr.co.teaspoon.dto.FileVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public class FileDAOImpl implements FileDAO {
    @Autowired
    SqlSession sqlSession;

    //파일 자료실과 파일 테이블에 동시에 트랜잭션 처리 : 파일 자료 하나당 파일은 여러 개이므로
    @Transactional
    @Override
    public void insertFileboard(FileVO fileboard) throws Exception {
        FileBoard board = fileboard.getFileBoard();
        List<FileDTO> fileList = fileboard.getFileList();
        sqlSession.insert("fileboard.fileboardInsert", board);
        FileBoard latestBoard = sqlSession.selectOne("fileboard.latestFileboard");
        for(FileDTO file:fileList) {
            file.setPostNo(latestBoard.getPostNo());
            sqlSession.insert("fileboard.fileInsert", file);
        }
    }

    //파일 자료 목록 불러오기
    @Override
    public List<FileVO> getFileList() throws Exception {
        List<FileVO> fileboardList = new ArrayList<>();
        List<FileBoard> boardList = sqlSession.selectList("fileboard.fileboardList");
        for(int i=0;i<boardList.size();i++) {
            FileBoard board = boardList.get(i);
            List<FileDTO> fileList = sqlSession.selectList("fileboard.fileList", board.getPostNo());
            FileVO fileboard = new FileVO();
            fileboard.setFileBoard(board);
            fileboard.setFileList(fileList);
            fileboardList.add(fileboard);
        }
        return fileboardList;
    }

    //해당 파일 자료
    @Transactional
    @Override
    public List<FileDTO> getFileGroupList(int postNo) throws Exception {
        List<FileDTO> fileList = sqlSession.selectList("fileboard.fileGroupList", postNo);
        return fileList;
    }

    @Transactional
    @Override
    public FileVO getFilebord(int postNo) throws Exception {
        FileVO fileboard = new FileVO();
        sqlSession.update("fileboard.countUp", postNo);
        FileBoard board = sqlSession.selectOne("fileboard.fileboardDetail", postNo);
        List<FileDTO> fileList = sqlSession.selectList("fileboard.fileGroupList", postNo);
        fileboard.setFileBoard(board);
        fileboard.setFileList(fileList);
        return fileboard;
    }

    @Override
    public FileVO getFileObject(int no) throws Exception {
        return null;
    }

    @Transactional
    @Override
    public void removeFileboard(int postNo) throws Exception {
        sqlSession.delete("fileboard.fileboardDelete", postNo);
        sqlSession.delete("fileboard.fileDelete", postNo);
    }

    @Override
    public void fileRemove(int no) throws Exception {
        sqlSession.delete("fileboard.fileObjDelete", no);
    }

    @Override
    public FileDTO getFile(int no) throws Exception {
        return sqlSession.selectOne("fileboard.fileDetail", no);
    }


    @Transactional
    @Override
    public void removeFileAll(int postNo) throws Exception {
        sqlSession.delete("fileboard.fileDelete", postNo);
    }
    @Transactional
    @Override
    public void updateFileboard(FileVO fileboard) throws Exception {
        FileBoard board = fileboard.getFileBoard();
        List<FileDTO> fileList = fileboard.getFileList();
        sqlSession.update("fileboard.fileboardUpdate", board);
//        FileBoard latestBoard = sqlSession.selectOne("fileboard.latestFileboard");
        for(FileDTO file:fileList) {
//            file.setPostNo(latestBoard.getPostNo());
            sqlSession.update("fileboard.fileUpdate", file);
        }
    }
}
