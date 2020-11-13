import java.util.List;
import mybatis.model.VProductArticlePictureLatest;
import project.util.VProductManager;


public class Test {
	public static void main(String[] args) {

		List<VProductArticlePictureLatest> list =  VProductManager.getList();
		System.out.println(list.get(0).getArticle_id());
		
	}
}
