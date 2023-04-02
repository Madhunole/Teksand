package com.teksands.bootcamp.pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class GstAddr {
	@SerializedName("bnm")
    @Expose
    private String bnm;
    @SerializedName("loc")
    @Expose
    private String loc;
    @SerializedName("st")
    @Expose
    private String st;
    @SerializedName("bno")
    @Expose
    private String bno;
    @SerializedName("dst")
    @Expose
    private String dst;
    @SerializedName("stcd")
    @Expose
    private String stcd;
    @SerializedName("city")
    @Expose
    private String city;
    @SerializedName("flno")
    @Expose
    private String flno;
    @SerializedName("lt")
    @Expose
    private String lt;
    @SerializedName("pncd")
    @Expose
    private String pncd;
    @SerializedName("lg")
    @Expose
    private String lg;

    public String getBnm() {
        return bnm;
    }

    public void setBnm(String bnm) {
        this.bnm = bnm;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public String getSt() {
        return st;
    }

    public void setSt(String st) {
        this.st = st;
    }

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public String getDst() {
        return dst;
    }

    public void setDst(String dst) {
        this.dst = dst;
    }

    public String getStcd() {
        return stcd;
    }

    public void setStcd(String stcd) {
        this.stcd = stcd;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getFlno() {
        return flno;
    }

    public void setFlno(String flno) {
        this.flno = flno;
    }

    public String getLt() {
        return lt;
    }

    public void setLt(String lt) {
        this.lt = lt;
    }

    public String getPncd() {
        return pncd;
    }

    public void setPncd(String pncd) {
        this.pncd = pncd;
    }

    public String getLg() {
        return lg;
    }

    public void setLg(String lg) {
        this.lg = lg;
    }
}
