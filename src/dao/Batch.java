package dao;

import java.sql.*;

public class Batch {

    /** �ж����ݿ��Ƿ�֧�������� */

    public static boolean supportBatch(Connection con) {

        try {

            // �õ����ݿ��Ԫ����

            DatabaseMetaData md = con.getMetaData();

            return md.supportsBatchUpdates();

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return false;

    }

    /** ִ��һ��SQL��� */

    public static int[] goBatch(Connection con, String[] sqls) throws Exception {

        if (sqls == null) {

            return null;

        }

        Statement sm = null;

        try {

            sm = con.createStatement();

            for (int i = 0; i < sqls.length; i++) {

                sm.addBatch(sqls[i]);// �����е�SQL�����ӵ�Statement��

            }

            // һ��ִ�ж���SQL���

            return sm.executeBatch();

        } catch (SQLException e) {

            e.printStackTrace();

        } finally {

            sm.close();

        }

        return null;

    }
    
    
}