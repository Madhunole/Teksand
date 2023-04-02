package com.teksands.bootcamp.pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class LlpMasterData {
	@SerializedName("email_id")
    @Expose
    private String emailId;
    @SerializedName("registered_address")
    @Expose
    private String registeredAddress;
    @SerializedName("date_of_last_financial_year_end_date_for_which_annual_return_filed")
    @Expose
    private String dateOfLastFinancialYearEndDateForWhichAnnualReturnFiled;
    @SerializedName("date_of_last_financial_year_end_date_for_which_statement_of_accounts_and_solvency_filed")
    @Expose
    private String dateOfLastFinancialYearEndDateForWhichStatementOfAccountsAndSolvencyFiled;
    @SerializedName("main_division_of_business_activity_to_be_carried_out_in_india")
    @Expose
    private String mainDivisionOfBusinessActivityToBeCarriedOutInIndia;
    @SerializedName("previous_firm/_company_details,_if_applicable")
    @Expose
    private String previousFirmCompanyDetailsIfApplicable;
    @SerializedName("roc_code")
    @Expose
    private String rocCode;
    @SerializedName("number_of_designated_partners")
    @Expose
    private String numberOfDesignatedPartners;
    @SerializedName("date_of_incorporation")
    @Expose
    private String dateOfIncorporation;
    @SerializedName("llp_name")
    @Expose
    private String llpName;
    @SerializedName("total_obligation_of_contribution")
    @Expose
    private String totalObligationOfContribution;
    @SerializedName("llpin\u00a0")
    @Expose
    private String llpin;
    @SerializedName("llp_status")
    @Expose
    private String llpStatus;
    @SerializedName("description_of_main_division")
    @Expose
    private String descriptionOfMainDivision;
    @SerializedName("number_of_partners")
    @Expose
    private String numberOfPartners;

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getRegisteredAddress() {
        return registeredAddress;
    }

    public void setRegisteredAddress(String registeredAddress) {
        this.registeredAddress = registeredAddress;
    }

    public String getDateOfLastFinancialYearEndDateForWhichAnnualReturnFiled() {
        return dateOfLastFinancialYearEndDateForWhichAnnualReturnFiled;
    }

    public void setDateOfLastFinancialYearEndDateForWhichAnnualReturnFiled(String dateOfLastFinancialYearEndDateForWhichAnnualReturnFiled) {
        this.dateOfLastFinancialYearEndDateForWhichAnnualReturnFiled = dateOfLastFinancialYearEndDateForWhichAnnualReturnFiled;
    }

    public String getDateOfLastFinancialYearEndDateForWhichStatementOfAccountsAndSolvencyFiled() {
        return dateOfLastFinancialYearEndDateForWhichStatementOfAccountsAndSolvencyFiled;
    }

    public void setDateOfLastFinancialYearEndDateForWhichStatementOfAccountsAndSolvencyFiled(String dateOfLastFinancialYearEndDateForWhichStatementOfAccountsAndSolvencyFiled) {
        this.dateOfLastFinancialYearEndDateForWhichStatementOfAccountsAndSolvencyFiled = dateOfLastFinancialYearEndDateForWhichStatementOfAccountsAndSolvencyFiled;
    }

    public String getMainDivisionOfBusinessActivityToBeCarriedOutInIndia() {
        return mainDivisionOfBusinessActivityToBeCarriedOutInIndia;
    }

    public void setMainDivisionOfBusinessActivityToBeCarriedOutInIndia(String mainDivisionOfBusinessActivityToBeCarriedOutInIndia) {
        this.mainDivisionOfBusinessActivityToBeCarriedOutInIndia = mainDivisionOfBusinessActivityToBeCarriedOutInIndia;
    }

    public String getPreviousFirmCompanyDetailsIfApplicable() {
        return previousFirmCompanyDetailsIfApplicable;
    }

    public void setPreviousFirmCompanyDetailsIfApplicable(String previousFirmCompanyDetailsIfApplicable) {
        this.previousFirmCompanyDetailsIfApplicable = previousFirmCompanyDetailsIfApplicable;
    }

    public String getRocCode() {
        return rocCode;
    }

    public void setRocCode(String rocCode) {
        this.rocCode = rocCode;
    }

    public String getNumberOfDesignatedPartners() {
        return numberOfDesignatedPartners;
    }

    public void setNumberOfDesignatedPartners(String numberOfDesignatedPartners) {
        this.numberOfDesignatedPartners = numberOfDesignatedPartners;
    }

    public String getDateOfIncorporation() {
        return dateOfIncorporation;
    }

    public void setDateOfIncorporation(String dateOfIncorporation) {
        this.dateOfIncorporation = dateOfIncorporation;
    }

    public String getLlpName() {
        return llpName;
    }

    public void setLlpName(String llpName) {
        this.llpName = llpName;
    }

    public String getTotalObligationOfContribution() {
        return totalObligationOfContribution;
    }

    public void setTotalObligationOfContribution(String totalObligationOfContribution) {
        this.totalObligationOfContribution = totalObligationOfContribution;
    }

    public String getLlpin() {
        return llpin;
    }

    public void setLlpin(String llpin) {
        this.llpin = llpin;
    }

    public String getLlpStatus() {
        return llpStatus;
    }

    public void setLlpStatus(String llpStatus) {
        this.llpStatus = llpStatus;
    }

    public String getDescriptionOfMainDivision() {
        return descriptionOfMainDivision;
    }

    public void setDescriptionOfMainDivision(String descriptionOfMainDivision) {
        this.descriptionOfMainDivision = descriptionOfMainDivision;
    }

    public String getNumberOfPartners() {
        return numberOfPartners;
    }

    public void setNumberOfPartners(String numberOfPartners) {
        this.numberOfPartners = numberOfPartners;
    }
}
