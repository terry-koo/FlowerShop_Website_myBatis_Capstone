
import java.util.List;
import mybatis.model.VProductArticlePictureLatest;
import mybatis.repository.session.SessionRepository;

public class Test {
	public static void main(String[] args) {

		  
		  SessionRepository a = new SessionRepository(); 
		  List<Object> t = a.selectVProductArticlePictureLatest();
		  

		  int size = t.size();
		  for(int i=0; i<size; i++) {
		  System.out.println(i+1 +" :: " +  ((VProductArticlePictureLatest) t.get(i)).getArticle_id());
		  }
	}
}
