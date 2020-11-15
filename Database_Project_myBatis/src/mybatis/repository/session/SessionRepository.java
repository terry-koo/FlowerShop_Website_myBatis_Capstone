package mybatis.repository.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.model.Article;
import mybatis.model.CustomerInfo;
import mybatis.model.Order;
import mybatis.model.Picture;
import mybatis.model.Product;
import mybatis.model.test;



public class SessionRepository {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		reNewSqlSessionFactory();
	}
	
	public static SqlSession openSession() {
		if(sqlSessionFactory != null) {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			return sqlSession;
		}
		else {
			reNewSqlSessionFactory();
			return openSession();
		}
	}
	
	public static void reNewSqlSessionFactory() {
		String resource = "config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		}catch(Exception e) {
			throw new IllegalArgumentException(e);
		}
		
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	//싱글턴패턴 구현으로 인한 삭제예정
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

	
	public Integer insertProduct(Product product) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "mybatis.repository.mapper.insertProduct";
			int result = sqlSession.insert(statement,product);
			if(result>0) {
				sqlSession.commit();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	public Integer insertArticle(Article article) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "mybatis.repository.mapper.insertArticle";
			int result = sqlSession.insert(statement,article);
			if(result>0) {
				sqlSession.commit();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	public Integer insertPicture(Picture picture) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "mybatis.repository.mapper.insertPicture";
			int result = sqlSession.insert(statement,picture);
			if(result>0) {
				sqlSession.commit();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	
	public static List<Object> selectVProductArticlePictureLatestStatic() {
		SqlSession sqlSession = SessionRepository.openSession();
		try {
			String statement = "mybatis.repository.mapper.selectPAP";
			return (List<Object>)sqlSession.selectList(statement);
		}finally{
			sqlSession.close();
		}
	}
	
	
	public Integer insertOrder(Order order) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "mybatis.repository.mapper.insertOrder";
			int result = sqlSession.insert(statement,order);
			if(result>0) {
				sqlSession.commit();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
}
