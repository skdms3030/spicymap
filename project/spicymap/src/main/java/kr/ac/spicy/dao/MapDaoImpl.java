package kr.ac.spicy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.spicy.model.Store;

@Repository
public class MapDaoImpl implements MapDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public Store store(int storeId) {
		return sql.selectOne("store.select", storeId);
		
	}
	
	
}
