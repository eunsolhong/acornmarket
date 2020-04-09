package model;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Board implements Serializable {

	private int boardnum;
	private String userid;
	private String filename;
	private int readcount;
	private Timestamp regdate;
	private String subject;
	private String content;
	private String address;
	private int price;
	private String category;
	private int soldout;
	private String passwd;
	private int likecount;
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getSoldout() {
		return soldout;
	}
	public void setSoldout(int soldout) {
		this.soldout = soldout;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", userid=" + userid + ", filename=" + filename + ", readcount="
				+ readcount + ", regdate=" + regdate + ", subject=" + subject + ", content=" + content + ", address="
				+ address + ", price=" + price + ", category=" + category + ", soldout=" + soldout + ", passwd="
				+ passwd + ", likecount=" + likecount + "]";
	}
	
	
}
