package kr.ac.spicy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.spicy.crawler.SeleniumCrawler2;
import kr.ac.spicy.model.Crawler;
import kr.ac.spicy.model.Search;
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
	
	/*
	//검색
	@GetMapping("/search")
	public String search(Model model, Search item) {
		List<Store> list = new ArrayList<Store>();
		System.out.println("item"+item);
		list = service.search(item);
		System.out.println("list "+list);
		model.addAttribute("list",list);
		
		return path + "search";
	}
	*/
	
	
	//상점 좌표 리스트
	@RequestMapping("/init")
	@ResponseBody
	public List<Store> init(Model model){

		
		List<Store> list = new ArrayList<Store>();
		list = service.list();
		System.out.println(list);
		
		return list;
	}
	
	
	//상점 좌표 리스트
	@GetMapping("/search")
	@ResponseBody
	public List<Store> init(Model model, int select, String keyword){
		
		Search keyword1 = new Search();
		keyword1.setSelect(select);
		keyword1.setKeyword(keyword);

		
		List<Store> list = new ArrayList<Store>();
		list = service.searchList(keyword1);
		//list = service.list();
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
	 
	//상점모달에 상점정보
	 @GetMapping("/inmodal")
	 @ResponseBody
	 public Store inmodal(int storeId){
		 System.out.println("storeId" + storeId);
		 Store storeInfo = service.store(storeId);
		 System.out.println("storeName "+storeInfo.getStoreName());
		 System.out.println("storeInfo "+storeInfo.getStoreId());
		 
		 return storeInfo;
	 }
	
	 
	 //상점 모달에 웹크롤링 결과
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
	
	 
	 @RequestMapping("/setting")
	 public String setting() {
		 return path + "setting";
	 }
	

	 
	 
/*	@RequestMapping("/selenium")
	public String selenium(Model model) {
		SeleniumCrawler2 s = new SeleniumCrawler2();
		
		model.addAttribute("list", s.activateBot("고양이"));
		
		return path + "selenium";
	}*/
}
