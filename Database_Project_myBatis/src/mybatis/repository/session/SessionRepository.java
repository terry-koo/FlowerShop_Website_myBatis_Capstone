package mybatis.repository.session;

import java.io.InputStream;
import java.util.HashMap;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import mybatis.model.CustomerInfo;
import mybatis.model.test;



public class SessionRepository {
	
	private SqlSessionFactory getSqlSessionFactory() {
		String resource = "config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		}catch(Exception e) {
			throw new IllegalArgumentException(e);
		}
		
		return new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	
	public test selectIdNameByID(long id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "mybatis.repository.mapper.selectId";
			return (test)sqlSession.selectOne(statement,id);
		}finally{
			sqlSession.close();
		}
	}
	
	public CustomerInfo selectOneByHashMap(String uri, HashMap<String, String> parameter) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(uri, parameter);
		}finally{
			sqlSession.close();
		}
	}
}
