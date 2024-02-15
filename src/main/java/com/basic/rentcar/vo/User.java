package com.basic.rentcar.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class User {
	private int no;
	private String id;
	private String pw;
	private String email;
	private String tel;
	private String hobby;
	private String job;
	private String age;
	private String info;

	public User() {
	}
}
