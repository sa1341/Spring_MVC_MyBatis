package rnb.javalec.pjt.exception;


public class UserNotFoundException extends RuntimeException {

	private String errMsg;
	
	
	public UserNotFoundException(String errMsg) {
		
		super(errMsg);
	}
	
	
	
	
	
}
