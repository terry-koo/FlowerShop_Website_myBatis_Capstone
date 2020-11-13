package project.util;

import java.util.ArrayList;
import java.util.List;

import mybatis.repository.session.SessionRepository;

public class VProductManager {
	private static ArrayList<VProduct> productArray = null;
	private static SessionRepository sessionRepository = new SessionRepository(); 
	private static List<Object> selectListProduct = sessionRepository.selectVProductArticlePictureLatest();
	private static int size = selectListProduct.size();
	
	private VProductManager() {};
	
	public static ArrayList<VProduct> getInstance() {
		
		if(productArray == null) {
			productArray = new ArrayList<>();
			for(int i=0; i<size; i++) {
				productArray.add(new VProduct(i));
			}			
		}
		return productArray;
	}

}
