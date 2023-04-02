package com.teksands.bootcamp.pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class DirectorsSignatoryDetail {
	@SerializedName("end_date")
    @Expose
    private String endDate;
    @SerializedName("surrendered_din")
    @Expose
    private String surrenderedDin;
    @SerializedName("din/pan")
    @Expose
    private String dinPan;
    @SerializedName("begin_date")
    @Expose
    private String beginDate;
    @SerializedName("name")
    @Expose
    private String name;

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getSurrenderedDin() {
        return surrenderedDin;
    }

    public void setSurrenderedDin(String surrenderedDin) {
        this.surrenderedDin = surrenderedDin;
    }

    public String getDinPan() {
        return dinPan;
    }

    public void setDinPan(String dinPan) {
        this.dinPan = dinPan;
    }

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
