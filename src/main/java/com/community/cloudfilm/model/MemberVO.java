package com.community.cloudfilm.model;

import java.util.Date;

public class MemberVO {
	private int mem_num;
	private String mem_id;
	private String mem_pass;
	private String mem_email;
	private String mem_img;
	private Date mem_date;
	private int mem_grade;
	private String mem_yn;
	private String mem_nick;
	private int board_writecount;
	private int re_writecount;
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	public Date getMem_date() {
		return mem_date;
	}
	public void setMem_date(Date mem_date) {
		this.mem_date = mem_date;
	}
	public int getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(int mem_grade) {
		this.mem_grade = mem_grade;
	}
	public String getMem_yn() {
		return mem_yn;
	}
	public void setMem_yn(String mem_yn) {
		this.mem_yn = mem_yn;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public int getBoard_writecount() {
		return board_writecount;
	}
	public int getRe_writecount() {
		return re_writecount;
	}
	public void setBoard_writecount(int board_writecount) {
		this.board_writecount = board_writecount;
	}
	public void setRe_writecount(int re_writecount) {
		this.re_writecount = re_writecount;
	}
}
