package rnb.javalec.pjt.dao;

import java.util.List;

import rnb.javalec.pjt.vo.Board;

public interface IDao {
	
	//게시판 수정 삭제 작업시  게시글 번호를 이용하여 사용자가 등록한 게시물의 비밀번호를 조회하는 기능
	public String passwordCheck(int bId);

	//게시판 제목검색으로 조회하기
	public List<Board> getNsearchBoardList(String keyword);
	
	//게시판 목록 조회(10개씩)
	public List<Board> listDao(int startRow,int endRow);
	
	//전체 게시판 건수 조회
	public int getBoardCount();

	//게시판 내용 상세 조회
	public Board getContent(int bId);
	
	
	//게시글 작성하기
	public void writeBoard(Board board);
	
	//조회수 증가
	public void hitUp(int bId);
	
	//게시글 수정기능
	public void modifyDao(int bId,String bName, String bTitle, String bContent);
	
	//게시글 삭제
	public void deleteBoard(String bId);
	
	//게시글 답변 뷰 보여주기
	public Board replyView(int bId); 
	
	//게시글 답변 기능
	public void reply(Board board); 
	
	//게시글 목록에서 특정게시글의 몇번째 답변인지 보여주는 기능
	public void replyShape(Board board);
	
	//좋아요 싫어요 기능 작성
	public int getFavor(int bId);
	
	public int getHate(int bId);
	
	public int updateFavor(int bId, int result);
	
	public int updateHate(int bId, int result);
	
	//게시판 검색 기능 이름, 제목, 내용으로 검색한다.
	public List<Board> NsearchDao(String keyWord, int startRow, int endRow);
	
	public List<Board> TsearchDao(String keyWord);
	
	public List<Board> CsearchDao(String keyWord);
	
	public int getNSearchBoardCount(String keyWord);
	
	public int getTSearchBoardCount();
	
	public int getCSearchBoardCount();
}

