package board1.model;

public class ScrapVO {
	private int board_num;
	private String mem_id;
	private int board_title;
	private int sc_yn;
	
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
	public int getBoard_title() {
		return board_title;
	}
	public void setBoard_title(int board_title) {
		this.board_title = board_title;
	}
	public int getSc_yn() {
		return sc_yn;
	}
	public void setSc_yn(int sc_yn) {
		this.sc_yn = sc_yn;
	}
}
