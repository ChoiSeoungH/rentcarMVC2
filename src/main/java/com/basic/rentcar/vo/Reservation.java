package com.basic.rentcar.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class Reservation {
	private int reserveSeq;	
	private int no;				
	private String id;
	private int qty;			
	private int dday;			
	private String rday;		
	private int usein;			
	private int usewifi;			
	private int usenavi;
	private int useseat;

	public Reservation() {
	}
}
