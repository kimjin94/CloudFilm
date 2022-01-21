package com.community.cloudfilm.model;

import java.util.Date;

public class ReplyVO {
	private int re_num;
	private int board_num;
	private int mem_num;
	private Date re_date;
	private String re_yn;
	private String re_cont;
	
	private String mem_nick;
	private String mem_img;

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public String getRe_yn() {
		return re_yn;
	}

	public void setRe_yn(String re_yn) {
		this.re_yn = re_yn;
	}

	public String getRe_cont() {
		return re_cont;
	}

	public void setRe_cont(String re_cont) {
		this.re_cont = re_cont;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_img() {
		return mem_img;
	}

	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	
	
}
