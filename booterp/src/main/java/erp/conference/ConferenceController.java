package erp.conference;

import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value="/conference/*", method={RequestMethod.GET, RequestMethod.POST})
public class ConferenceController{
	Logger logger = LoggerFactory.getLogger(ConferenceController.class);
	
	@Autowired(required = false)
	private ConferenceLogic conLogic = null;
	
	@Autowired(required = false)
	HttpSession session = null; 
	
		@GetMapping("conAddRoom")
		public String conAddRoom(@RequestParam Map<String,Object> pMap) {
			//회의실예약 insert here
			logger.info("ConferenceController[String] => 회의실예약 호출");
			/////////////////////// 실제 코드    /////////////////////
			//session.setAttribute("emp_no", 10001);
			pMap.put("emp_no", session.getAttribute("emp_no"));
			String result=conLogic.conAddRoom(pMap);
			if(result.equals("1"))
				return "redirect:NewFile.jsp"; 
			else return "redirect:conferenceInserror.jsp";
	}
			@GetMapping("conUpdRoom")
			public String conUpdRoom(@RequestParam Map<String,Object> pMap) {
			logger.info("ConferenceController[String] => 회의실예약수정 호출");
			/////////////////////// 실제 코드    /////////////////////
			pMap.put("emp_no", session.getAttribute("emp_no"));
			String result =conLogic.conUpdRoom(pMap);
			if(result.equals("1")) return "redirect:conference.jsp"; 
			else return "redirect:conferenceUpderror.jsp"; 
		}
			@GetMapping("conDelRoom")
			public String conDelRoom(@RequestParam Map<String,Object> pMap) {
			//회의실예약취소 insert here
			logger.info("ConferenceController[String] => 회의실예약취소 호출");
			/////////////////////// 실제 코드    /////////////////////
			pMap.put("emp_no", session.getAttribute("emp_no"));
			int del_res=conLogic.conDelRoom(pMap);
			if(del_res==1) return "redirect:conference.jsp"; 
			else return "redirect:conferenceDelerror.jsp"; 
		}		

			@GetMapping("allRes")
			public String allRes(Model model,@RequestParam Map<String, Object> pMap) {
					//회의실예약 insert here
					logger.info("ConferenceController[String] => 회의실예약탭  호출");
					List<Map<String,Object>> allResList = new ArrayList<>();
					allResList = conLogic.allRes(pMap);
				    System.out.println("회의실예약 리스트 => "+allResList.size());
				    model.addAttribute("allResList", allResList);
				    return "conference/jsonConferenceList";//
			}
}
