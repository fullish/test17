package com.testspring.test17.web.lineBoard.Controller;

import com.testspring.test17.common.bean.PagingBean;
import com.testspring.test17.common.service.IPagingService;
import com.testspring.test17.util.Utils;
import com.testspring.test17.web.lineBoard.DTO.LineBoardDTO;
import com.testspring.test17.web.lineBoard.Service.LineBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.xml.ws.Service;
import java.util.HashMap;
import java.util.List;

@Controller
public class LineBoardController {
    @Autowired
    LineBoardService lineBoardService;

    @Autowired
    public IPagingService ipagingService;

    @RequestMapping(value = "/")
    public ModelAndView lineBoard(@RequestParam HashMap<String, String> params) throws Throwable {
        int page = 1;
        int cnt = lineBoardService.getBoardCnt();
        if (params.get("page") != null) {
            page = Integer.parseInt(params.get("page"));
        }
        PagingBean pb = ipagingService.getPagingBean(page, cnt, 5, 5);
        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));
//        params.put("startCnt", Integer.toString(pb.getStartCount()));
//        params.put("endCnt", Integer.toString(pb.getEndCount()));

        ModelAndView mav = new ModelAndView("lineBoard/lineBoard");
        List<LineBoardDTO> list = lineBoardService.boardList(params);

        System.out.println(list);
        System.out.println(cnt);
        System.out.println(pb.getStartCount());
        System.out.println(pb.getEndCount());
        System.out.println(params);

        mav.addObject("list", list);
        mav.addObject("page", page);
        mav.addObject("pb", pb);

        return mav;
    }

    @RequestMapping(value = "/login")
    public ModelAndView login (HttpSession session){
        ModelAndView mav = new ModelAndView("lineBoard/login");
             if (session.getAttribute("sMNo") != null){
                 mav.setViewName("redirect:/");
             }else {
                 mav.setViewName("lineBoard/login");
             }
        return mav;
    }

    @RequestMapping(value = "/logins")
    public ModelAndView logins(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {

/*        String m_pw = Utils.encryptAES128(params.get("m_pw"));
        params.put("m_pw", m_pw);*/

        LineBoardDTO data = lineBoardService.getLogin(params);

        if (data != null) {
            session.setAttribute("sMNo", data.getM_no());
            session.setAttribute("sMNm", data.getM_nm());
            System.out.println(session.getAttribute("sMNm"));
            mav.setViewName("redirect:/");
        } else {
            mav.addObject("msg", "아이디나 비밀번호가 틀립니다.");
            mav.setViewName("failedAction");
        }
        return mav;
    }
    @RequestMapping(value ="/lineBoardAdd")
    public ModelAndView lineBoardAdd(@RequestParam HashMap<String, String> params, ModelAndView mav)throws Throwable{
        int cnt = lineBoardService.addLindBoard(params);

        if (cnt > 0){
            mav.setViewName("redirect:/");
        }else {
            mav.addObject("msg", "글 작성에 문제가 발생하였습니다.");
            mav.setViewName("failedAction");
        }
        return mav;
    }
    @RequestMapping(value ="/lineBoardDelete")
    public ModelAndView lineBoardDelete(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
        int cnt = lineBoardService.deleteLineBoard(params);

        if (cnt > 0){
            mav.setViewName("redirect:/");
        }else {
            mav.addObject("msg", "삭제중 문제가 발생하였습니다.");
            mav. setViewName("failedAction");
        }
        return mav;
    }
    @RequestMapping(value = "/lineBoardUpdate")
    public  ModelAndView lineBoardUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
        int cnt = lineBoardService.updateLineBoard(params);

        if (cnt > 0){
            mav.setViewName("lineBoard/lineBoardUpdate");
        } else {
            mav.addObject("msg", "글 수정에 문제가 발생하였습니다.");
            mav.setViewName("failedAction");
        }
        return mav;
    }
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session, ModelAndView mav){
        session.invalidate(); //세션 정보 초기화
        mav.setViewName("redirect:login");
        return mav;
    }
}
