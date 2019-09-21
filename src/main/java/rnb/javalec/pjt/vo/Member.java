package rnb.javalec.pjt.vo;


public class Member {

	private int mno;
	private String mname;
	private String mjob;
	private String mloc;
	private String mpassword;
	
	
	public Member() {}

	

	public Member(int mno, String mname, String mjob, String mloc, String mpassword) {
		this.mno = mno;
		this.mname = mname;
		this.mjob = mjob;
		this.mloc = mloc;
		this.mpassword = mpassword;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMjob() {
		return mjob;
	}
 
	public void setMjob(String mjob) {
		this.mjob = mjob;
	}

	public String getMloc() {
		return mloc;
	}

	
	public String getMpassword() {
		return mpassword;
	}



	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}



	public void setMloc(String mloc) {
		this.mloc = mloc;
	}
	
	
	
	
	
	
	
	
}
