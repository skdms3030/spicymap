package kr.ac.spicy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.spicy.model.Search;
import kr.ac.spicy.model.Store;

@Repository
public class MapDaoImpl implements MapDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public Store store(int storeId) {
		
		return sql.selectOne("store.item", storeId);
	}

	@Override
	public String storeName(int storeId) {
		return sql.selectOne("store.storeName", storeId);
	}

	@Override
	public List<Store> list() {
		return sql.selectList("store.list");
	}

	
	@Override
	public List<Store> search(Search item) {
		return sql.selectList("store.search", item);
	}

	@Override
	public List<Store> searchList(Search keyword1) {
		return sql.selectList("store.searchList", keyword1);
	}
	




}
