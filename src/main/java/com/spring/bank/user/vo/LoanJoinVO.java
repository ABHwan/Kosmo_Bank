package com.spring.bank.user.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class LoanJoinVO {
	//AccountVO
	private String account_id;
	private int account_password;
	//private String member_id; fk
	private int account_balance;
	private int account_type;
	private int account_state;
	private String account_stateContent;
	private int account_limit;
	private Date account_deleteDate;
	private Date account_sleepDate;
	private Date account_newDate;
	private int account_bankCode;
	//AccountVO
	
	//UserVO
	private String member_id; // PK
	private String member_password;
	private String member_name;
	private String member_birth;
	private String member_hp;
	private String member_email;
	private int member_zipcode;
	private String member_addr1;
	private String member_addr2;
	private String member_addr3;
    private Timestamp member_indate;
    private int member_enabled;   		// 이메일 인증키
    private String member_authority; // 회원등급 코드
    
    private String access_token;
    private String refresh_token;
    private String user_seq_no;
	//UserVO

	//Auto_TransferVO
	private int auto_id;
	//private String account_id; fk
	private String auto_senderAccount;
	private int auto_type;
	private Date auto_outDate;
	private int auto_money;
	private String auto_cycle;
	private Date auto_registDate;
	private Date auto_expirationDate;
	private Date auto_cancle;
	private String auto_inPlace;
	private int auto_status;
	private Date auto_lastDay;
	//Auto_TransferVO

	//LoanVO
	private int loan_id;
	//private String loan_product_name; fk
	//private String member_id; fk
	//private String account_id; fk
	private int loan_state;
	private Date loan_startDate;
	private Date loan_endDate;
	private int loan_month;
	private int loan_repaymentType;
	private float loan_rate;
	private int loan_monthlyRepayment;
	private int loan_amount;
	private int loan_balance;
	private int loan_interest;
	private int loan_tranAmount;
	private int loan_tranInterest;
	private int loan_delinquency;
	private float loan_prepaymentRate;
	//LoanVO

	//LoanProductVO
	private String loan_product_name;
	private float loan_product_rate;
	private String loan_product_summary;
	private int loan_product_minPrice;
	private int loan_product_maxPrice;
	private int loan_product_minDate;
	private int loan_product_maxDate;
	private int loan_product_bankCode;
	private Date loan_product_baseDate;
	private float loan_product_prepaymentRate;
	//LoanProductVO
	
	//LoanHistoryVO
	private int loan_history_id;
	//private int loan_id; fk
	private int transfer_id;
	private Date loan_history_date;
	private int loan_history_state;
	private int loan_history_amount;
	//LoanHistoryVO
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public int getAccount_password() {
		return account_password;
	}
	public void setAccount_password(int account_password) {
		this.account_password = account_password;
	}
	public int getAccount_balance() {
		return account_balance;
	}
	public void setAccount_balance(int account_balance) {
		this.account_balance = account_balance;
	}
	public int getAccount_type() {
		return account_type;
	}
	public void setAccount_type(int account_type) {
		this.account_type = account_type;
	}
	public int getAccount_state() {
		return account_state;
	}
	public void setAccount_state(int account_state) {
		this.account_state = account_state;
	}
	public String getAccount_stateContent() {
		return account_stateContent;
	}
	public void setAccount_stateContent(String account_stateContent) {
		this.account_stateContent = account_stateContent;
	}
	public int getAccount_limit() {
		return account_limit;
	}
	public void setAccount_limit(int account_limit) {
		this.account_limit = account_limit;
	}
	public Date getAccount_deleteDate() {
		return account_deleteDate;
	}
	public void setAccount_deleteDate(Date account_deleteDate) {
		this.account_deleteDate = account_deleteDate;
	}
	public Date getAccount_sleepDate() {
		return account_sleepDate;
	}
	public void setAccount_sleepDate(Date account_sleepDate) {
		this.account_sleepDate = account_sleepDate;
	}
	public Date getAccount_newDate() {
		return account_newDate;
	}
	public void setAccount_newDate(Date account_newDate) {
		this.account_newDate = account_newDate;
	}
	public int getAccount_bankCode() {
		return account_bankCode;
	}
	public void setAccount_bankCode(int account_bankCode) {
		this.account_bankCode = account_bankCode;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_hp() {
		return member_hp;
	}
	public void setMember_hp(String member_hp) {
		this.member_hp = member_hp;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(int member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_addr1() {
		return member_addr1;
	}
	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}
	public String getMember_addr2() {
		return member_addr2;
	}
	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}
	public String getMember_addr3() {
		return member_addr3;
	}
	public void setMember_addr3(String member_addr3) {
		this.member_addr3 = member_addr3;
	}
	public Timestamp getMember_indate() {
		return member_indate;
	}
	public void setMember_indate(Timestamp member_indate) {
		this.member_indate = member_indate;
	}
	public int getMember_enabled() {
		return member_enabled;
	}
	public void setMember_enabled(int member_enabled) {
		this.member_enabled = member_enabled;
	}
	public String getMember_authority() {
		return member_authority;
	}
	public void setMember_authority(String member_authority) {
		this.member_authority = member_authority;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getRefresh_token() {
		return refresh_token;
	}
	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}
	public String getUser_seq_no() {
		return user_seq_no;
	}
	public void setUser_seq_no(String user_seq_no) {
		this.user_seq_no = user_seq_no;
	}
	public int getAuto_id() {
		return auto_id;
	}
	public void setAuto_id(int auto_id) {
		this.auto_id = auto_id;
	}
	public String getAuto_senderAccount() {
		return auto_senderAccount;
	}
	public void setAuto_senderAccount(String auto_senderAccount) {
		this.auto_senderAccount = auto_senderAccount;
	}
	public int getAuto_type() {
		return auto_type;
	}
	public void setAuto_type(int auto_type) {
		this.auto_type = auto_type;
	}
	public Date getAuto_outDate() {
		return auto_outDate;
	}
	public void setAuto_outDate(Date auto_outDate) {
		this.auto_outDate = auto_outDate;
	}
	public int getAuto_money() {
		return auto_money;
	}
	public void setAuto_money(int auto_money) {
		this.auto_money = auto_money;
	}
	public String getAuto_cycle() {
		return auto_cycle;
	}
	public void setAuto_cycle(String auto_cycle) {
		this.auto_cycle = auto_cycle;
	}
	public Date getAuto_registDate() {
		return auto_registDate;
	}
	public void setAuto_registDate(Date auto_registDate) {
		this.auto_registDate = auto_registDate;
	}
	public Date getAuto_expirationDate() {
		return auto_expirationDate;
	}
	public void setAuto_expirationDate(Date auto_expirationDate) {
		this.auto_expirationDate = auto_expirationDate;
	}
	public Date getAuto_cancle() {
		return auto_cancle;
	}
	public void setAuto_cancle(Date auto_cancle) {
		this.auto_cancle = auto_cancle;
	}
	public String getAuto_inPlace() {
		return auto_inPlace;
	}
	public void setAuto_inPlace(String auto_inPlace) {
		this.auto_inPlace = auto_inPlace;
	}
	public int getAuto_status() {
		return auto_status;
	}
	public void setAuto_status(int auto_status) {
		this.auto_status = auto_status;
	}
	public Date getAuto_lastDay() {
		return auto_lastDay;
	}
	public void setAuto_lastDay(Date auto_lastDay) {
		this.auto_lastDay = auto_lastDay;
	}
	public int getLoan_id() {
		return loan_id;
	}
	public void setLoan_id(int loan_id) {
		this.loan_id = loan_id;
	}
	public int getLoan_state() {
		return loan_state;
	}
	public void setLoan_state(int loan_state) {
		this.loan_state = loan_state;
	}
	public Date getLoan_startDate() {
		return loan_startDate;
	}
	public void setLoan_startDate(Date loan_startDate) {
		this.loan_startDate = loan_startDate;
	}
	public Date getLoan_endDate() {
		return loan_endDate;
	}
	public void setLoan_endDate(Date loan_endDate) {
		this.loan_endDate = loan_endDate;
	}
	public int getLoan_month() {
		return loan_month;
	}
	public void setLoan_month(int loan_month) {
		this.loan_month = loan_month;
	}
	public int getLoan_repaymentType() {
		return loan_repaymentType;
	}
	public void setLoan_repaymentType(int loan_repaymentType) {
		this.loan_repaymentType = loan_repaymentType;
	}
	public float getLoan_rate() {
		return loan_rate;
	}
	public void setLoan_rate(float loan_rate) {
		this.loan_rate = loan_rate;
	}
	public int getLoan_monthlyRepayment() {
		return loan_monthlyRepayment;
	}
	public void setLoan_monthlyRepayment(int loan_monthlyRepayment) {
		this.loan_monthlyRepayment = loan_monthlyRepayment;
	}
	public int getLoan_amount() {
		return loan_amount;
	}
	public void setLoan_amount(int loan_amount) {
		this.loan_amount = loan_amount;
	}
	public int getLoan_balance() {
		return loan_balance;
	}
	public void setLoan_balance(int loan_balance) {
		this.loan_balance = loan_balance;
	}
	public int getLoan_interest() {
		return loan_interest;
	}
	public void setLoan_interest(int loan_interest) {
		this.loan_interest = loan_interest;
	}
	public int getLoan_tranAmount() {
		return loan_tranAmount;
	}
	public void setLoan_tranAmount(int loan_tranAmount) {
		this.loan_tranAmount = loan_tranAmount;
	}
	public int getLoan_tranInterest() {
		return loan_tranInterest;
	}
	public void setLoan_tranInterest(int loan_tranInterest) {
		this.loan_tranInterest = loan_tranInterest;
	}
	public int getLoan_delinquency() {
		return loan_delinquency;
	}
	public void setLoan_delinquency(int loan_delinquency) {
		this.loan_delinquency = loan_delinquency;
	}
	public float getLoan_prepaymentRate() {
		return loan_prepaymentRate;
	}
	public void setLoan_prepaymentRate(float loan_prepaymentRate) {
		this.loan_prepaymentRate = loan_prepaymentRate;
	}
	public String getLoan_product_name() {
		return loan_product_name;
	}
	public void setLoan_product_name(String loan_product_name) {
		this.loan_product_name = loan_product_name;
	}
	public float getLoan_product_rate() {
		return loan_product_rate;
	}
	public void setLoan_product_rate(float loan_product_rate) {
		this.loan_product_rate = loan_product_rate;
	}
	public String getLoan_product_summary() {
		return loan_product_summary;
	}
	public void setLoan_product_summary(String loan_product_summary) {
		this.loan_product_summary = loan_product_summary;
	}
	public int getLoan_product_minPrice() {
		return loan_product_minPrice;
	}
	public void setLoan_product_minPrice(int loan_product_minPrice) {
		this.loan_product_minPrice = loan_product_minPrice;
	}
	public int getLoan_product_maxPrice() {
		return loan_product_maxPrice;
	}
	public void setLoan_product_maxPrice(int loan_product_maxPrice) {
		this.loan_product_maxPrice = loan_product_maxPrice;
	}
	public int getLoan_product_minDate() {
		return loan_product_minDate;
	}
	public void setLoan_product_minDate(int loan_product_minDate) {
		this.loan_product_minDate = loan_product_minDate;
	}
	public int getLoan_product_maxDate() {
		return loan_product_maxDate;
	}
	public void setLoan_product_maxDate(int loan_product_maxDate) {
		this.loan_product_maxDate = loan_product_maxDate;
	}
	public int getLoan_product_bankCode() {
		return loan_product_bankCode;
	}
	public void setLoan_product_bankCode(int loan_product_bankCode) {
		this.loan_product_bankCode = loan_product_bankCode;
	}
	public Date getLoan_product_baseDate() {
		return loan_product_baseDate;
	}
	public void setLoan_product_baseDate(Date loan_product_baseDate) {
		this.loan_product_baseDate = loan_product_baseDate;
	}
	public float getLoan_product_prepaymentRate() {
		return loan_product_prepaymentRate;
	}
	public void setLoan_product_prepaymentRate(float loan_product_prepaymentRate) {
		this.loan_product_prepaymentRate = loan_product_prepaymentRate;
	}
	public int getLoan_history_id() {
		return loan_history_id;
	}
	public void setLoan_history_id(int loan_history_id) {
		this.loan_history_id = loan_history_id;
	}
	public int getTransfer_id() {
		return transfer_id;
	}
	public void setTransfer_id(int transfer_id) {
		this.transfer_id = transfer_id;
	}
	public Date getLoan_history_date() {
		return loan_history_date;
	}
	public void setLoan_history_date(Date loan_history_date) {
		this.loan_history_date = loan_history_date;
	}
	public int getLoan_history_state() {
		return loan_history_state;
	}
	public void setLoan_history_state(int loan_history_state) {
		this.loan_history_state = loan_history_state;
	}
	public int getLoan_history_amount() {
		return loan_history_amount;
	}
	public void setLoan_history_amount(int loan_history_amount) {
		this.loan_history_amount = loan_history_amount;
	}
	
	@Override
	public String toString() {
		return "LoanJoinVO [account_id=" + account_id + ", account_password=" + account_password + ", account_balance="
				+ account_balance + ", account_type=" + account_type + ", account_state=" + account_state
				+ ", account_stateContent=" + account_stateContent + ", account_limit=" + account_limit
				+ ", account_deleteDate=" + account_deleteDate + ", account_sleepDate=" + account_sleepDate
				+ ", account_newDate=" + account_newDate + ", account_bankCode=" + account_bankCode + ", member_id="
				+ member_id + ", member_password=" + member_password + ", member_name=" + member_name
				+ ", member_birth=" + member_birth + ", member_hp=" + member_hp + ", member_email=" + member_email
				+ ", member_zipcode=" + member_zipcode + ", member_addr1=" + member_addr1 + ", member_addr2="
				+ member_addr2 + ", member_addr3=" + member_addr3 + ", member_indate=" + member_indate
				+ ", member_enabled=" + member_enabled + ", member_authority=" + member_authority + ", access_token="
				+ access_token + ", refresh_token=" + refresh_token + ", user_seq_no=" + user_seq_no + ", auto_id="
				+ auto_id + ", auto_senderAccount=" + auto_senderAccount + ", auto_type=" + auto_type
				+ ", auto_outDate=" + auto_outDate + ", auto_money=" + auto_money + ", auto_cycle=" + auto_cycle
				+ ", auto_registDate=" + auto_registDate + ", auto_expirationDate=" + auto_expirationDate
				+ ", auto_cancle=" + auto_cancle + ", auto_inPlace=" + auto_inPlace + ", auto_status=" + auto_status
				+ ", auto_lastDay=" + auto_lastDay + ", loan_id=" + loan_id + ", loan_state=" + loan_state
				+ ", loan_startDate=" + loan_startDate + ", loan_endDate=" + loan_endDate + ", loan_month=" + loan_month
				+ ", loan_repaymentType=" + loan_repaymentType + ", loan_rate=" + loan_rate + ", loan_monthlyRepayment="
				+ loan_monthlyRepayment + ", loan_amount=" + loan_amount + ", loan_balance=" + loan_balance
				+ ", loan_interest=" + loan_interest + ", loan_tranAmount=" + loan_tranAmount + ", loan_tranInterest="
				+ loan_tranInterest + ", loan_delinquency=" + loan_delinquency + ", loan_prepaymentRate="
				+ loan_prepaymentRate + ", loan_product_name=" + loan_product_name + ", loan_product_rate="
				+ loan_product_rate + ", loan_product_summary=" + loan_product_summary + ", loan_product_minPrice="
				+ loan_product_minPrice + ", loan_product_maxPrice=" + loan_product_maxPrice + ", loan_product_minDate="
				+ loan_product_minDate + ", loan_product_maxDate=" + loan_product_maxDate + ", loan_product_bankCode="
				+ loan_product_bankCode + ", loan_product_baseDate=" + loan_product_baseDate
				+ ", loan_product_prepaymentRate=" + loan_product_prepaymentRate + ", loan_history_id="
				+ loan_history_id + ", transfer_id=" + transfer_id + ", loan_history_date=" + loan_history_date
				+ ", loan_history_state=" + loan_history_state + ", loan_history_amount=" + loan_history_amount + "]";
	}
	
	
}
