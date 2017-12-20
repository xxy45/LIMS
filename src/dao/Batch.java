package dao;

import java.sql.*;

public class Batch {

    /** 判断数据库是否支持批处理 */

    public static boolean supportBatch(Connection con) {

        try {

            // 得到数据库的元数据

            DatabaseMetaData md = con.getMetaData();

            return md.supportsBatchUpdates();

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return false;

    }

    /** 执行一批SQL语句 */

    public static int[] goBatch(Connection con, String[] sqls) throws Exception {

        if (sqls == null) {

            return null;

        }

        Statement sm = null;

        try {

            sm = con.createStatement();

            for (int i = 0; i < sqls.length; i++) {

                sm.addBatch(sqls[i]);// 将所有的SQL语句添加到Statement中

            }

            // 一次执行多条SQL语句

            return sm.executeBatch();

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            sm.close();

        }

        return null;

    }
    
    
}