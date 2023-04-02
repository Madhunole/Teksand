package com.teksands.bootcamp.pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class GstPradr {
	@SerializedName("addr")
    @Expose
    private GstAddr addr;
    @SerializedName("ntr")
    @Expose
    private String ntr;

    public GstAddr getAddr() {
        return addr;
    }

    public void setAddr(GstAddr addr) {
        this.addr = addr;
    }

    public String getNtr() {
        return ntr;
    }

    public void setNtr(String ntr) {
        this.ntr = ntr;
    }
}
