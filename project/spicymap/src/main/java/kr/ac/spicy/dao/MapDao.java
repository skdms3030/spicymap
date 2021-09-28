package kr.ac.spicy.dao;


import java.util.List;

import kr.ac.spicy.model.Store;

public interface MapDao {

	Store store(int storeId);

	String storeName(int storeId);

	List<Store> list();

}
