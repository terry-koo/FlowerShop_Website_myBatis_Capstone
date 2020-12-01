package mybatis.repository.session;

import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import project.util.ArticlePostManager;

public class AzureMySQLDB {
	private static SqlSessionFactory AzureSessionFacotry;
	
	static {
		reNewSqlSessionFactory();
		System.out.println("AzureMySQLDB ready");
		new Thread(
				()->{
					//To load ArticlePostManager when server starts
					ArticlePostManager.getArticlePostList(); 
				}).start();
		
	}
	
	public static SqlSession openSession() {
		if(AzureSessionFacotry!=null) {
			SqlSession sqlSession = AzureSessionFacotry.openSession();
			return  sqlSession;
		}
		else {
			reNewSqlSessionFactory();
			return openSession();
		}
	}
	
	private static void reNewSqlSessionFactory() {
		String resource = "config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		}catch(Exception e) {
			throw new IllegalArgumentException(e);
		}
		
		AzureSessionFacotry = new SqlSessionFactoryBuilder().build(inputStream);
	}
	private AzureMySQLDB() {};
}
