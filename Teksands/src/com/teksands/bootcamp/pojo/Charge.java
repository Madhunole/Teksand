package com.teksands.bootcamp.pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Charge {
	@SerializedName("assets_under_charge")
    @Expose
    private String assetsUnderCharge;
    @SerializedName("charge_id")
    @Expose
    private String chargeId;
    @SerializedName("date_of_creation")
    @Expose
    private String dateOfCreation;
    @SerializedName("date_of_modification")
    @Expose
    private String dateOfModification;
    @SerializedName("charge_amount")
    @Expose
    private String chargeAmount;
    @SerializedName("status")
    @Expose
    private String status;

    public String getAssetsUnderCharge() {
        return assetsUnderCharge;
    }

    public void setAssetsUnderCharge(String assetsUnderCharge) {
        this.assetsUnderCharge = assetsUnderCharge;
    }

    public String getChargeId() {
        return chargeId;
    }

    public void setChargeId(String chargeId) {
        this.chargeId = chargeId;
    }

    public String getDateOfCreation() {
        return dateOfCreation;
    }

    public void setDateOfCreation(String dateOfCreation) {
        this.dateOfCreation = dateOfCreation;
    }

    public String getDateOfModification() {
        return dateOfModification;
    }

    public void setDateOfModification(String dateOfModification) {
        this.dateOfModification = dateOfModification;
    }

    public String getChargeAmount() {
        return chargeAmount;
    }

    public void setChargeAmount(String chargeAmount) {
        this.chargeAmount = chargeAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
