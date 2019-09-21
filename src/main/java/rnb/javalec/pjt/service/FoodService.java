package rnb.javalec.pjt.service;

import java.util.List;

import rnb.javalec.pjt.vo.Food;
import rnb.javalec.pjt.vo.Reply;

public interface FoodService {
	public Food selectByFno(int fno);
	
	//식당 리뷰 목록 조회
	public List<Reply> selectReplyByFno(int fno) throws Exception;
	
	//식당 리뷰 댓글 추가기능
	public void insertReplyByFno(Reply reply) throws Exception;
	
	//식당 리뷰 댓글 삭제기능
	public void deleteById(int rno) throws Exception;
	
	
	//식당 리뷰 수정하기 위한 사용자 정보 조회하기.
	public Reply selectUserByFno(int fno) throws Exception;
	
	//식당리뷰 수정하기
	public void updateReply(Reply reply) throws Exception;
}
