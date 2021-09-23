package kr.ac.spicy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.spicy.model.Store;

@Controller
@RequestMapping("/map")
public class MapController {
	
	String path = "map/";
	
	@RequestMapping({"","/"})
	public String map(Model model) {
		//���⼭���� ���� ������
		List<Store> list = new ArrayList<Store>();
		Store l1 = new Store();
		l1.setStoreName("��û");
		l1.setStoreImg("/resources/images/example1.jpg");
		l1.setStoreTel("123-456-789");
		l1.setStoreAddress("���� ���� �ּ�1");
		l1.setStorePoint("37.5666805, 126.9784147");
		list.add(l1);
		
		Store l2 = new Store();
		l2.setStoreName("����");
		l2.setStoreImg("/resources/images/example1.jpg");
		l2.setStoreTel("123-456-789");
		l2.setStoreAddress("���� ���� �ּ�1");
		l2.setStorePoint("33.3590628, 126.534361");
		list.add(l2);
		//������� ��������
		
		model.addAttribute("list",list);
		return path + "map";
	}
}
