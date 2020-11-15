package mybatis.model;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.repository.session.AzureMySQLDB;

public class ArticlePost {
	private String article_id;
	private String customer_id;
	private String title;
	private String content;
	private char is_linked_to_product;
	private char is_registered;
	private Date registration_date;
	private String picture;
	private Integer likeCount;
	
	private String[] tags;
	private Review[] reviews;
	
	
	
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
		String tagUri = "mybatis.repository.mapper.tagMapper.selectTagList";
		String reviewUri = "mybatis.repository.mapper.reviewMapper.selectReviewList";
		SqlSession sqlSession = AzureMySQLDB.openSession();
		try {
			List<String> tempTagList =  sqlSession.selectList(tagUri, article_id);
			List<Review> tempReviewList = sqlSession.selectList(reviewUri, article_id);
			
			tags =  tempTagList.toArray(new String[tempTagList.size()]);
			reviews = tempReviewList.toArray(new Review[tempReviewList.size()]);
		}
		catch(Exception e){
		}
		finally{
			sqlSession.close();
		}
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public char getIs_linked_to_product() {
		return is_linked_to_product;
	}
	public void setIs_linked_to_product(char is_linked_to_product) {
		this.is_linked_to_product = is_linked_to_product;
	}
	public char getIs_registered() {
		return is_registered;
	}
	public void setIs_registered(char is_registered) {
		this.is_registered = is_registered;
	}
	public Date getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(Date registration_date) {
		this.registration_date = registration_date;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}
	
	
	
	
	public String[] getTags() {
		return tags;
	}
	public void setTags(String[] tags) {
		this.tags = tags;
	}
	public Review[] getReviews() {
		return reviews;
	}
	public void setReviews(Review[] reviews) {
		this.reviews = reviews;
	}

	
}
