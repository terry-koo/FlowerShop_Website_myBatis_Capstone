package project.util;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import mybatis.model.ArticlePost;
import mybatis.repository.session.AzureMySQLDB;

public class ArticleManager {
	private static ArrayList<ArticlePost> articlePostList;
	
	
	static {
		reNewArticlePostList();
		
	}
	
	private static void reNewArticlePostList() {
		String articlePostListUri = "mybatis.repository.mapper.articleMapper.selectArticlePostList";
		SqlSession sqlSession = AzureMySQLDB.openSession();
		try {
			List<Object> temp = sqlSession.selectList(articlePostListUri);
			articlePostList = (ArrayList<ArticlePost>) temp.stream().map(obj -> (ArticlePost)obj).collect(Collectors.toList());
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static ArticlePost getArticleByIndex(int i) {
		return articlePostList.get(i);
	}

}
