package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.CScenterDataBean;
import mybatis.AbstractRepository;

public class CScenterDao extends AbstractRepository {

	private final String namespace = "mybatis.CScenter";

	//공지사항조회
	public List<CScenterDataBean> getArticles1() throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticles1";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}

	//faq조회
	public List<CScenterDataBean> getArticles2() throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticles2";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}

	public int getArticleCount() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleCount";
			return sqlSession.selectOne(statement);
		} finally {
			sqlSession.close();
		}
	}

	public List<CScenterDataBean> getNotice(int getPageStart, int getPageEnd) throws Exception {

		Map map = new HashMap();
		map.put("getPageStart", getPageStart);
		map.put("getPageEnd", getPageEnd);
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getNotice";
			return sqlSession.selectList(statement,map);
		} finally {
			sqlSession.close();
		}
	}

	public void insertArticle(CScenterDataBean article) throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int num = 0;
		try {
			String statement = namespace + ".insert_max";
			num = sqlSession.selectOne(statement);
			article.setNum(num);
			sqlSession.insert(namespace + ".insert", article);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public int getNum() throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticleNum";
			return sqlSession.selectOne(statement);
		} finally {
			sqlSession.close();
		}
	}

	public CScenterDataBean getArticle(int num) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		CScenterDataBean article = null;
		try {
			String statement = namespace + ".getArticle";
			article = sqlSession.selectOne(statement, num);
			System.out.println(article);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return article;
	}

	public void modifyArticle(CScenterDataBean article) throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".update", article);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public int deleteArticle(int num, String passwd) throws Exception {
		String dbpasswd = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int x = 0;
		try {
			dbpasswd = sqlSession.selectOne(namespace + ".getPasswd", num);
			if (dbpasswd.equals(passwd)) {
				sqlSession.delete(namespace + ".delete", num);
				sqlSession.commit();
				x = 1;
			} else {
				x = 0;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return x;
	}

	public List<CScenterDataBean> getArticle1() throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticle1";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}

	public List<CScenterDataBean> getArticle2() throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticle2";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}
}
