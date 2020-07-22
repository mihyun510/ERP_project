package com.erp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChatController implements Controller {

	public ChatController(String requestName) {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		return null;
	}

	@Override
	public ModelAndView process(String cud,HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		return null;
	}

}
