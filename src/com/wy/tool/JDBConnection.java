package com.wy.tool;

import java.sql.*;

public class JDBConnection {
	private String dbDriver = "com.microsoft.jdbc.sqlserver.SQLServerDriver"; // ���ݿ������

	private String url = "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_shopping"; // URL��ַ

	public Connection connection = null;

	public JDBConnection() {
		try {
			Class.forName(dbDriver).newInstance(); // �������ݿ�����
			
			connection = DriverManager.getConnection(url, "sa", "123456"); // �������ݿ�
			
		} catch (Exception ex) {
			System.out.println("���ݿ����ʧ��");
		}
	}
}
