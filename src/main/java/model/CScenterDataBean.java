package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class CScenterDataBean implements Serializable {

	private int num;
	private String adminid;
	private String subject;
	private String content;
	private String passwd;
	private Timestamp regdate;
	private int readcount;
	private String category;
	private String ip;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getAdminId() {
		return adminid;
	}

	public void setAdminId(String adminId) {
		this.adminid = adminId;
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

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Timestamp getregdate() {
		return regdate;
	}

	public void setregdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "CScenterDataBean [num=" + num + ", adminid=" + adminid + ", subject=" + subject + ", content=" + content
				+ ", passwd=" + passwd + ", regdate=" + regdate + ", readcount=" + readcount + ", category=" + category
				+ ", ip=" + ip + "]";
	}


}
