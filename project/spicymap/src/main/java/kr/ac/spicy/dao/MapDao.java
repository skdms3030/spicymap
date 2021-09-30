package kr.ac.spicy.dao;


import java.util.List;

import kr.ac.spicy.model.Search;
import kr.ac.spicy.model.Store;

public interface MapDao {

	Store store(int storeId);

	String storeName(int storeId);

	List<Store> list();

	List<Store> search(Search item);

	List<Store> searchList(Search keyword1);



}
