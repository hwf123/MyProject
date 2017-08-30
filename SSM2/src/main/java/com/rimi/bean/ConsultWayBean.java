package com.rimi.bean;

public class ConsultWayBean {
    private int csWayId;

    private String csWayName;

	public int getCsWayId() {
		return csWayId;
	}

	public void setCsWayId(int csWayId) {
		this.csWayId = csWayId;
	}

	public String getCsWayName() {
		return csWayName;
	}

	public void setCsWayName(String csWayName) {
		this.csWayName = csWayName;
	}

	public ConsultWayBean(int csWayId, String csWayName) {
		super();
		this.csWayId = csWayId;
		this.csWayName = csWayName;
	}

	public ConsultWayBean() {
		super();
		// TODO Auto-generated constructor stub
	}


	
   
}