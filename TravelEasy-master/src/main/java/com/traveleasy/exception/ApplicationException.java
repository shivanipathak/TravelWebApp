package com.traveleasy.exception;

public class ApplicationException extends Exception {
	
	private static final long serialVersionUID = 1L;
	public int code = 500;
	
	public ApplicationException(int code, String message) {
		super(message);
		this.code = code;
	}

}
