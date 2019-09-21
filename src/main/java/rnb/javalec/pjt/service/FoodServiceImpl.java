package rnb.javalec.pjt.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import rnb.javalec.pjt.controller.BoardController;
import rnb.javalec.pjt.dao.FDao;
import rnb.javalec.pjt.exception.UserNotFoundException;
import rnb.javalec.pjt.vo.Food;
import rnb.javalec.pjt.vo.Reply;

@Transactional(propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
public class FoodServiceImpl implements FoodService {

	
	private static final Logger logger = LoggerFactory.getLogger(FoodServiceImpl.class);

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Food selectByFno(int fno){
		logger.info("fno :" +fno);
		FDao dao = sqlSession.getMapper(FDao.class);
		Food fdto =  dao.selectByFno(fno);
		if(fdto == null) {
		  	logger.info("음식점이 없음...");
			throw new UserNotFoundException("음식점을 찾을수가 없습니다.");
		
		}
		
		logger.info("fno :" +fdto.getFno());
		logger.info(fdto.getFname());
		logger.info(fdto.getFloc());
		
		return fdto;
		
	}

	@Override
	public List<Reply> selectReplyByFno(int fno) throws Exception {

		logger.info("fno :" +fno);
		
		FDao dao = sqlSession.getMapper(FDao.class);
		List<Reply> replyList = dao.selectReplyByFno(fno);
		
		
		return replyList;
	}

	@Override
	public void insertReplyByFno(Reply reply) throws Exception {
		
		FDao dao = sqlSession.getMapper(FDao.class);
		dao.insertReplyByFno(reply);
	
		
	}

	@Override
	public void deleteById(int rno) throws Exception {
		
		FDao dao = sqlSession.getMapper(FDao.class);
		dao.deleteById(rno);
		
	}

	@Override
	public Reply selectUserByFno(int rno) throws Exception {
		
		FDao dao = sqlSession.getMapper(FDao.class);
		
		return dao.selectUserByFno(rno);
	}

	@Override
	public void updateReply(Reply reply) throws Exception {
		FDao dao = sqlSession.getMapper(FDao.class);
		
		dao.updateReply(reply);
		
	}

}
