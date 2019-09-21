package rnb.javalec.pjt.vo;

public class User {
	
	private String username;
	
	private String password;
	
	private int 	enabled;
	
	private String mname;
	
	private String mdepartment;
	
	private String mloc;
	
	private String role;


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMdepartment() {
		return mdepartment;
	}

	public void setMdepartment(String mdepartment) {
		this.mdepartment = mdepartment;
	}

	public String getMloc() {
		return mloc;
	}

	public void setMloc(String mloc) {
		this.mloc = mloc;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}


	

}
