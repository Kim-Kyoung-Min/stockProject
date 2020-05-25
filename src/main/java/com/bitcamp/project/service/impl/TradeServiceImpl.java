package com.bitcamp.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.TradeDAO;
import com.bitcamp.project.service.TradeService;

@Service
public class TradeServiceImpl implements TradeService {

	@Autowired
	TradeDAO tradeDAO;
	
	@Override
	public void stockSearch() {
		tradeDAO.stockSearch();
		
	}

	@Override
	public void callPrice() {
		tradeDAO.callPrice();
	}

	@Override
	public void stockBuying() {
		tradeDAO.stockBuying();
	}

	@Override
	public void stockSelling() {
		tradeDAO.stockSelling();
	}

	@Override
	public void stockCorrection() {
		tradeDAO.stockCorrection();
	}

	@Override
	public void stockCancel() {
		tradeDAO.stockCancel();
	}

	
	
}
