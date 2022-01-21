package com.testspring.test17.test.Service;

import com.testspring.test17.test.DTO.TestDTO;
import com.testspring.test17.test.Mapper.TestMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    public TestMapper mapper;

    public List<TestDTO> selectTest(){
/*        logger.trace("Trace level 테스트");
        logger.debug("DEBUG Level 테스트");
        logger.info("INFO Level 테스트");
        logger.warn("warn Level 테스트");
        logger.error("ERROR Level 테스트");*/
        return mapper.selectTest();
    }
}
