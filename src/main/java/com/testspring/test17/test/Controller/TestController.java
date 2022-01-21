package com.testspring.test17.test.Controller;

import com.testspring.test17.common.bean.PagingBean;
import com.testspring.test17.common.service.IPagingService;
import com.testspring.test17.test.DTO.TestDTO;
import com.testspring.test17.test.Service.TestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class TestController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    TestService testService;

    @Autowired
    public IPagingService iPagingService;

    @RequestMapping(value = "/test")
    public ModelAndView test(@RequestParam HashMap<String, String> params) throws Exception {
        ModelAndView mav = new ModelAndView("test");
        List<TestDTO> testList = testService.selectTest();
        System.out.println(testList);

        int page = 1;

        if (params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }
        PagingBean pb = iPagingService.getPagingBean(page, 5);
        params.put("startCnt", "1");
        params.put("endCnt", "5");

        mav.addObject("list", testList);
        mav.addObject("page", page);
        mav.addObject("pb", pb);

        return mav;
    }

}
