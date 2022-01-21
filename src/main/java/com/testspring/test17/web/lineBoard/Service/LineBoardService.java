package com.testspring.test17.web.lineBoard.Service;

import com.testspring.test17.web.lineBoard.DAO.ILineBoardDao;
import com.testspring.test17.web.lineBoard.DTO.LineBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class LineBoardService{
    @Autowired
    public  ILineBoardDao iLineBoardDao;

    public LineBoardDTO getLogin(HashMap<String, String> params) throws Throwable {
        return iLineBoardDao.getLogin(params);
    }

    public List<LineBoardDTO> boardList(HashMap<String, String> params)throws Throwable{
        return iLineBoardDao.boardList(params);
    }

    public int getBoardCnt()throws Throwable {
        return iLineBoardDao.getBoardCnt();
    }

    public int addLindBoard(HashMap<String, String> params)throws Throwable {
        return iLineBoardDao.addLineBoard(params);
    }

    public int deleteLineBoard(HashMap<String, String> params)throws Throwable {
        return iLineBoardDao.deleteLineBoard(params);
    }

    public int updateLineBoard(HashMap<String, String> params)throws Throwable {
        return iLineBoardDao.updateLineBoard(params);
    }
}
