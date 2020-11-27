package android;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import mybatis.model.Water;
import mybatis.repository.session.SessionRepository;

public class Vision_Write {
	private static Vision_Write vision = new Vision_Write();

	public static Vision_Write getWrite() {
		return vision;
	}
	private String returns = "";
	public String write(String content) {
	    try {
		Water water = new Water();
		water.setCONTENT(content);
		SessionRepository a = new SessionRepository();
		a.insertWater(water);
		
		returns = "success";

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	    System.out.println("Vision_Write finally실행");
	}
	return returns;
       }

}