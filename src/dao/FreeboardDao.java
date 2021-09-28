package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Freeboard;
import mybatis.SqlSessionBean;

public class FreeboardDao {

	private static FreeboardDao dao = new FreeboardDao();
	private FreeboardDao() {}
	public static FreeboardDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	public List<Freeboard> getList(Map<String, Integer> map){	//key(변수명처럼 이해) String, value 는 int
		List<Freeboard> list =null;
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("getList",map);
		mapper.close();
		return list;
		
	}
	public Freeboard getOne(int idx) {
		Freeboard dto = null;
		SqlSession mapper = sqlFactory.openSession();
		dto = mapper.selectOne("selectByIdx",idx);
		mapper.close();
		return dto;
	}
	
	public int getCount() {
		SqlSession mapper = sqlFactory.openSession();
		int cnt = mapper.selectOne("getCount");		
		mapper.close();
		return cnt;
	}
	
	public void insert(Freeboard dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("insert", dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Freeboard dto) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("update", dto);
		mapper.commit();
		mapper.close();
	}
	
	public void delete(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.delete("delete", idx);
		mapper.commit();
		mapper.close();
	}
	
}
