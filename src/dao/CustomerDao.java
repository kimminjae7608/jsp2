package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.SessionDto;
import mybatis.SqlSessionBean;

public class CustomerDao {

	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static CustomerDao dao = new CustomerDao();
	private CustomerDao() {}
	public static CustomerDao getInstance() {
		return dao;
	}
	
	
	public SessionDto login(Map<String,String> map) {
		SessionDto dto =null;
		SqlSession mapper = factory.openSession();
		dto = mapper.selectOne("loginCheck",map);
		return dto;
	}


}
