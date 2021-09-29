package kr.ac.spicy.service;

import java.util.List;

import kr.ac.spicy.model.Search;
import kr.ac.spicy.model.Store;

public interface MapService {

	Store store(int storeId);

	String storeName(int storeId);

	List<Store> list();

	List<Store> search(Search item);

}
