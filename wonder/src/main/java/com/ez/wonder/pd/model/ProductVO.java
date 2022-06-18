package com.ez.wonder.pd.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductVO {
	private int pdNo;
	private String userId;
	private String cateType;
	private String pdTitle;
	private Timestamp regdate;
	private String delType;
	private int readCount;
	private String lang;
	private String frame;
}