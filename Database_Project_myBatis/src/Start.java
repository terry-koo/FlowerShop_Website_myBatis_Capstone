import mybatis.model.test;
import mybatis.repository.session.TestSessionRepository;

public class Start {
	public static void main(String[] args) {
		
		  long id = 1; 
		  TestSessionRepository a = new TestSessionRepository(); 
		  test t = a.selectIdNameByID(id);
		  System.out.println(t.getName());
		  System.out.println(t.getSex());
		 

	}
}
