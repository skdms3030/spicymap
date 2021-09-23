package kr.ac.spicy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		//여기서부터 가상 데이터
		List<Store> list = new ArrayList<Store>();
		Store l1 = new Store();
		l1.setStorePointX("37.5666805");
		l1.setStorePointY("126.9784147");
		list.add(l1);
		
		Store l2 = new Store();
		l2.setStorePointX("33.3590628");
		l2.setStorePointY("126.534361");
		list.add(l2);
		//여기까지 가상데이터
		
		return list;
	}
}
