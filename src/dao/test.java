package dao;

import java.sql.*;

public class test {
    public static void main(String[] args) {
        Connection conn;
        Statement stmt;
        ResultSet rs;
        String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";
        String sql = "select * from TBook";
        try {
            // �������ݿ�
            conn = DriverManager.getConnection(url, "admin", "123123");
            // ����Statement����
            stmt = conn.createStatement();
            /**
             * Statement createStatement() ����һ�� Statement �������� SQL ��䷢�͵����ݿ⡣
             */
            // ִ�����ݿ��ѯ���
            rs = stmt.executeQuery(sql);
            /**
             * ResultSet executeQuery(String sql) throws SQLException ִ�и����� SQL
             * ��䣬����䷵�ص��� ResultSet ����
             */
            while (rs.next()) {
                
                String name = rs.getString("����");
                
                System.out.println(name);
            }
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (stmt != null) {
                stmt.close();
                stmt = null;
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("���ݿ�����ʧ��");
        }
    }
}