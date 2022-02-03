package com.community.cloudfilm.model;

import java.util.Date;

public class GoodAndBadVO {
	private int gb_num;
	private int board_num;
	private int mem_num;
	private String gb_sort;
	
	//내가 좋아요한 글 조인
	private String board_title;
	private Date board_date;
	private int board_count;
	private String mem_nick;
	
	public int getGb_num() {
		return gb_num;
	}
	public void setGb_num(int gb_num) {
		this.gb_num = gb_num;
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
	public String getGb_sort() {
		return gb_sort;
	}
	public void setGb_sort(String gb_sort) {
		this.gb_sort = gb_sort;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

}
