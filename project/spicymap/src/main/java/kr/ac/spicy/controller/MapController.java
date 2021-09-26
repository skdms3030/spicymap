package kr.ac.spicy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.spicy.crawler.SeleniumCrawler2;
import kr.ac.spicy.model.Store;

@Controller
@RequestMapping("/map")
public class MapController {
	
	String path = "map/";
	
	@RequestMapping({"","/"})
	public String map(Model model) {
		return path + "map";
	}
	
	
	@RequestMapping("/init")
	@ResponseBody
	public List<Store> init(Model model){
		//가상데이터 시작
		List<Store> list = new ArrayList<Store>();
		Store l1 = new Store();  //서울
		l1.setStorePointX("37.5666805");
		l1.setStorePointY("126.9784147");
		list.add(l1);
		
		Store l2 = new Store(); //제주
		l2.setStorePointX("33.3590628");
		l2.setStorePointY("126.534361");
		list.add(l2);
		
		Store l3 = new Store(); //청주 미친만두
		l3.setStorePointX("36.662984");
		l3.setStorePointY("127.473808");
		list.add(l3);
		
		Store l4 = new Store(); //군산 지린성
		l4.setStorePointX("35.979633");
		l4.setStorePointY("126.713982");
		list.add(l4);
		
		Store l5 = new Store(); //부산 영도불짬뽕
		l5.setStorePointX("35.078045");
		l5.setStorePointY("129.068228");
		list.add(l5);
		//가상데이터 끝
		
		return list;
	}
	
	@RequestMapping("/selenium")
	public String selenium(Model model) {
		SeleniumCrawler2 s = new SeleniumCrawler2();
		
		model.addAttribute("list", s.activateBot("고양이"));
		
		return path + "selenium";
	}
}
