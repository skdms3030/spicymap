package kr.ac.spicy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.spicy.model.Store;

@Controller
@RequestMapping({"","/"})
public class MainController {
	@RequestMapping({"","/"})
	public String home(Model model) {
		//여기서부터 가상 데이터
		List<Store> list = new ArrayList<Store>();
		Store l1 = new Store();
		l1.setStoreName("예시 가게명 1");
		l1.setStoreImg("/resources/images/example1.jpg");
		l1.setStoreTel("123-456-789");
		l1.setStoreAddress("예시 가게 주소1");
		list.add(l1);
		
		Store l2 = new Store();
		l2.setStoreName("예시 가게명 1");
		l2.setStoreImg("/resources/images/example1.jpg");
		l2.setStoreTel("123-456-789");
		l2.setStoreAddress("예시 가게 주소1");
		list.add(l2);
		//여기까지 가상데이터
		
		model.addAttribute("list",list);
		return "home";
	}
}
