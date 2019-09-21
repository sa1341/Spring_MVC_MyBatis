package rnb.javalec.pjt.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import rnb.javalec.pjt.vo.Board;

public interface BoardService{

	//게시판 목록조회
	public void getBoardList(HttpServletRequest request,Model model,HttpSession session );
	
	//게시글 작성
	public void writeBoard(Board board);
	
	//게시글 상세조회
	public void contentBoard(HttpServletRequest request,Model model);

	//게시글 수정 기능
	public void modify(HttpServletRequest request);
	
	//게시글 삭제
	public void deleteBoard(HttpServletRequest request);

	//게시글 답변 뷰 보여주기
	public void replyView(HttpServletRequest request, Model model);
	
	//게시글 답변 기능
	public void reply(Board board);
	
	//좋아요 수정
	public JSONObject updateFavor(int id);
	
	//싫어요 수정
	public JSONObject updateHate(int id);

	//게시물 검색기능
	public void getSearchBoardList(HttpServletRequest request, Model model, HttpSession session);

	//게시물 수정 화면 보여주기
	public String updateView(HttpServletRequest request, Model model);
	
	
}
