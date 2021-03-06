package kr.ac.spicy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.spicy.dao.MapDao;
import kr.ac.spicy.model.Search;
import kr.ac.spicy.model.Store;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	MapDao dao;

	@Override
	public Store store(int storeId) {
		
		return dao.store(storeId);
		
	}

	@Override
	public String storeName(int storeId) {
		return dao.storeName(storeId);
	}

	@Override
	public List<Store> list() {
		return dao.list();
	}

	@Override
	public List<Store> search(Search item) {
		return dao.search(item);
	}

	@Override
	public List<Store> searchList(Search keyword1) {
		return dao.searchList(keyword1);
	}





}
