package com.testspring.test17.web.lineBoard.DAO;

import com.testspring.test17.web.lineBoard.DTO.LineBoardDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
@Repository
@Mapper
public interface ILineBoardDao{
    List<LineBoardDTO> boardList(HashMap<String, String> params);

    int getBoardCnt();

    LineBoardDTO getLogin(HashMap<String, String> params);

    int addLineBoard(HashMap<String, String> params);

    int deleteLineBoard(HashMap<String, String> params);

    int updateLineBoard(HashMap<String, String> params);
}
