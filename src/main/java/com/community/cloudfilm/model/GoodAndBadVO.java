package com.community.cloudfilm.model;

public class GoodAndBadVO {
	private int gb_num;
	private int board_num;
	private int mem_num;
	private String gb_sort;
	
	private String board_title;
	
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
}
