package kr.ac.spicy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.spicy.dao.MapDao;
import kr.ac.spicy.model.Store;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	MapDao dao;

	@Override
	public Store store(int storeId) {
		return dao.store(storeId);
		
	}

}
