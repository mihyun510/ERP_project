package erp.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping(value="/board/*" , method={RequestMethod.GET,RequestMethod.POST})
public class BoardController {
	Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired(required = false)
	private BoardLogic boardLogic = null;
	
	@Autowired(required = false)
	HttpSession session = null;
	
	//전체조회
	@GetMapping("boardList")
	 public String boardList(Model model, @RequestParam Map<String,Object> pMap) {
			logger.info("BoarController boardList 호출 성공");
			List<Map<String,Object>> mList = null;
			pMap.put("emp_no", session.getAttribute("emp_no"));
			mList = boardLogic.boardList(pMap);
			model.addAttribute("boardList", mList);
			return "forward:boardList.jsp";
	}
	
	//너 제목을 클릭했을때? 상세조회
	@GetMapping("boardDetail")
	public String boardDetail(Model model,@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> mList = null;
		List<Map<String,Object>> rList = null;
		//스프링에서는 넘어온 매개변수를 생성을 따로 안해줘도 되요..? 알아서 생성됨..?
//		 pMap.put("bm_no",Integer.parseInt(req.getParameter("bm_no")));
		 pMap.put("bm_no",Integer.parseInt(pMap.get("bm_no").toString()));
//		 pMap.put("bm_group",req.getParameter("bm_group"));
		 logger.info("bm_group:"+pMap.get("bm_group"));
		 int result = boardLogic.hitCount(pMap);
		 if(result == 1) {
			 mList = boardLogic.boardListDetail(pMap);
			 model.addAttribute("boardDetail", mList);
			 rList = boardLogic.boardListReply(pMap);
			 model.addAttribute("boardListReply", rList);
			 return "forward:boardReadForm.jsp";
		 }else {
			 return "redirect:board/boardList";
		 }
	}
	
	//댓글쓰기를 눌렀을때
	@GetMapping("boardINSReply")
	 public String boardINSReply(Model model, @RequestParam Map<String,Object> pMap) {
		 logger.info("BoardController boardINSReply호출 성공");
		 Calendar cal = Calendar.getInstance();
		 int year = cal.get ( cal.YEAR );
		 int month = cal.get ( cal.MONTH ) + 1 ;
		 int day = cal.get ( cal.DATE ) ;
		 String date = year+"-"+month+"-"+day;
		 int result =0; 
		 String path = null;
		 
		 pMap.put("emp_no", session.getAttribute("emp_no"));
		 pMap.put("bm_pos", pMap.get("bm_pos"));
		 pMap.put("bm_group", pMap.get("bm_group"));
		 pMap.put("bm_date", date);
		 pMap.put("bm_content", "댓글");
		 pMap.put("bm_hit", 0);
		 System.out.println("controllerbm_no: "+pMap.get("bm_no"));
		 System.out.println("controllertitle: "+pMap.get("bm_title"));
		 System.out.println("controllerbm_group: "+pMap.get("bm_group"));
		 result = boardLogic.boardINS(pMap);
		 if(result==1) {
			 //model.addAttribute("boardListReply", pMap);
			 path = "forward:boardListReply";
		 }
		 else if(result ==0) path = "redirect:boardInsFail.jsp";
		 return path;
	 }
	 
	 //댓글가져오기
	@GetMapping("boardListReply")
	public String boardListReply(Model model, @RequestParam Map<String,Object> pMap) {
		 logger.info("BoardController boardListReply호출 성공");
		 //Map<String, Object> rMap = new HashMap<String, Object>();
		 //rMap =(Map<String, Object>) model.getAttribute("boardListReply");
		 //rMap = HashMapBuilder.hashMapBuilder(req.getParameterMap());
		 List<Map<String, Object>> rList = null;
		 rList = boardLogic.boardListReply(pMap);
		 model.addAttribute("boardListReply", rList);
		 return "board/jsonboardListReply";
	 }
	
	//너 수정하려구?
	@GetMapping("boardUPD")
	public String boardUPD(@RequestParam Map<String,Object> pMap) {
		int result =0;
		String path = null;
		pMap.put("emp_no", session.getAttribute("emp_no"));
		System.out.println("emp_no:"+pMap.get("emp_no"));
		System.out.println("bm_title:"+pMap.get("bm_title"));
		System.out.println("bm_content:"+pMap.get("bm_content"));
		result = boardLogic.boardUPD(pMap);
		if(result==1) path="redirect:boardUpdOk.jsp";
		else if(result ==0) path="redirect:boardUpdFail.jsp";
		return path;
	}
	
	//너 글 삭제하려구?
	@GetMapping("boardDEL")
	public String boardDEL(@RequestParam Map<String,Object> pMap) {
		System.out.println("삭제 보드 컨트롤러 호출 성공");
		int result =0;
		int sresult = 0;
		int rresult = 0;
		String path = null;
		List<Map<String, Object>> rlist = null;
		pMap.put("emp_no", session.getAttribute("emp_no"));
		if(pMap.get("bs_file").equals("첨부된 파일이 없습니다.")) {
			rlist = boardLogic.boardListReply(pMap);
			if(rlist != null && rlist.size()>0) {
				rresult = boardLogic.replyDEL(pMap);
			}
			result = boardLogic.boardDEL(pMap); //게시글삭제
		}else {
			sresult = boardLogic.boardDELFile(pMap); //첨부파일 먼저 삭제
			if(sresult == 1) {
				if(rlist != null && rlist.size()>0) {
					rresult = boardLogic.replyDEL(pMap);
				}
				result = boardLogic.boardDEL(pMap);
			} else if(sresult == 0){
				path="redirect:boardDelFail.jsp";
			}
		}
		if(result==1) path="redirect:boardDelOk.jsp";
		else if(result ==0) path="redirect:boardDelFail.jsp";	
		return path;
	}
	
	 //너 댓글 삭제하려구?
	@GetMapping("replyDEL")
	public String replyDEL(@RequestParam Map<String,Object> pMap) {
		int result =0;
		String path = null;
		pMap.put("emp_no", session.getAttribute("emp_no"));
		result = boardLogic.replyDEL(pMap);
		if(result==1) path="redirect:boardDelOk.jsp";
		else if(result ==0) path="redirect:boardDelFail.jsp";	
		return path;
	}
	
	@PostMapping("boardINS")
	public String uploadAction(MultipartHttpServletRequest uploadFile, @RequestParam Map<String,Object> pMap, Model model) {
		String path2 = null;
		String original = null;
		long uploadSize = 0;
		if(uploadFile.getFile("bs_file") != null) {
		String path1 = "C:\\workspace_erp4\\booterp\\src\\main\\webapp\\pds\\";
		MultipartFile mpFile = uploadFile.getFile("bs_file");
		original = mpFile.getOriginalFilename();
		String uploadPath = path1+original;
		uploadSize = mpFile.getSize();
			logger.info("====================================================");
			logger.info("파일명 : " + mpFile.getOriginalFilename());
			logger.info("파일 크기 : " + mpFile.getSize());
			try {
				mpFile.transferTo(new File(uploadPath));
			}catch (Exception e) {
				e.printStackTrace();
			}
			Calendar cal = Calendar.getInstance();
			int year = cal.get ( cal.YEAR );
			int month = cal.get ( cal.MONTH ) + 1 ;
			int day = cal.get ( cal.DATE ) ;
			String date = year+"-"+month+"-"+day;
			int result =0; 
				
			pMap.put("emp_no", session.getAttribute("emp_no"));
			pMap.put("bm_date", date);
			pMap.put("bs_file",original);
			pMap.put("bs_size", uploadSize);
			result = boardLogic.boardINS(pMap);
			if(result==1) path2 = "forward:boardList";
			else if(result ==0) path2 = "redirect:boardInsFail.jsp";
		}
		else {
			Calendar cal = Calendar.getInstance();
			int year = cal.get ( cal.YEAR );
			int month = cal.get ( cal.MONTH ) + 1 ;
			int day = cal.get ( cal.DATE ) ;
			String date = year+"-"+month+"-"+day;
			int result =0; 
				
			pMap.put("emp_no", session.getAttribute("emp_no"));
			pMap.put("bm_date", date);
			result = boardLogic.boardINS(pMap);
			if(result==1) {
				path2 = "forward:boardList";
			}
			else if(result ==0) {
				path2 = "redirect:boardInsFail.jsp";
			}
		}
		return path2;
	}
	
	@GetMapping("downLoad")
	public String downLoad(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   String b_file = request.getParameter("bs_file");
		   String fname = b_file;
		   PrintWriter out = response.getWriter();
		   //out.print("b_file: 8->euc"+b_file);      
		   //out.print("<br>");      
		   String filePath = "C:\\workspace_erp4\\booterp\\src\\main\\webapp\\pds\\"; // 절대경로.   
		   //파일이름만을 객체화 시켜줌, 파일 크기
		   //a.txt파일자체를[이름] 객체화 시켜줌. 안에 내용은 따로 처리해야 됨.
		   File file = new File(filePath,b_file.trim());
		   
//		    String mimeType = getServletContext().getMimeType(file.toString());
		    String mimeType = null;
		   
		    //브라우저는 모르는 마임 타입에 대해서는 무조건 다운로드 처리함.
		    if(mimeType == null){
		      response.setContentType("application/octet-stream");
		   }
		   String downName = null;
		   if(request.getHeader("user-agent").indexOf("MSIE")==-1){
		      downName = new String(b_file.getBytes("UTF-8"),"8859_1");
		   }else{
		      downName = new String(b_file.getBytes("EUC-KR"),"8859_1");
		   }
		      response.setHeader("Content-Disposition", "attachment;filename="+downName);
		    FileInputStream fis = new FileInputStream(file);
		   ServletOutputStream sos = null;
		   PrintWriter pwout = response.getWriter();
		   try{
			   //out.clear();
			   //out=pageContext.pushBody();
			   sos = response.getOutputStream();
		      byte b[] = new byte[1024*10];
		      int data = 0;
		      while((data=(fis.read(b,0,b.length)))!=-1){
//		         sos2.write(b,0,data);
		         sos.write(b,0,data);
		      }
		      fis.close();
		      sos.flush();   
		   }catch(Exception e){
		      out.print(e.toString());
		   }finally{
		      if(sos != null) sos.close();
		      if(fis != null) fis.close();
		   }		
		return "forward:boardList";
	}	
	
}
