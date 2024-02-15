package com.basic.rentcar.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class Rentcar {

	private int no;
	private String name;
	private int category;
	private int price;
	private int usepeople;
	private int totalQty;
	private String company;
	private String img;
	private String info;
	public Rentcar() {}

}
