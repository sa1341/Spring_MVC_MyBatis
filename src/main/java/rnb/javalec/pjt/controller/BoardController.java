package rnb.javalec.pjt.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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

import rnb.javalec.pjt.service.BoardService;
import rnb.javalec.pjt.vo.Board;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired 
	BCryptPasswordEncoder passwordEncoder;
	

	@Autowired
	private BoardService boardService;
	
	//게시글 목록조회
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model, HttpSession session){
		
	
		boardService.getBoardList(request, model, session);


		return "board/list";
	}
	
	
	//게시글 검색 조회 및 페이징처리
		@RequestMapping(value="/boardSearch",method = {RequestMethod.GET, RequestMethod.POST})
		public String boardSearch(HttpServletRequest request, Model model, HttpSession session) {
			
			String keyField = request.getParameter("keyField");
			String keyWord = request.getParameter("keyWord");
			
			logger.info(keyField);
			logger.info(keyWord);

			boardService.getSearchBoardList(request, model, session);
						
			return "board/boardSearch";
		}
			
	
	//게시글 작성 뷰
	@RequestMapping("/write_view")
	public String writeForm() {
				
		return "board/write_view";
	}
	
	//게시글 작성
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(Board board) throws IOException {
		
		logger.info(board.getbName());
		logger.info(board.getbContent());
		logger.info(board.getbPassword());
		
		
		boardService.writeBoard(board);
	

		return "redirect:list";
	}
	
	//게시글 상세조회
	@RequestMapping("/content_view")
	public String contentBoard(HttpServletRequest request, Model model ) {
	
		logger.info(request.getParameter("bId"));
		boardService.contentBoard(request, model);
		
		return "board/content_view";
	}
	
	
	//게시글 수정시 비밀번호 화면 뷰
	@RequestMapping(value="/password_modify", method = {RequestMethod.GET, RequestMethod.POST})
	public String password_confirm(HttpServletRequest request, Model model) {
	
		logger.info("password_modify 로 들어옴 ");
		
		model.addAttribute("update_bId",Integer.parseInt(request.getParameter("bId")));
		model.addAttribute("update_bName",request.getParameter("bName"));
		model.addAttribute("update_bTitle",request.getParameter("bTitle"));
		model.addAttribute("update_bContent",request.getParameter("bContent"));
		model.addAttribute("pageNum",request.getParameter("pageNum"));

		return "board/password_modify";
	}
	
	
	@RequestMapping(value="/update_view", method = {RequestMethod.GET, RequestMethod.POST})
	public String update_view(HttpServletRequest request, Model model,RedirectAttributes rttr) {
		
		String bPassword = request.getParameter("bPassword");
		
		String password1 = boardService.updateView(request, model);
		if(passwordEncoder.matches(bPassword, password1)) {
			model.addAttribute("update_bId",  Integer.parseInt(request.getParameter("bId")));
			model.addAttribute("update_bName",request.getParameter("bName"));
			model.addAttribute("update_bTitle",request.getParameter("bTitle"));
			model.addAttribute("update_bContent",request.getParameter("bContent"));
			model.addAttribute("pageNum",request.getParameter("pageNum"));
			
			return "board/update_view";
		}
		
		rttr.addFlashAttribute("msg", "비밀번호가 옳지 않습니다.");
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/modify" , method = {RequestMethod.GET, RequestMethod.POST})
	public String modify(HttpServletRequest request,HttpServletResponse response)  {
		boardService.modify(request);

		return "redirect:list";
	}
	
	
	//게시글 삭제 비밀번호  - 암호화한 다음에 비밀번호랑 db 비밀번호를 매칭하여 조회 후 삭제시킨다. 
	@RequestMapping("/password_delete")
	public String delete_password(HttpServletRequest request, Model model) {
		
		model.addAttribute("delete_bId",Integer.parseInt(request.getParameter("bId")));
		return "board/password_delete";
	}
	
	//게시글 삭제
	@RequestMapping("/delete")
	public String deleteBoard(HttpServletRequest request, Model model)  {
		
		
		logger.info(request.getParameter("bPassword"));
		
		String bPassword = request.getParameter("bPassword");

		String password1 = boardService.updateView(request, model);
		
		logger.info(password1);
		
		if(passwordEncoder.matches(bPassword, password1)) {
		
			boardService.deleteBoard(request);

		}
		
		return "redirect:list";
	}
	
	//게시글 답변 뷰 보여주기
	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		
		boardService.replyView(request, model);
		return "board/reply_view";
	}
	
	//게시글 답변 기능
	@RequestMapping("/reply")
	public String reply(Board board) throws Exception {
	 
		logger.info(board.getbName());
		logger.info(board.getbContent());
		logger.info(board.getbPassword());
		
		boardService.reply(board);
	
		return "redirect:list";
	}
	
	
	//좋아요- ajax 통신
	@RequestMapping(value="/boards/{id}/favor", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject updateFavor(@PathVariable int id)  {
		
		JSONObject json = new JSONObject();
		json = boardService.updateFavor(id);
	
		return json;
	}
	
	
	//싫어요 - ajax 통신
	@RequestMapping(value="/boards/{id}/hate", method=RequestMethod.GET)
	@ResponseBody
	public JSONObject updateHate(@PathVariable int id) {
		
		JSONObject json = new JSONObject();
		json = boardService.updateHate(id);
		
		return json;
	}
	
}
