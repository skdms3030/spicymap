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
		//���⼭���� ���� ������
		List<Store> list = new ArrayList<Store>();
		Store l1 = new Store();
		l1.setStoreName("���� ���Ը� 1");
		l1.setStoreImg("/resources/images/example1.jpg");
		l1.setStoreTel("123-456-789");
		l1.setStoreAddress("���� ���� �ּ�1");
		list.add(l1);
		
		Store l2 = new Store();
		l2.setStoreName("���� ���Ը� 1");
		l2.setStoreImg("/resources/images/example1.jpg");
		l2.setStoreTel("123-456-789");
		l2.setStoreAddress("���� ���� �ּ�1");
		list.add(l2);
		//������� ��������
		
		model.addAttribute("list",list);
		return "home";
	}
}
