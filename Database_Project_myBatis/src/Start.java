import mybatis.model.test;
import mybatis.repository.session.SessionRepository;

public class Start {
	public static void main(String[] args) {
		
		  long id = 1; 
		  SessionRepository a = new SessionRepository(); 
		  test t = a.selectIdNameByID(id);
		  System.out.println(t.getName());
		  System.out.println(t.getSex());
		

	}
}
