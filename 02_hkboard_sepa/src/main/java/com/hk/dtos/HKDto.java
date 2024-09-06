package com.hk.dtos;

import java.io.Serializable;
import java.util.Date;

//DTO: 데이터 운반 객체 → 은닉화 구현
public class HKDto implements Serializable {
	
	//Serializable: 인터페이스 구현 → 데이터 직렬화 "data" → [d,a,t,a]
	//데이터를 안정적으로 관리

	//식별 관리 아이디
	private static final long serialVersionUID = 1L;
	
	private int seq;
	private String id;
	private String title; 
	private String content;
	private Date regDate;
	
	public HKDto() {
		
	}
	
	//생성자 오버로딩: 멤버필드 초기화 작업할때 사용
	public HKDto(int seq, String id, String title, String content, Date regDate) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}
	

	public HKDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}
	
	public HKDto(int seq, String title, String content) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "HKDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ "]";
	}
	
	
	
	
	
	

}
