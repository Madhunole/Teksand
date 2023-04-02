package com.teksands.bootcamp.pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class CompanyMasterData {
	@SerializedName("company_category")
    @Expose
    private String companyCategory;
    @SerializedName("email_id")
    @Expose
    private String emailId;
    @SerializedName("class_of_company")
    @Expose
    private String classOfCompany;
    @SerializedName("number_of_members(applicable_in_case_of_company_without_share_capital)")
    @Expose
    private String numberOfMembersApplicableInCaseOfCompanyWithoutShareCapital;
    @SerializedName("address_other_than_r/o_where_all_or_any_books_of_account_and_papers_are_maintained")
    @Expose
    private String addressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained;
    @SerializedName("date_of_last_agm")
    @Expose
    private String dateOfLastAgm;
    @SerializedName("registered_address")
    @Expose
    private String registeredAddress;
    @SerializedName("active_compliance")
    @Expose
    private String activeCompliance;
    @SerializedName("registration_number")
    @Expose
    private String registrationNumber;
    @SerializedName("paid_up_capital(rs)")
    @Expose
    private String paidUpCapitalRs;
    @SerializedName("whether_listed_or_not")
    @Expose
    private String whetherListedOrNot;
    @SerializedName("suspended_at_stock_exchange")
    @Expose
    private String suspendedAtStockExchange;
    @SerializedName("company_subcategory")
    @Expose
    private String companySubcategory;
    @SerializedName("authorised_capital(rs)")
    @Expose
    private String authorisedCapitalRs;
    @SerializedName("company_status(for_efiling)")
    @Expose
    private String companyStatusForEfiling;
    @SerializedName("roc_code")
    @Expose
    private String rocCode;
    @SerializedName("date_of_balance_sheet")
    @Expose
    private String dateOfBalanceSheet;
    @SerializedName("date_of_incorporation")
    @Expose
    private String dateOfIncorporation;
    @SerializedName("cin\u00a0")
    @Expose
    private String cin;
    @SerializedName("company_name")
    @Expose
    private String companyName;

    public String getCompanyCategory() {
        return companyCategory;
    }

    public void setCompanyCategory(String companyCategory) {
        this.companyCategory = companyCategory;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getClassOfCompany() {
        return classOfCompany;
    }

    public void setClassOfCompany(String classOfCompany) {
        this.classOfCompany = classOfCompany;
    }

    public String getNumberOfMembersApplicableInCaseOfCompanyWithoutShareCapital() {
        return numberOfMembersApplicableInCaseOfCompanyWithoutShareCapital;
    }

    public void setNumberOfMembersApplicableInCaseOfCompanyWithoutShareCapital(String numberOfMembersApplicableInCaseOfCompanyWithoutShareCapital) {
        this.numberOfMembersApplicableInCaseOfCompanyWithoutShareCapital = numberOfMembersApplicableInCaseOfCompanyWithoutShareCapital;
    }

    public String getAddressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained() {
        return addressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained;
    }

    public void setAddressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained(String addressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained) {
        this.addressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained = addressOtherThanROWhereAllOrAnyBooksOfAccountAndPapersAreMaintained;
    }

    public String getDateOfLastAgm() {
        return dateOfLastAgm;
    }

    public void setDateOfLastAgm(String dateOfLastAgm) {
        this.dateOfLastAgm = dateOfLastAgm;
    }

    public String getRegisteredAddress() {
        return registeredAddress;
    }

    public void setRegisteredAddress(String registeredAddress) {
        this.registeredAddress = registeredAddress;
    }

    public String getActiveCompliance() {
        return activeCompliance;
    }

    public void setActiveCompliance(String activeCompliance) {
        this.activeCompliance = activeCompliance;
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getPaidUpCapitalRs() {
        return paidUpCapitalRs;
    }

    public void setPaidUpCapitalRs(String paidUpCapitalRs) {
        this.paidUpCapitalRs = paidUpCapitalRs;
    }

    public String getWhetherListedOrNot() {
        return whetherListedOrNot;
    }

    public void setWhetherListedOrNot(String whetherListedOrNot) {
        this.whetherListedOrNot = whetherListedOrNot;
    }

    public String getSuspendedAtStockExchange() {
        return suspendedAtStockExchange;
    }

    public void setSuspendedAtStockExchange(String suspendedAtStockExchange) {
        this.suspendedAtStockExchange = suspendedAtStockExchange;
    }

    public String getCompanySubcategory() {
        return companySubcategory;
    }

    public void setCompanySubcategory(String companySubcategory) {
        this.companySubcategory = companySubcategory;
    }

    public String getAuthorisedCapitalRs() {
        return authorisedCapitalRs;
    }

    public void setAuthorisedCapitalRs(String authorisedCapitalRs) {
        this.authorisedCapitalRs = authorisedCapitalRs;
    }

    public String getCompanyStatusForEfiling() {
        return companyStatusForEfiling;
    }

    public void setCompanyStatusForEfiling(String companyStatusForEfiling) {
        this.companyStatusForEfiling = companyStatusForEfiling;
    }

    public String getRocCode() {
        return rocCode;
    }

    public void setRocCode(String rocCode) {
        this.rocCode = rocCode;
    }

    public String getDateOfBalanceSheet() {
        return dateOfBalanceSheet;
    }

    public void setDateOfBalanceSheet(String dateOfBalanceSheet) {
        this.dateOfBalanceSheet = dateOfBalanceSheet;
    }

    public String getDateOfIncorporation() {
        return dateOfIncorporation;
    }

    public void setDateOfIncorporation(String dateOfIncorporation) {
        this.dateOfIncorporation = dateOfIncorporation;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
}
