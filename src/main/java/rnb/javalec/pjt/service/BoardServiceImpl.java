package rnb.javalec.pjt.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import rnb.javalec.pjt.dao.IDao;
import rnb.javalec.pjt.vo.Board;

@Transactional(propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	//게시판 목록조회
	@Override
	public void getBoardList(HttpServletRequest request, Model model, HttpSession session){
		
		String pageNum = request.getParameter("pageNum");
		
		System.out.println(pageNum);
		int pageSize = 10;
		
		if(pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)* pageSize + 1;
		int endRow = currentPage*pageSize;
		int count = 0;
		int number = 0;
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		count = dao.getBoardCount();
		System.out.println(count);
		
		if(count > 0) {
			model.addAttribute("list", dao.listDao(startRow, endRow));
			System.out.println("list() end");
			number = count -(currentPage -1)*pageSize;
		}
		
		session.setAttribute("pageSize", pageSize);
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("count", count);
		session.setAttribute("number",number);
	
	}
	@Override
	public void getSearchBoardList(HttpServletRequest request,Model model,
			HttpSession session) {
	
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		
		int pageSize = 10; 
		
		if(pageNum == null || pageNum.equals(""))
			pageNum = "1";
	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)* pageSize + 1;
		int endRow = currentPage*pageSize;
		int count = 0;
		int number = 0;
	
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord"); 
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(keyField.equals("bName")) {
			
			//count = dao.getNSearchBoardCount(keyWord); 
			count = dao.getNSearchBoardCount(keyWord);
			System.out.println(count);
			    
			
			
			if(count > 0) {
				  
				model.addAttribute("search", dao.NsearchDao(keyWord,startRow, endRow));
				
				System.out.println("search() end");

				number = count -(currentPage -1)*pageSize; 
				
			} 
			//검색값 유지해서 보내기...
			
			request.setAttribute("keyField", keyField);
			request.setAttribute("keyWord", keyWord);
			session.setAttribute("pageSize", pageSize); 
			session.setAttribute("currentPage", currentPage);
			session.setAttribute("count", count);
			session.setAttribute("number",number);
		}
	
 
	}

	// 게시글 작성
	@Override
	public void writeBoard(Board board){
		
		IDao dao = sqlSession.getMapper(IDao.class);
	
		board.setbPassword(passwordEncoder.encode(board.getbPassword()));
		
		dao.writeBoard(board);
		
		
		
	}

	//게시물 상세조회
	@Override
	public void contentBoard(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.hitUp(Integer.parseInt(request.getParameter("bId")));
		
		model.addAttribute("content_view",  dao.getContent(Integer.parseInt(request.getParameter("bId"))));
		model.addAttribute("pageNum", request.getParameter("pageNum"));
		
		
	}

	// 게시글 삭제 기능
	@Override
	public void deleteBoard(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.deleteBoard(request.getParameter("bId"));
	}

	//게시글 답변 뷰 보여주기
	@Override
	public void replyView(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("reply_view",dao.replyView(Integer.parseInt(request.getParameter("bId"))));
		
		
	}

	//게시글 답변 기능
	@Override
	public void reply(Board board)  {
		
	try {
		IDao dao = sqlSession.getMapper(IDao.class);

		
		board.setbPassword(passwordEncoder.encode(board.getbPassword()));
		dao.replyShape(board);
		
		dao.reply(board);
	}catch(Exception e) {
		System.out.println(e.getMessage());
		 throw new RuntimeException();
	}
	
		
	}


	@Override
	public JSONObject updateFavor(int id) {
	
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int result = dao.getFavor(id);
		result++;
		
		dao.updateFavor(id, result);
		
		JSONObject json = new JSONObject();
		
		json.put("favorCnt", result);
		
		return json;
	}


	@Override
	public JSONObject updateHate(int id) {
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int result = dao.getHate(id);
		
		result++;
		
		dao.updateHate(id, result);
		
		JSONObject json = new JSONObject();
		
		json.put("hateCnt", result);
		return json;
	}
	
	
	@Override
	public String updateView(HttpServletRequest request, Model model) {
		
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		
		return dao.passwordCheck( Integer.parseInt(request.getParameter("bId")));
		
		
	}
	@Override
	public void modify(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.modifyDao(Integer.parseInt(request.getParameter("bId")),request.getParameter("bName"), request.getParameter("bTitle") , request.getParameter("bContent"));

	}


	/*@Override
	public void boardSearch(HttpServletRequest request, Model model) {
		
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord"); 
		IDao dao = sqlSession.getMapper(IDao.class);
		if(keyField.equals("bName")) {
			model.addAttribute("search", dao.NsearchDao(keyWord));
			
		}
		if(keyField.equals("bTitle")) {
			model.addAttribute("search", dao.TsearchDao(keyWord));
		}
		if(keyField.equals("bContent")) {
			model.addAttribute("search", dao.CsearchDao(keyWord));
		}
		
	}*/


	
	
	
}
