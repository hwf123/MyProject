package com.rimi.bean;

public class SourcesBean {
    private Integer sourcesId;

    private String sourcesName;

    public Integer getSourcesId() {
        return sourcesId;
    }

    public void setSourcesId(Integer sourcesId) {
        this.sourcesId = sourcesId;
    }

    public String getSourcesName() {
        return sourcesName;
    }

    public void setSourcesName(String sourcesName) {
        this.sourcesName = sourcesName == null ? null : sourcesName.trim();
    }
}