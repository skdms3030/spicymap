package kr.ac.spicy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.spicy.crawler.SeleniumCrawler2;
import kr.ac.spicy.model.Crawler;
import kr.ac.spicy.model.Store;
import kr.ac.spicy.model.Video;
import kr.ac.spicy.service.MapService;

@Controller
@RequestMapping("/map")
public class MapController {
	
	final String path = "map/";
	
	@Autowired
	MapService service;
	
	@RequestMapping({"","/"})
	public String map(Model model) {
		return path + "map";
	}
	
	
	@RequestMapping("/init")
	@ResponseBody
	public List<Store> init(Model model){
		//가상데이터 시작
		/*
		List<Store> list = new ArrayList<Store>();
		Store l1 = new Store();  //서울
		l1.setStoreId(1);
		l1.setStorePointX("37.5666805");
		l1.setStorePointY("126.9784147");
		list.add(l1);
		
		Store l2 = new Store(); //제주
		l2.setStoreId(2);
		l2.setStorePointX("33.3590628");
		l2.setStorePointY("126.534361");
		list.add(l2);
		
		Store l3 = new Store(); //청주 미친만두
		l3.setStoreId(3);
		l3.setStorePointX("36.662984");
		l3.setStorePointY("127.473808");
		list.add(l3);
		
		Store l4 = new Store(); //군산 지린성
		l4.setStoreId(4);
		l4.setStorePointX("35.979633");
		l4.setStorePointY("126.713982");
		list.add(l4);
		
		Store l5 = new Store(); //부산 영도불짬뽕
		l5.setStoreId(5);
		l5.setStorePointX("35.078045");
		l5.setStorePointY("129.068228");
		list.add(l5);
		*/
		//가상데이터 끝
		
		List<Store> list = new ArrayList<Store>();
		list = service.list();
		System.out.println(list);
		
		return list;
	}
	
	
/*	 @RequestMapping("/inmodal")
	 @ResponseBody 
	 public Store inmodal(Store storeId, Model model){
		 System.out.println(storeId);
		 Store storeInfo = service.store(storeId);
		 System.out.println(storeInfo);
		 
		 return storeInfo;
	 }*/
	 
	 @GetMapping("/inmodal")
	 @ResponseBody
	 public Store inmodal(int storeId){
		 System.out.println("storeId" + storeId);
		 Store storeInfo = service.store(storeId);
		 System.out.println("storeName "+storeInfo.getStoreName());
		 System.out.println("storeInfo "+storeInfo.getStoreId());
		 
		 return storeInfo;
	 }
	
	
	 @GetMapping("/video")
	 @ResponseBody
	 public List<Crawler> video(String storeName) {
		 	System.out.println("crawler "+storeName);
			SeleniumCrawler2 s = new SeleniumCrawler2();
			List<Crawler> videoList = new ArrayList<Crawler>();
			videoList = s.activateBot(storeName);
			System.out.println("videoList "+videoList);
			
			return videoList;
	 }
	
	
	
/*	@RequestMapping("/selenium")
	public String selenium(Model model) {
		SeleniumCrawler2 s = new SeleniumCrawler2();
		
		model.addAttribute("list", s.activateBot("고양이"));
		
		return path + "selenium";
	}*/
}
