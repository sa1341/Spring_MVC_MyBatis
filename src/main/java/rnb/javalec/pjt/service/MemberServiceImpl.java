package rnb.javalec.pjt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import rnb.javalec.pjt.controller.SearchMemberController;
import rnb.javalec.pjt.dao.MDao;
import rnb.javalec.pjt.exception.UserNotFoundException;
import rnb.javalec.pjt.vo.Member;
import rnb.javalec.pjt.vo.User;

@Transactional(propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//임직원 등록 서비스
	@Override
	public void writeMember(User user) {
		
		logger.info(user.getUsername());
		logger.info(user.getPassword());
		logger.info(user.getMdepartment());
		logger.info(user.getMname());
		logger.info(user.getMloc());

		user.setRole("ROLE_USER");
		user.setPassword(passwordEncoder.encode(user.getPassword()));

		MDao dao = sqlSession.getMapper(MDao.class);
	
		dao.writeMember(user);
		dao.writeMemberRoles(user);
	
		
	}

	// 검색을 통한 임직원 조회 서비스
	@Override
	public List<User> selectMembers(HttpServletRequest request, Model model) {
		
		MDao dao = sqlSession.getMapper(MDao.class);
		
		List<User> member = dao.selectMembers(request.getParameter("mname"));
		
		int count =dao.getMemberCount(request.getParameter("mname"));
		   	logger.info("count: " + count);
	
		if(count == 0) {
			logger.info("0입니다.");
			model.addAttribute("Mcount", count);
		}
		
			logger.info("0이 아닙니다.");
			return member;
	
		
	}

	//임직원 상세조회 서비스
	@Override
	public void contentView(HttpServletRequest request, Model model) {
		
		MDao dao = sqlSession.getMapper(MDao.class);
		
		model.addAttribute("contentView", dao.contentView(request.getParameter("username")));
	}

	//임직원 정보삭제 서비스
	@Override
	public void deleteMember(HttpServletRequest request) {
		
		MDao dao = sqlSession.getMapper(MDao.class);

		dao.deleteMember(request.getParameter("username"));
		dao.deleteMemberRoles(request.getParameter("username"));
		
	}
	//임직원 정보수정 서비스
	@Override
	public void updateMember(User user) {
		
		MDao dao = sqlSession.getMapper(MDao.class);
		
		dao.updateMember(user);
		
	}

	//회원가입시 아이디 중복 체크 기능
	public int checkId(String id) {

		MDao dao = sqlSession.getMapper(MDao.class);
	
		int result = dao.checkID(id);
	
		
		return dao.checkID(id);
	}
	

}
