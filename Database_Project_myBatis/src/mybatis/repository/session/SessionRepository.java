package mybatis.repository.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.model.Article;
import mybatis.model.Basket;
import mybatis.model.CustomerInfo;
import mybatis.model.Order;
import mybatis.model.Picture;
import mybatis.model.Product;



public class SessionRepository {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		reNewSqlSessionFactory();
		System.out.println("SessionRepository ready");
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
	
	

	public CustomerInfo selectOneByHashMap(String uri, HashMap<String, String> parameter) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(uri, parameter);
		}finally{
			sqlSession.close();
		}
	}
	
	
	public static Order selectOrder(String orderId) {
		SqlSession sqlSession = SessionRepository.openSession();
		try {
			String statement = "mybatis.repository.mapper.orderMapper2.selectOrder";
			return sqlSession.selectOne(statement,orderId);
		}finally{
			sqlSession.close();
		}
	}
	
	
	//장바구니에서 주문으로 변경
	public Integer updateOrder(Order order) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "mybatis.repository.mapper.orderMapper2.updateOrder";
			int result = sqlSession.update(statement,order);
			if(result>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	
	
	public Integer insertProduct(Product product) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "mybatis.repository.mapper.productMapper2.insertProduct";
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
			String statement = "mybatis.repository.mapper.articleMapper2.insertArticle";
			int result = sqlSession.insert(statement,article);
			if(result>0) {
				sqlSession.commit();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	public static List<Object> selectAllMember() {
		SqlSession sqlSession = SessionRepository.openSession();
		try {
			String statement = "mybatis.repository.mapper.memberMapper.selectAllMember";
			return (List<Object>)sqlSession.selectList(statement);
		}finally{
			sqlSession.close();
		}
	}
	
	
	public static List<Object> selectVProductArticlePictureLatestStatic() {
		SqlSession sqlSession = SessionRepository.openSession();
		try {
			String statement = "mybatis.repository.mapper.papMapper2.selectPAP";
			return (List<Object>)sqlSession.selectList(statement);
		}finally{
			sqlSession.close();
		}
	}
	
	public static List<Object> selectBasket(String id) {
		SqlSession sqlSession = SessionRepository.openSession();
		try {
			String statement = "mybatis.repository.mapper.basket.selectBasket";
			return (List<Object>)sqlSession.selectList(statement,id);
		}finally{
			sqlSession.close();
		}
	}
	
	public static Basket selectBasketWithOrderId(String orderId) {
		SqlSession sqlSession = SessionRepository.openSession();
		try {
			String statement = "mybatis.repository.mapper.basket.selectBasketWithOrderId";
			return sqlSession.selectOne(statement,orderId);
		}finally{
			sqlSession.close();
		}
	}
	
	
	public Integer insertOrder(Order order) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = "mybatis.repository.mapper.orderMapper2.insertOrder";
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
