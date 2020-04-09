package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Board;
import mybatis.AbstractRepository;

public class MybatisBoardDao extends AbstractRepository {
	private final String namespace = "mybatis.BoardMapper";

	public int getArticleCount(String category) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleCount";

			return sqlSession.selectOne(statement, category);
		} finally {
			sqlSession.close();
		}
	}

	public List<Board> getArticles(int startRow, int endRow, String category) {

		startRow = startRow - 1;
		endRow = endRow - startRow;

		Map map = new HashMap();
		map.put("category", category);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticles";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	
	public List<Board> getlistArticles() {
		
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getlistArticles";

			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}
	

	public void insertArticle(Board article) {
	
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		String statement = null;

		int number = article.getBoardnum();

		try {
			article.setBoardnum(number);
			sqlSession.insert(namespace + ".insert", article);
			
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public Board getArticle(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Board article = null;
		try {

			sqlSession.update(namespace + ".content_update", num);
			sqlSession.commit();

			article = sqlSession.selectOne(namespace + ".getArticle", num);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return article;
	}

	public Board getUpdateArticle(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Board article = null;
		try {
			article = sqlSession.selectOne(namespace + ".getArticle", num);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return article;
	}

	public void updateArticle(Board article) throws Exception {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			sqlSession.update(namespace + ".update", article);
			sqlSession.commit();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public int deleteArticle(int num, String passwd) throws Exception {
		String dbpasswd = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int x = -1;
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
	
	
	//좋아요
	
	
	
	
	
	
	
	
	
}// class end