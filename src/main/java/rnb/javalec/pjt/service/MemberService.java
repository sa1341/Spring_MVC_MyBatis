package rnb.javalec.pjt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import rnb.javalec.pjt.exception.UserNotFoundException;
import rnb.javalec.pjt.vo.Member;
import rnb.javalec.pjt.vo.User;

public interface MemberService {

	//임직원 등록 서비스
	public void writeMember(User user); 
	
	//검색을 통한 임직원 조회 서비스
	public List<User> selectMembers(HttpServletRequest request, Model model);
	
	//임직원 상세조회 서비스
	public void contentView(HttpServletRequest request, Model model);
	
	//임직원 삭제 서비스
	public void deleteMember(HttpServletRequest request);
	
	//임직원 수정 서비스
	public void updateMember(User user);
	
	//회원가입시 id 중복체크 기능
	public int checkId(String id);
}
