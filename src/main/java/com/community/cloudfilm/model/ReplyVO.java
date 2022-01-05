package com.community.cloudfilm.model;

import java.util.Date;

public class ReplyVO {
	private int re_num;
	private int board_num;
	private String mem_id;
	private Date re_date;
	private String re_yn;
	
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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
}
