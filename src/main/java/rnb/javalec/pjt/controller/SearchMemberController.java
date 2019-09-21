package rnb.javalec.pjt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import rnb.javalec.pjt.exception.UserNotFoundException;
import rnb.javalec.pjt.service.MemberService;
import rnb.javalec.pjt.vo.User;

@Controller
public class SearchMemberController {
 
	private static final Logger logger = LoggerFactory.getLogger(SearchMemberController.class);

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/testID")
	public String testID(HttpServletRequest request) throws Exception {
		
		String type = request.getParameter("type");
		if("error".equals(type)) {
			throw new UserNotFoundException("조회하신 회원명이 존재하지 않습니다.");
		}
		
		return "testID";
	}
	
	
	//검색창 뷰
		@RequestMapping("/searchMember")
		public String searchFood() {
			
			
			return "member/searchMember";
		}
	
		//임직원 검색목록 조회
		@RequestMapping(value = "/memberList", method = {RequestMethod.GET, RequestMethod.POST})
		public String meberList(HttpServletRequest request, Model model) throws Exception {
		
			logger.info("name: "+request.getParameter("mname"));
		
			List<User> member =memberService.selectMembers(request, model);
			
			model.addAttribute("member", member);
			
			return "member/memberList";
		}
		
		//임직원 등록 뷰
		@RequestMapping("/memberWriteView")
		public String memberWriteView() {
			
			
			return "member/memberWriteView";
		}
		
		// 임직원 등록
		@RequestMapping(value="/memberWrite", method = RequestMethod.POST)
		public String memberWrite(User user, Model model) {
			
			logger.info(user.getUsername());
			logger.info(user.getPassword());
			logger.info(user.getMdepartment());
			logger.info(user.getMname());
			logger.info(user.getMloc());
	
			memberService.writeMember(user);
			
			return "redirect:/searchMember";
		}
		
		//임직원 상세조회
		@RequestMapping("/contentView")
		public String contentView(HttpServletRequest request, Model model ) {
		
			logger.info(request.getParameter("username"));
			memberService.contentView(request, model);
		
			return "member/contentView";
		}
		
		//임직원 정보 삭제
		@RequestMapping("/memberDelete")
		public String memberDelete(HttpServletRequest request, Model model ) {
		
			logger.info(request.getParameter("username"));
		
			memberService.deleteMember(request);
			
			
			return "redirect:/searchMember";
		}
		
		
		//임직원 정보 수정에 관한 비밀번호 화면 뷰
		@RequestMapping(value = "/modifyPasswordView", method=RequestMethod.POST)
		public String modifyPasswordView(User user, Model model) {
			
			logger.info(user.getMname());
			logger.info(user.getUsername());
			logger.info(user.getMdepartment());
			logger.info(user.getMloc());
			logger.info(user.getPassword());
			
			model.addAttribute("mpw", user);
			
			return "member/modifyPasswordView";
		}
		
		//임직원 정보 수정화면 뷰
		@RequestMapping(value ="/memberModifyView", method =RequestMethod.POST)
		public String memberUpdate(User user, HttpServletRequest request, Model model,RedirectAttributes rttr) {
			
			String password = request.getParameter("password1");
		
			
			if(passwordEncoder.matches(password, user.getPassword())) {
				logger.info("계정정보 일치");
				model.addAttribute("user", user);
				
			}else {
				logger.info("계정정보 불일치");
				
				rttr.addFlashAttribute("msg", "비밀번호가 맞지 않습니다.");
				return "redirect:/searchMember";
			}
		
			
			return "member/memberModifyView"; 
		}		
		
		@RequestMapping(value="/memberModify", method=RequestMethod.POST)
		public String memberModify(User user) {
			
		
			memberService.updateMember(user);
			
			return "redirect:/searchMember";
		}
		
		
		@RequestMapping(value="/idCheck/{id}", method=RequestMethod.GET)
		public @ResponseBody int idCheck(@PathVariable("id") String id){
			
			
			logger.info("id: " + id);
			
			
			int result=memberService.checkId(id);
			
			
			return result;
		}
		
}
