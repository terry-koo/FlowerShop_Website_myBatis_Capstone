package project.util;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import mybatis.model.ArticlePost;
import mybatis.model.Review;
import mybatis.repository.session.AzureMySQLDB;

public class ArticlePostManager {
	private static ArrayList<ArticlePost> articlePostList = null;

	static {
		reNewArticlePostList();
		System.out.println("ArticlePostManager loaded");
	}

	private static void reNewArticlePostList() {
		String articlePostListUri = "mybatis.repository.mapper.articleMapper.selectArticlePostList";
		SqlSession sqlSession = AzureMySQLDB.openSession();
		try {
			List<Object> temp = sqlSession.selectList(articlePostListUri);
			articlePostList = (ArrayList<ArticlePost>) temp.stream().map(obj -> (ArticlePost) obj)
					.collect(Collectors.toList());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			sqlSession.close();
		}
	}

	public static ArrayList<ArticlePost> getArticlePostList() {
		return articlePostList;
	}

	public static ArticlePost getArticlePostByIndex(int i) {
		return articlePostList.get(i);
	}

	public static ArticlePost getArticlePostByIndex(String i) {
		return articlePostList.get(Integer.valueOf(i));
	}

	public static ArticlePost getArticlePostByArticle_id(String article_id) {
		ArticlePost article = null;
		for (ArticlePost articleElement : articlePostList) {
			if (articleElement.getArticle_id().equals(article_id)) {
				article = articleElement;
				break;
			}
		}
		return article;
	}

	public static int insertArticleDB(HashMap<String, String> articleParam, HashMap<String, String> pictureParam,
			HashMap<String, String> tagParam, String[] tags) {
		int result = -1;

		String articleMapperUri = "mybatis.repository.mapper.articleMapper.insertArticle";
		String pictureMapperUri = "mybatis.repository.mapper.pictureMapper.insertPicture";
		String tagMapperUri = "mybatis.repository.mapper.tagMapper.insertTag";

		SqlSession sqlSession = AzureMySQLDB.openSession();
		try {
			int articleState = sqlSession.insert(articleMapperUri, articleParam);
			int pictureState = sqlSession.insert(pictureMapperUri, pictureParam);
			int tagState = 0;
			for (int i = 0; i < tags.length; i++) {
				tagParam.put("tag_name", tags[i]);
				tagState += sqlSession.insert(tagMapperUri, tagParam);
			}

			if (articleState > 0 && pictureState > 0 && tagState == tags.length) {
				sqlSession.commit();
				result = 1;
				insertArticleListByArticleID(articleParam.get("article_id"));
				return result;
			}

		} catch (Exception e) {
			sqlSession.rollback();
			return result;
		} finally {
			sqlSession.close();
		}
		result = 0;
		return result;

	}

	private static void insertArticleListByArticleID(String article_id) {
		ArticlePost article = null;
		String articleMapperUri = "mybatis.repository.mapper.articleMapper.selectArticlePostOne";
		SqlSession sqlSession = AzureMySQLDB.openSession();
		try {
			article = sqlSession.selectOne(articleMapperUri, article_id);
		} catch (Exception e) {

		} finally {
			sqlSession.close();
		}
		articlePostList.add(article);
	}
	
	
	public static void updateArticleReview(String article_id){

		String reviewUri = "mybatis.repository.mapper.reviewMapper.selectReviewList";
		SqlSession sqlSession = AzureMySQLDB.openSession();
		try {
			List<Review> tempReviewList = sqlSession.selectList(reviewUri, article_id);
			 getArticlePostByArticle_id(article_id).setReviews(tempReviewList.toArray(new Review[tempReviewList.size()]));
			 
		}
		catch(Exception e){
		}
		finally{
			sqlSession.close();
		}
	}

	private ArticlePostManager() {
	};
	
	

}
