package com.testspring.test17.test.Mapper;

import com.testspring.test17.test.DTO.TestDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TestMapper {
    List<TestDTO> selectTest();
}
