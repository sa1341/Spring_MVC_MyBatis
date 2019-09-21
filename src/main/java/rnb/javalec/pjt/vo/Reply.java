package rnb.javalec.pjt.vo;

public class Reply {
	
	private int rno;
	
	private int fno;
	
	private String replyer;
	
	private String replytext;
	
	private String username;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", replyer=" + replyer + ", replytext=" + replytext + ", username=" + username
				+ "]";
	}
	
	
	
}
