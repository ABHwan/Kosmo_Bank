package com.spring.bank.user.vo;

public class CrawlerVO {

	String exchange_country;	// 통화명
	String exchange_rate;		// 매매기준율
	String exchange_buy;	    // 현찰 살 때
    String exchange_sell;       // 현찰 팔 때
    String exchange_transfer;   // 전신환 보낼 때
    String exchange_recive;     // 전신환 받을 때
//	String exchange_state;		// 증감율
	String exchange_com;		// 환율 비교
	
	public CrawlerVO() {}
	
	public CrawlerVO(String exchange_country, String exchange_rate, String exchange_buy, String exchange_sell,
			String exchange_transfer, String exchange_recive) {
		this.exchange_country = exchange_country;
		this.exchange_rate = exchange_rate;
		this.exchange_buy = exchange_buy;
		this.exchange_sell = exchange_sell;
		this.exchange_transfer = exchange_transfer;
		this.exchange_recive = exchange_recive;
	}
	
	public CrawlerVO(String exchange_country, String exchange_rate, String exchange_com) {
		this.exchange_country = exchange_country;
		this.exchange_rate = exchange_rate;
		this.exchange_com = exchange_com;
	}	
	
	public CrawlerVO(String exchange_country, String exchange_rate) {
		this.exchange_country = exchange_country;
		this.exchange_rate = exchange_rate;
	}

	public String getExchange_country() {
		return exchange_country;
	}

	public void setExchange_country(String exchange_country) {
		this.exchange_country = exchange_country;
	}

	public String getExchange_rate() {
		return exchange_rate;
	}

	public void setExchange_rate(String exchange_rate) {
		this.exchange_rate = exchange_rate;
	}

	public String getExchange_buy() {
		return exchange_buy;
	}

	public void setExchange_buy(String exchange_buy) {
		this.exchange_buy = exchange_buy;
	}

	public String getExchange_sell() {
		return exchange_sell;
	}

	public void setExchange_sell(String exchange_sell) {
		this.exchange_sell = exchange_sell;
	}

	public String getExchange_transfer() {
		return exchange_transfer;
	}

	public void setExchange_transfer(String exchange_transfer) {
		this.exchange_transfer = exchange_transfer;
	}

	public String getExchange_recive() {
		return exchange_recive;
	}

	public void setExchange_recive(String exchange_recive) {
		this.exchange_recive = exchange_recive;
	}

	public String getExchange_com() {
		return exchange_com;
	}


	public void setExchange_com(String exchange_com) {
		this.exchange_com = exchange_com;
	}

	@Override
	public String toString() {
		return "CrawlerVO [exchange_country=" + exchange_country + ", exchange_rate=" + exchange_rate
				+ ", exchange_com=" + exchange_com + "]";
	}


	
	
	
}
