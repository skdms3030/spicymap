package kr.ac.spicy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.spicy.model.Store;

@Controller
@RequestMapping({"","/"})
public class MainController {
	@RequestMapping({"","/"})
	public String home(Model model) {
		return "home";
	}
	

}
