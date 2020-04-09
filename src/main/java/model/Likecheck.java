package model;

public class Likecheck {

	private int likenum;
	private int boardnum;
	private int like_check;
	private String userid;
	
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Override
	public String toString() {
		return "Likecheck [likenum=" + likenum + ", boardnum=" + boardnum + ", like_check=" + like_check + ", userid="
				+ userid + "]";
	}
}
