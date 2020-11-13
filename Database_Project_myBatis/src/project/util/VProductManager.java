package project.util;
import java.util.ArrayList;
import java.util.List;
import mybatis.model.VProductArticlePictureLatest;
import mybatis.repository.session.SessionRepository;

public class VProductManager {
	private static ArrayList<VProductArticlePictureLatest> productArray = null;
	private static List<Object> selectListProduct = SessionRepository.selectVProductArticlePictureLatestStatic();
	private static int size = selectListProduct.size();
	
	private VProductManager() {};
	
	public static List<VProductArticlePictureLatest> getList(){
		
		if(productArray == null) {
			productArray = new ArrayList<>();
			for(int i=0; i<size; i++) {
				productArray.add((VProductArticlePictureLatest) selectListProduct.get(i));
			}			
		}
		return productArray;
	}

}
