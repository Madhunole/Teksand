package com.teksands.bootcamp.pojo;

import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Data {
	@SerializedName("company_master_data")
    @Expose
    private CompanyMasterData companyMasterData;
    @SerializedName("charges")
    @Expose
    private List<Object> charges = null;
    @SerializedName("directors/signatory_details")
    @Expose
    private List<DirectorsSignatoryDetail> directorsSignatoryDetails = null;

    public CompanyMasterData getCompanyMasterData() {
        return companyMasterData;
    }

    public void setCompanyMasterData(CompanyMasterData companyMasterData) {
        this.companyMasterData = companyMasterData;
    }

    public List<Object> getCharges() {
        return charges;
    }

    public void setCharges(List<Object> charges) {
        this.charges = charges;
    }

    public List<DirectorsSignatoryDetail> getDirectorsSignatoryDetails() {
        return directorsSignatoryDetails;
    }

    public void setDirectorsSignatoryDetails(List<DirectorsSignatoryDetail> directorsSignatoryDetails) {
        this.directorsSignatoryDetails = directorsSignatoryDetails;
    }
}
