import java.util.List;
import mybatis.model.VProductArticlePictureLatest;
import project.util.VProductManager;


public class Test {
	public static void main(String[] args) {

		List<VProductArticlePictureLatest> list =  VProductManager.getList();
		int size = list.size();
		for (int i = 0; i < size; i++) {
			System.out.println(list.get(i).getPicture());
			System.out.println(i);
		}
		
	}
}
