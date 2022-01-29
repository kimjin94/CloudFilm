package com.community.cloudfilm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@RequestMapping(value="/reviewlist", method=RequestMethod.GET)
	public void getReviewList() throws Exception {
//		return "reviewboard";
	}

}