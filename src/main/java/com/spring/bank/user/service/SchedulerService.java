package com.spring.bank.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.bank.user.dao.CustomerDAOImpl;

@Component
public class SchedulerService {
	
	@Autowired
	CustomerServiceImpl service;
	
	@Autowired
	CustomerDAOImpl dao;
	
	@Scheduled(cron = "0 09 3 * * *")
	public void autoUpdate() throws Exception {
		System.out.println("스케줄러시작");
		int updateCnt = 0;
		updateCnt= dao.exitAutoTransfer();
		System.out.println("오늘 만기처리 되는 데이터 여부 : updateCnt " + updateCnt);
		service.AutoTransferAction();
		System.out.println("스케줄러 종료");
	}
	
	/*
	@Scheduled(cron = "0 30 16 * * *")
	@Scheduled(fixedRate = 60000) // 1분마다 한번씩
	public void autoTest() throws Exception {
		Date date = new Date();
		System.out.println("오후4시 30분부터 스케줄러테스트 현재시각 : " + date);
	}*/
	
}
