package rnb.javalec.pjt.dao;

import java.util.List;

import rnb.javalec.pjt.vo.Food;
import rnb.javalec.pjt.vo.Member;
import rnb.javalec.pjt.vo.User;

public interface MDao {

	//검색을 통한 임직원 리스트 조회
	public  List<User> selectMembers(String mname);
	
	//임직원 등록
	public void writeMember(User user);
	//임직원 권한 등록
	public void writeMemberRoles(User user);
	
	//테스트용 임직원 등록
	public void testWriteMember(User user);
	
	//테스트용 임직원 조회 
	public User testSelectMember(String id);
	
	//음식점 조회
	public Food foodSelect(String floc);
	
	//임직원 상세 조회
	public User contentView(String username);
	//임직원 정보 삭제 
	public void deleteMember(String username);

	//임직원 권한 삭제
	public void deleteMemberRoles(String username);
	
	//임직원 정보 수정 
	public void updateMember(User user);
	
	//이름으로 임직원 수 조회하기
	public int getMemberCount(String mname);
	
	public int checkID(String id);
	
}
