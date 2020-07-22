package erp.work;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.Receiver;
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

import com.google.gson.Gson;

@Controller
@RequestMapping(value="/work/*" , method={RequestMethod.GET, RequestMethod.POST})  // postMapping, getMapping , deleteMapping, method = "get" , "post"
public class WorkController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired(required=false)
	private WorkLogic workLogic = null;
	
	@Autowired(required=false)
	HttpSession session = null;
	int result = 0 ;
	String path = null;
	
	
	@GetMapping("workAgree")
	public String workAgree(@RequestParam Map<String,Object> pMap) {
		//결재 승인 insert here
		logger.info("Controller workAgree 호출 성공");
		String result_accept = null;
		//pMap.put("emp_no", 10001);
		pMap.put("emp_no", session.getAttribute("emp_no"));
		result_accept = workLogic.workAgree(pMap);
		logger.info("pMap.get('ap_no') : " +pMap.get("ap_no"));
		logger.info("session : " + session.getAttribute("emp_no"));
		if(result_accept.equals("1")) {
			path = "redirect:approval_my.jsp";
		}else {
			path = "redirect:errorPage.jsp";
		}
		return path;
	}

	@GetMapping("workAgreeAndroid")
	public String workAgreeAndroid(@RequestParam Map<String,Object> pMap) {
		//결재 승인 insert here
		logger.info("Controller : 결재 승인 호출 성공");
		String result_accept = workLogic.workAgree(pMap);
		return "redirect:./result.jsp?result="+result_accept;
	}
	
	@GetMapping("workDenyAndroid")
	public String workDenyAndroid(@RequestParam Map<String,Object> pMap) {
		//결재 기각 insert here
		logger.info("Controller : 결재 기각 호출");
		String result_deny = workLogic.workDeny(pMap);
		return "redirect:./result.jsp?result="+result_deny;
	} 
	
	@GetMapping("workDeny")
	public String workDeny(@RequestParam Map<String,Object> pMap) {
		//결재 기각 insert here
		pMap.put("emp_no", session.getAttribute("emp_no"));
     	String result_deny = workLogic.workDeny(pMap);
		if(result_deny.equals("1")) {
			path = "redirect:approval_my.jsp?result=결재성공";
		}else if(result_deny.equals("결재가 마감된 문서입니다.")){
			path = "redirect:approval_my.jsp?result=결재가 마감된 문서입니다.";
		}
		else {
			path = "redirect:errorPage.jsp";
		}
		return path;
	}
	
	@GetMapping("workAddSendDoc")
	public String workAddSendDoc(@RequestParam Map<String,Object> pMap) {
		//결재 신청 이벤트 탭 insert here
		logger.info("Controller : 결재 신청 호출 성공");
		Map<String,Object> rMap = null;
		for(int i=0; i<pMap.size(); i++) {
			logger.info(pMap.keySet().toArray()[i] +" : "+ pMap.get(pMap.keySet().toArray()[i]));
		}
		int ap_no = workLogic.getSeqAr();
		pMap.put("ap_no", ap_no);
		result = workLogic.workAddDoc(pMap); 
	if(result == 1) {
			String[] receiver = ((String)pMap.get("ap_receiver")).split(",");
		for(int i=0; i<receiver.length; i++) {
			logger.info(receiver[i]);
		}
		int count = 0;   //성공시 증가
		for(int i=0; i<receiver.length; i++) { //수신자만큼반복
		rMap = new HashMap<>();  //Map 생성
		rMap.put("emp_no", receiver[i]); //수신자 pk 담기
		logger.info("테스트 : " + pMap.get("emp_no"));
		rMap.put("ap_no", ap_no); //수신 문서번호담기
		logger.info("테스트 : " + pMap.get("ap_no"));
		rMap.put("ap_count", pMap.get("ap_count"));
		logger.info("테스트 : " + pMap.get("ap_count"));
		String str_count = workLogic.workAddSendDoc(rMap);
		logger.info("str_count : " + str_count);	
			if(str_count.equals("1")) {
				count++;
			}
		}//end of for문
		if(count == receiver.length) { //만약 수신자수 만큼 성공을 했으면
			path = "redirect:approval_my.jsp";
		}
		else {
			path = "redirect:errorPage.jsp";
		}
	}
	else {
		path = "redirect:errorPage.jsp";
	}
/////////////////////////  테스트 코드   //////////////////////
		/*
				//결재테이블에 등록하기
		pMap=new HashMap<>();
		pMap.put("fr_no", 1);
		pMap.put("ap_title", "[휴가]연차휴가 나갑니다.");
		pMap.put("ap_state", "결재대기");
		pMap.put("ap_reporter", "10001");
		pMap.put("ap_appdate", "2020-06-20");
		pMap.put("ap_closedate", "2020-06-21");
		pMap.put("ap_content", "문서내용입니다");
		pMap.put("ap_dname", "개발부");
		pMap.put("ap_retiredate", "2011-06-05");
		pMap.put("ap_contact", "010-1234-5678");
		pMap.put("ap_prosessingdate", "2020-06-01 ~ 2020-06-05");
		pMap.put("ap_instructions", "지시사항 내용입니다.");
		pMap.put("ap_bego", "비고 내용입니다.");
		pMap.put("ap_sign", "기각.png");
		result = workLogic.workAddDoc(pMap);
		System.out.println(result);
		
		        //등록된 결제문서 수신자에게 뿌려주기
		String[] receiver = "10001,10002,20003".split(",");
		int count = 0;
		for(int i=0; i<receiver.length;i++) {
		pMap = new HashMap<>();
		pMap.put("emp_no",receiver[i]); //수신자 pk담기
		pMap.put("ap_no",3); //수신될 문서번호 담기
		pMap.put("count",receiver.length); //수신자수 담기
		String str_count = workLogic.workAddSendDoc(pMap);
		if(str_count.equals("1")) {
			count++;
		}
		}
		if(count == receiver.length) {//만약 수신자수만큼 성공을했으면
		path="redirect:xxx.jsp";
		}
		else {path="redirect:errorPage.jsp";}
		*/
		return path;
	}
	
	@GetMapping("workUpdEmp")
	public String workUpdEmp(@RequestParam Map<String,Object> pMap) {
		//정보수정 저장버튼 눌렀을 경우
		logger.info("Controller의 수정 저장버튼 눌렀을 경우");
		result = workLogic.workUpdEmp(pMap);
		if(result ==1 ) {
			path = "redirect:../work/emp_manage.jsp";
		}else {
			path = "redirect:errorPage.jsp";
		}
		///////////////////////  테스트 코드   /////////////////////
		/*
		pMap = new HashMap<>(); 
		pMap.put("emp_no", 10008);
		pMap.put("emp_name", "손오공");
		pMap.put("emp_resnum", "960121-1023312");
		pMap.put("emp_photo", "test12.png");
		pMap.put("emp_pw", "1234");
		pMap.put("emp_phone", "010-1234-5678");
		pMap.put("emp_email", "dhrhd@naver.com");
		pMap.put("emp_gender", "남");
		pMap.put("dept_no", 10);
		pMap.put("emp_extend", "466-4516");
		pMap.put("emp_position", "인사1팀사원");
		pMap.put("emp_salary", 2900);
		pMap.put("emp_hiredate", "2017-03-01");
		pMap.put("emp_retiredate", "");
		pMap.put("emp_state", "정상");
		pMap.put("emp_address", "경기도 안양시 만안구 박달로121");
		pMap.put("emp_zipcode", "13525");
		pMap.put("emp_detailaddress", "떙떙이 아파트 100동 100호");
		pMap.put("emp_bank", "신한은행");
		pMap.put("emp_account", "110-45672-23544");
		result = workLogic.workUpdEmp(pMap); 
		if(result==1) {path="redirect:xxx.jsp";}
		else {path="redirect:errorPage.jsp";}
		*/
		return path;
	}
	
	@GetMapping("workAddEmp")
	public String workAddEmp(@RequestParam Map<String,Object> pMap) {
		//신규사원 등록 이벤트 탭. insert here 
		result = workLogic.workAddEmp(pMap);
		if(result == 1 ) {
			path = "redirect:../work/emp_manage.jsp";
		}
		else {
			path = "redirect:errorPage.jsp";
		}
/////////////////////////  테스트 코드   /////////////////////
		/*
		pMap = new HashMap<>(); 
		pMap.put("emp_no", 40002);
		pMap.put("emp_name", "test");
		pMap.put("emp_resnum", "960121-1023312");
		pMap.put("emp_photo", "test12.png");
		pMap.put("emp_pw", "1234");
		pMap.put("emp_phone", "010-1234-5678");
		pMap.put("emp_email", "test13@naver.com");
		pMap.put("emp_gender", "남");
		pMap.put("dept_no", 40);
		pMap.put("emp_extend", "466-4516");
		pMap.put("emp_position", "인사사원");
		pMap.put("emp_salary", 2800);
		pMap.put("emp_hiredate", "2020-01-01");
		pMap.put("emp_retiredate", "");
		pMap.put("emp_state", "재직");
		pMap.put("emp_address", "경기도 안양시 만");
		pMap.put("emp_zipcode", "13525");
		pMap.put("emp_detailaddress", "떙떙이 아파트 100동");
		pMap.put("emp_bank", "신한은행");
		pMap.put("emp_account", "110-45672-23544");
		result = workLogic.workAddEmp(pMap);
		if(result==1) {path="redirect:xxx.jsp";}
		else {path="redirect:errorPage.jsp";}
		*/
		return path;
	}
	
	@GetMapping("workAddBranch")
	public String workAddBranch(@RequestParam Map<String,Object> pMap) {
	//지사 등록 insert here
		logger.info("Controller : 지사 등록 호출 성공");			
		result = workLogic.workAddBranch(pMap); 
		if(result == 1) {
			path = "redirect:success.jsp";
		}else {
			path = "redirect:dispatcherfail.jsp";
		}
///////////////////////  테스트 코드   /////////////////////
		/*
		pMap = new HashMap<>(); 
		pMap.put("DL_LATITUDE", 37.4031039459546);
		pMap.put("DL_LONGITUDE", 126.783059388399);
		pMap.put("DL_NAME", "현대자동차");
		pMap.put("DL_TEL", "02-456-1234");
		pMap.put("DL_ADDRESS", "경기도 안양시 동안구");
		result = workLogic.workAddBranch(pMap);
		if(result==1) {path="redirect:xxx.jsp";}
		else {path="redirect:errorPage.jsp";}
		*/	
		return path;
	}
	
	@GetMapping("addDeptSch")
	public String addDeptSch(@RequestParam Map<String,Object> pMap) {
		//부서일정 추가하기
		logger.info("부서일정 추가버튼 호출");
		pMap.put("emp_no", session.getAttribute("emp_no"));
		for(int i=0; i<pMap.size(); i++) {
			String key = (String)pMap.keySet().toArray()[i];
			logger.info(key+"="+pMap.get(key));
		} 
		String add_result = workLogic.deptAddSchedule(pMap);
		logger.info("일정등록 성공 여부=>"+add_result);
		if(add_result.equals("1")) {
			path = "redirect:deptSchedule.jsp";
		}else {
			path = "redirect:errorPage.jsp";
		}
///////////////////////  테스트 코드   /////////////////////
		/*
		pMap = new HashMap<>();
		pMap.put("emp_no", 10001);
		pMap.put("ds_title", "일정 제목");
		pMap.put("ds_memo", "메모 내용");
		pMap.put("ds_sdate", "2020-06-22 18:00");
		pMap.put("ds_edate", "2020-06-22 19:00");
		pMap.put("ds_type", "인사부");
		pMap.put("ds_allday", "false");
		pMap.put("ds_bgcolor", "#ffdd33");
		String add_result = workLogic.deptAddSchedule(pMap);
		System.out.println("부서일정 등록 성공 여부=>"+add_result);
		if(add_result.equals("1")) {path="redirect:xxx.jsp";}
		else {path="redirect:errorPage.jsp";}
		*/
		return path;
	}
	
	@GetMapping("updDeptSch")
	public String updDeptSch(@RequestParam Map<String,Object> pMap) {
	//부서일정 변경하기
	logger.info("부서일정 수정버튼 호출");
	pMap.put("emp_no", session.getAttribute("emp_no"));
	for(int i=0; i<pMap.size(); i++) {
		String key = (String)pMap.keySet().toArray()[i];
		logger.info(key+"="+pMap.get(key));
	}
	String upd_result = workLogic.deptUpdSchedule(pMap);
	logger.info("일정등록 성공 여부=>" + upd_result);
	if(upd_result.equals("1")) {
		path = "redirect:deptSchedule.jsp";
	}else {
		path = "redirect:deptScheduleUpderrorPage.jsp";
	}
///////////////////////  테스트 코드   /////////////////////
	/*
	pMap = new HashMap<>();
	pMap.put("emp_no", 10001);
	pMap.put("ds_title", "일정 제목");
	pMap.put("ds_memo", "메모 내용");
	pMap.put("ds_sdate", "2020-06-22 18:00");
	pMap.put("ds_edate", "2020-06-22 19:00");
	pMap.put("ds_type", "인사부");
	pMap.put("ds_allday", "false");
	pMap.put("ds_bgcolor", "#ffdd33");
	pMap.put("ds_no", 4);
	String upd_result=workLogic.deptUpdSchedule(pMap);
	System.out.println("부서일정 수정 성공 여부=>"+upd_result);
	if(upd_result.equals("1")) {path="redirect:xxx.jsp";}
	else {path="redirect:errorPage.jsp";}
	*/
	return path;
	}
	
	@GetMapping("delDeptSch")
	public String delDeptSch(@RequestParam Map<String,Object> pMap) {
		//부서일정 삭제하기
		logger.info("부서일정 삭제버튼 호출");
		pMap.put("emp_no", session.getAttribute("emp_no"));
		result = workLogic.deptDelSchedule(pMap);
		if(result == 1) {
			path = "redirect:deptSchedule.jsp";
		}else {
			path = "redirect:deptScheduleDelerrorPage.jsp";
		}
		///////////////////////  테스트 코드   /////////////////////
		/*
		pMap = new HashMap<>();
		pMap.put("emp_no", 10001);
		pMap.put("ds_no",4); 
		int del_result = 0;
		del_result = workLogic.deptDelSchedule(pMap);
		System.out.println("개인 일정 삭제 처리 결과 : "+del_result);
		if(del_result==1) {path="redirect:xxx.jsp";}
		else {path="redirect:errorPage.jsp";}
		*/
		return path;
	}
	
	@GetMapping("deptEmp")
	public String deptEmp(Model model, @RequestParam Map<String,Object> pMap) {
	//부서일정 insert here
		logger.info("Controller : 부서일정 사원 이름 조회 호출 성공");
		List<Map<String,Object>> list = new ArrayList<>();
		pMap.put("emp_no", session.getAttribute("emp_no"));
		list = workLogic.deptEmp(pMap);
		logger.info("list.size() : " + list.size());
		model.addAttribute("deptEmpList",list);
	return "forward:deptSchedule.jsp";
	}
	
	@GetMapping("workSelectEmp")
	public String workSelectEmp(Model model,@RequestParam Map<String,Object> pMap) {////성공   //인사탭->재직사원조회->정보수정 버튼 
		//정보수정 이벤트 탭 insert here
		logger.info("Controller : 인사 정보수정 이벤트 호출 성공");
		//pMap.put("emp_no", 10001); //테스트코드
		List<Map<String,Object>> list = null;
		list = workLogic.workSelectEmp(pMap);
		logger.info("사원에 대한 정보=> " +list.size());
		model.addAttribute("workEmpList",list);
		logger.info("list : " + list);
		return "forward:emp_edit_all.jsp";
	}
	
	@GetMapping("outsideWorker")
	public String outsideWorker(Model model) {
		//파견사원 조회 
		logger.info("Controller : 파견사원 조회 탭 호출");
		List<Map<String,Object>> list = new ArrayList<>();
		list = workLogic.outsideWorker();
		model.addAttribute("dispatchList",list);
		return "forward:outsideWorker.jsp";
	}
	
	@GetMapping("emp_organization")
	public String emp_organization(Model model,@RequestParam Map<String,Object> pMap) {
		//인사조직도  insert here
		logger.info("Controller : 인사조직도 호출 성공");
		List<Map<String,Object>> list = null;
		list =  workLogic.personManageMent(pMap);
		Gson g = new Gson();
		String imsi = g.toJson(list);
		model.addAttribute("imsi",imsi);
		return "forward:emp_organization.jsp";
	}
	
	@PostMapping("outsideSEL")
	public String outsideSEL(Model model,@RequestParam Map<String,Object> pMap) {
		//파견사원버튼 조회
		logger.info("Controller : 파견사원 조회 버튼 호출");
		List<Map<String,Object>> list = workLogic.outsideSEL(pMap);
		model.addAttribute("outsideWorker",list);
		return "work/outsideworker";
	}
	
	@GetMapping("branchList")
	public String branchList(Model model,@RequestParam Map<String,Object> pMap) {
		 //지사관리 insert here
		 logger.info("Controller : 지사관리 호출 성공");
		 List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		 list = workLogic.branchList(pMap); 
		 model.addAttribute("outsideWorkPlace",list);
		 return "work/outsideWorkPlace";
	}
	
	@GetMapping("empList")
	public String empList(Model model , @RequestParam Map<String,Object> pMap) {
		//사원조회 insert here
		logger.info("Controller : 사원관리 호출 성공");
		List<Map<String,Object>> list = new ArrayList();
		list = workLogic.empList(pMap);
		model.addAttribute("empList",list);
		return "work/jsonEmpList2";
	}
	
	@GetMapping("empRetire")
	public String empRetire(Model model , @RequestParam Map<String,Object> pMap) {
		//퇴직사원조회 insert here
		logger.info("Controller : 퇴직사원관리 호출 성공");
		List<Map<String,Object>> list =  new ArrayList<>();
		list = workLogic.empRetire(pMap);
		model.addAttribute("empRetireList",list);
		return "work/jsonEmpListOff";
	}
	
	@GetMapping("deptSchedule")
	public String deptSchedule(Model model,@RequestParam Map<String,Object> pMap) {
		//부서일정 insert here
		logger.info("Controller : 부서일정 호출 성공");
		/////////////////////// 실제 코드    /////////////////////
		List<Map<String,Object>> list = new ArrayList<>();
		pMap.put("emp_no", session.getAttribute("emp_no"));
		//pMap.put("emp_no", 10001);
		//pMap.put("dept_day",req.getParameter("dept_day"));
		list = workLogic.deptSchedule(pMap);
		model.addAttribute("deptScheduleList",list);
		return "work/jsonDeptSchedule";
	}
	
	@GetMapping("app_get")
	public String app_get(Model model, @RequestParam Map<String,Object> pMap) {
		 //사원조회 insert here
        logger.info("Controller : 받은결재함 호출 성공");
        List<Map<String,Object>> list = new ArrayList();
        pMap.put("emp_no", session.getAttribute("emp_no"));
        list = workLogic.app_get(pMap);
        model.addAttribute("app_getList",list);
        return "work/jsonapp_getList";
	}
	
	@GetMapping("app_set")
	public String app_set(Model model, @RequestParam Map<String,Object> pMap) {
		//전자결재 insert here
		logger.info("Controller : 보낸 결재함 호출 성공");
		/////////////////////// 실제 코드    /////////////////////
		List<Map<String,Object>> list = new ArrayList();
		pMap.put("emp_no", session.getAttribute("emp_no"));
		list = workLogic.app_set(pMap);
		model.addAttribute("app_setList",list);
		return "work/jsonapp_setList";
	}
	
	@GetMapping("approval_send")
	public String approval_send(Model model, @RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> list = new ArrayList();
		list = workLogic.empList(pMap);
		logger.info("list " + list.size());
		model.addAttribute("prList",list);
		return "work/jsonEmpList";
	}
	
	@GetMapping("approval_form")
	public String approval_form(Model model, @RequestParam Map<String,Object> pMap) {
		//결재양식 insert here
		logger.info("Controller : 전자결재 양식 호출 성공");
		List<Map<String,Object>> list = new ArrayList<>();
		list = workLogic.signForm(pMap);
		model.addAttribute("formList",list);
		return "work/jsonFromList";
	}
	
	@GetMapping("nowempList")
	public String nowempList(Model model, @RequestParam Map<String,Object> pMap) {
		//재직사원 조회
		logger.info("Controller : 재직 사원 호출 성공");	
		/////////////////////// 실제 코드    /////////////////////
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = workLogic.nowempList(pMap);
		model.addAttribute("nowempList",list);
		return "work/jsonnowempList";
	}
	
	@GetMapping("log")
	public String log(Model model, @RequestParam Map<String,Object> pMap) {
		//재직사원 조회
		logger.info("Controller : 재직 사원 호출 성공");	
		/////////////////////// 실제 코드    /////////////////////
		List<Map<String,Object>> list = new ArrayList();
		list = workLogic.log(pMap);
		model.addAttribute("log",list);
		return "work/jsonLog";
	}
	
	@GetMapping("app_getAndroid")
	public String app_getAndroid(Model model, @RequestParam Map<String,Object> pMap) {
		//사원조회 insert here
		logger.info("Controller : 받은결재함 호출 성공");
		logger.info("테스트 : "+pMap.get("emp_no"));
		String imsi =pMap.get("emp_no").toString();
		Map<String,Object> parMap = new HashMap<>();
		parMap.put("emp_no", 10001);
		List<Map<String,Object>> list = new ArrayList<>();
		list = workLogic.app_get(parMap);
		model.addAttribute("app_getList",list);
		return "work/jsonapp_getList";
	}
	
	@GetMapping("app_setAndroid")
	public String app_setAndroid(Model model, @RequestParam Map<String,Object> pMap) {
		//전자결재 insert here
		logger.info("Controller : 보낸 결재함 호출 성공");
		/////////////////////// 실제 코드    /////////////////////
		List<Map<String,Object>> list = new ArrayList();
		list = workLogic.app_set(pMap);
		model.addAttribute("app_setList",list);
		return "work/jsonapp_setList";
	}
	

}
