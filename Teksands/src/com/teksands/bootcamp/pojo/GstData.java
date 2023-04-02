package com.teksands.bootcamp.pojo;

import java.util.List;

import javax.annotation.Generated;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class GstData {
	@SerializedName("stjCd")
    @Expose
    private String stjCd;
    @SerializedName("dty")
    @Expose
    private String dty;
    @SerializedName("lgnm")
    @Expose
    private String lgnm;
    @SerializedName("adadr")
    @Expose
    private List<Object> adadr = null;
    @SerializedName("cxdt")
    @Expose
    private String cxdt;
    @SerializedName("gstin")
    @Expose
    private String gstin;
    @SerializedName("nba")
    @Expose
    private List<String> nba = null;
    @SerializedName("lstupdt")
    @Expose
    private String lstupdt;
    @SerializedName("ctb")
    @Expose
    private String ctb;
    @SerializedName("rgdt")
    @Expose
    private String rgdt;
    @SerializedName("pradr")
    @Expose
    private GstPradr pradr;
    @SerializedName("ctjCd")
    @Expose
    private String ctjCd;
    @SerializedName("sts")
    @Expose
    private String sts;
    @SerializedName("tradeNam")
    @Expose
    private String tradeNam;
    @SerializedName("ctj")
    @Expose
    private String ctj;

    public String getStjCd() {
        return stjCd;
    }

    public void setStjCd(String stjCd) {
        this.stjCd = stjCd;
    }

    public String getDty() {
        return dty;
    }

    public void setDty(String dty) {
        this.dty = dty;
    }

    public String getLgnm() {
        return lgnm;
    }

    public void setLgnm(String lgnm) {
        this.lgnm = lgnm;
    }

    public List<Object> getAdadr() {
        return adadr;
    }

    public void setAdadr(List<Object> adadr) {
        this.adadr = adadr;
    }

    public String getCxdt() {
        return cxdt;
    }

    public void setCxdt(String cxdt) {
        this.cxdt = cxdt;
    }

    public String getGstin() {
        return gstin;
    }

    public void setGstin(String gstin) {
        this.gstin = gstin;
    }

    public List<String> getNba() {
        return nba;
    }

    public void setNba(List<String> nba) {
        this.nba = nba;
    }

    public String getLstupdt() {
        return lstupdt;
    }

    public void setLstupdt(String lstupdt) {
        this.lstupdt = lstupdt;
    }

    public String getCtb() {
        return ctb;
    }

    public void setCtb(String ctb) {
        this.ctb = ctb;
    }

    public String getRgdt() {
        return rgdt;
    }

    public void setRgdt(String rgdt) {
        this.rgdt = rgdt;
    }

    public GstPradr getPradr() {
        return pradr;
    }

    public void setPradr(GstPradr pradr) {
        this.pradr = pradr;
    }

    public String getCtjCd() {
        return ctjCd;
    }

    public void setCtjCd(String ctjCd) {
        this.ctjCd = ctjCd;
    }

    public String getSts() {
        return sts;
    }

    public void setSts(String sts) {
        this.sts = sts;
    }

    public String getTradeNam() {
        return tradeNam;
    }

    public void setTradeNam(String tradeNam) {
        this.tradeNam = tradeNam;
    }

    public String getCtj() {
        return ctj;
    }

    public void setCtj(String ctj) {
        this.ctj = ctj;
    }
}
