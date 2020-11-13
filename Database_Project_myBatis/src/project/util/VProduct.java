package project.util;

import java.util.ArrayList;
import java.util.List;

import mybatis.model.VProductArticlePictureLatest;
import mybatis.repository.session.SessionRepository;

public class VProduct {
	private static VProductArticlePictureLatest vProductArticlePictureLatest;
	private static ArrayList<VProduct> productArray = null;
	private static SessionRepository sessionRepository = new SessionRepository(); 
	private static List<Object> selectListProduct = sessionRepository.selectVProductArticlePictureLatest();

	public VProduct(int i) {
		vProductArticlePictureLatest = (VProductArticlePictureLatest) selectListProduct.get(i);		
	}
	
		
	
	
}
