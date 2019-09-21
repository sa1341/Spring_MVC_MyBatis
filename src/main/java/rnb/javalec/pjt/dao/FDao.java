package rnb.javalec.pjt.dao;


import java.util.List;

import rnb.javalec.pjt.vo.Food;
import rnb.javalec.pjt.vo.Reply;

public interface FDao {
	
	//식당번호를 통해서 음식정보(위치,이름 등) 조회하기
	public Food selectByFno(int fno);
	
	//식당번호로 댓글목록 조회하기
	public List<Reply> selectReplyByFno(int fno);

	//식당번호로 댓글목록 추가하기
	public void insertReplyByFno(Reply reply);
	
	//댓글 삭제기능
	public void deleteById(int rno);
	
	//댓글번호로 사용자 정보 조회하기
	public Reply selectUserByFno(int rno);
	
	//리뷰댓글에 있는 사용자정보 수정
	public void updateReply(Reply reply);
}
