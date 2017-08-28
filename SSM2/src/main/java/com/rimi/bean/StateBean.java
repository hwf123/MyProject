package com.rimi.bean;

public class StateBean {
    private Integer stateId;

    private String stateName;

    public Integer getStateId() {
        return stateId;
    }

    public void setStateId(Integer stateId) {
        this.stateId = stateId;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName == null ? null : stateName.trim();
    }

	public StateBean() {
		super();
	}
	public StateBean(Integer stateId, String stateName) {
		super();
		this.stateId = stateId;
		this.stateName = stateName;
	}   
}