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

public class Write {
	private static Write vision = new Write();

	public static Write getWrite() {
		return vision;
	}
	private String returns = "";
	public String write(String content) {
	    try {
		Water water = new Water();
		water.setCONTENT(content);
		SessionRepository a = new SessionRepository();
		a.insertWater(water);
		
		returns = "insert success";

	} catch (Exception e) {
		e.printStackTrace();
	} 
	return returns;
       }

}