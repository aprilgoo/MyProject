package bmu.sample.controller;

import java.util.Map;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bmu.sample.service.SampleService;


@Controller
// Controller 객체 선언
// 웹 클라이언트에서 들어온 요청을 해당 비즈니스 로직을 호출하고,
// 수행결과와 함께 응답을 해주는 Dispatcher 역할을 한다
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	// Log4j 로그를 선언

		
	@Resource(name="sampleService")
    private SampleService sampleService;
	// Service 영역의 접근을 위한 선언
	// 필요한 bean을 수동으로 등록(sampleService)
     
    @RequestMapping(value="/sample/openSampleBoardList.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");
         
        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
        mv.addObject("list", list);
        //서비스 로직의 결과를 ModelAndView 객체에 담아서 클라이언트(.jsp)에서 결과를 사용할 수
        //있도록 함
        //map과 똑같이 키와 값으로 구성
         
        return mv;

    }
	
}