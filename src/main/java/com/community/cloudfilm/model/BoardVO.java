package com.community.cloudfilm.model;

import java.util.Date;

public class BoardVO {
	private int board_num;
	private String mem_id;
	private String board_title;
	private String board_cont;
	private String board_img;
	private String board_video;
	private String board_filter;
	private Date board_date;
	private int board_count;
	private int board_good;
	private int board_bad;
	private int cate_num;
	private String board_yn;
	private String info_yn;
	private int mem_num;
	
	private int re_count;
	private String mem_img;
	private String mem_nick;	
	
	//검색
	private String search;	//검색타입
	private String keyword;	//검색내용
	private String gb_sort;
	
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
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_cont() {
		return board_cont;
	}
	public void setBoard_cont(String board_cont) {
		this.board_cont = board_cont;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public String getBoard_video() {
		return board_video;
	}
	public void setBoard_video(String board_video) {
		this.board_video = board_video;
	}
	public String getBoard_filter() {
		return board_filter;
	}
	public void setBoard_filter(String board_filter) {
		this.board_filter = board_filter;
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
	public int getBoard_good() {
		return board_good;
	}
	public void setBoard_good(int board_good) {
		this.board_good = board_good;
	}
	public int getBoard_bad() {
		return board_bad;
	}
	public void setBoard_bad(int board_bad) {
		this.board_bad = board_bad;
	}
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	public String getBoard_yn() {
		return board_yn;
	}
	public void setBoard_yn(String board_yn) {
		this.board_yn = board_yn;
	}
	public String getInfo_yn() {
		return info_yn;
	}
	public void setInfo_yn(String info_yn) {
		this.info_yn = info_yn;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getRe_count() {
		return re_count;
	}
	public void setRe_count(int re_count) {
		this.re_count = re_count;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getGb_sort() {
		return gb_sort;
	}
	public void setGb_sort(String gb_sort) {
		this.gb_sort = gb_sort;
	}
	
}
