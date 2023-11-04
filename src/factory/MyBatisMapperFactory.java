package factory;

import config.MyBatisConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MyBatisMapperFactory {

    private static SqlSessionFactory sqlSessionFactory;

    static {
        sqlSessionFactory = MyBatisConfig.getSqlSessionFactory();
    }

    public static SqlSession getSqlSession() {
        return sqlSessionFactory.openSession();
    }
}
