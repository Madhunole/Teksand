package com.teksands.bootcamp.pojo;

import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class LlpData {

	@SerializedName("charges")
    @Expose
    private List<Charge> charges = null;
    @SerializedName("directors/signatory_details")
    @Expose
    private List<DirectorsSignatoryDetail> directorsSignatoryDetails = null;
    @SerializedName("llp_master_data")
    @Expose
    private LlpMasterData llpMasterData;

    public List<Charge> getCharges() {
        return charges;
    }

    public void setCharges(List<Charge> charges) {
        this.charges = charges;
    }

    public List<DirectorsSignatoryDetail> getDirectorsSignatoryDetails() {
        return directorsSignatoryDetails;
    }

    public void setDirectorsSignatoryDetails(List<DirectorsSignatoryDetail> directorsSignatoryDetails) {
        this.directorsSignatoryDetails = directorsSignatoryDetails;
    }

    public LlpMasterData getLlpMasterData() {
        return llpMasterData;
    }

    public void setLlpMasterData(LlpMasterData llpMasterData) {
        this.llpMasterData = llpMasterData;
    }
    
}
