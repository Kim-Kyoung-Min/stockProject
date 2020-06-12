package com.bitcamp.project.vo;

import java.util.Arrays;
import java.util.List;

public class Info {
	// 종목명	현재가	전일비	등락률	액면가	거래량	시가	고가	저가
	
	
	
	private String stockName; //종목명
	private int currentPrice; //현재가
	private String before; //전일비
	private String upDown; //등락률
	private String maximum; // 상한가
	private String minimum; // 하한가
	private int[] up; // 호가+
	private int[] down; // 호가-
	
	private String[] topName; // 상한가 TOP 종목
	private String[] topCurrentPrice; // 상한가 TOP 현재가
	private String[] topBefore; // 상한가 TOP 전일비
	private String[] topUpDown; // 상한가 TOP 인기등락률
	
	private String[] searchName; // 검색 TOP 종목
	private String[] searchCurrentPrice; // 검색 TOP 현재가
	private String[] searchBefore; // 검색 TOP 전일비
	private String[] searchUpDown; // 검색 TOP 인기등락률
	private String[] searchSangHa; // 검색 TOP 전날대비 상승 하락
	
	
	
	
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public int getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(int currentPrice) {
		this.currentPrice = currentPrice;
	}
	public String getBefore() {
		return before;
	}
	public void setBefore(String before) {
		this.before = before;
	}
	public String getUpDown() {
		return upDown;
	}
	public void setUpDown(String upDown) {
		this.upDown = upDown;
	}
	public String getMaximum() {
		return maximum;
	}
	public void setMaximum(String maximum) {
		this.maximum = maximum;
	}
	public String getMinimum() {
		return minimum;
	}
	public void setMinimum(String minimum) {
		this.minimum = minimum;
	}
	public int[] getUp() {
		return up;
	}
	public void setUp(int[] up) {
		this.up = up;
	}
	public int[] getDown() {
		return down;
	}
	public void setDown(int[] down) {
		this.down = down;
	}
	
	public String[] getTopName() {
		return topName;
	}
	public void setTopName(String[] topName) {
		this.topName = topName;
	}
	public String[] getTopCurrentPrice() {
		return topCurrentPrice;
	}
	public void setTopCurrentPrice(String[] topCurrentPrice) {
		this.topCurrentPrice = topCurrentPrice;
	}
	public String[] getTopBefore() {
		return topBefore;
	}
	public void setTopBefore(String[] topBefore) {
		this.topBefore = topBefore;
	}
	public String[] getTopUpDown() {
		return topUpDown;
	}
	public void setTopUpDown(String[] topUpDown) {
		this.topUpDown = topUpDown;
	}
	
	
	public String[] getSearchName() {
		return searchName;
	}
	public void setSearchName(String[] searchName) {
		this.searchName = searchName;
	}
	public String[] getSearchCurrentPrice() {
		return searchCurrentPrice;
	}
	public void setSearchCurrentPrice(String[] searchCurrentPrice) {
		this.searchCurrentPrice = searchCurrentPrice;
	}
	
	public String[] getSearchBefore() {
		return searchBefore;
	}
	public void setSearchBefore(String[] searchBefore) {
		this.searchBefore = searchBefore;
	}
	public String[] getSearchUpDown() {
		return searchUpDown;
	}
	public void setSearchUpDown(String[] searchUpDown) {
		this.searchUpDown = searchUpDown;
	}
	
	public String[] getSearchSangHa() {
		return searchSangHa;
	}
	public void setSearchSangHa(String[] searchSangHa) {
		this.searchSangHa = searchSangHa;
	}
	@Override
	public String toString() {
		return "Info [stockName=" + stockName + ", currentPrice=" + currentPrice + ", before=" + before + ", upDown="
				+ upDown + ", maximum=" + maximum + ", minimum=" + minimum + ", up=" + Arrays.toString(up) + ", down="
				+ Arrays.toString(down) + "]";
	}
	
	
	
	
	
	
}
