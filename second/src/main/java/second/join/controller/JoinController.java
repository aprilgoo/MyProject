package second.join.controller;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
import second.join.service.JoinService;

@Controller
public class JoinController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	public JoinService joinService;
	
	@RequestMapping(value="/join/insertJoinForm.do")
	public ModelAndView insertJoinForm(CommandMap commandMap) throws Exception  {
		ModelAndView mv = new ModelAndView("redirect:/index.jsp");
		
		joinService.insertJoinForm(commandMap.getMap());
		return mv;		
	}

}
