package mybatis.repository.session;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	
}
