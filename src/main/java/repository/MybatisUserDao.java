package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.User;
import mybatis.AbstractRepository;

public class MybatisUserDao extends AbstractRepository {

	private final String namespace = "mybatis.UserMapper";

	// 회원가입
	public void joinUser(User user) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".joinUser";
			sqlSession.insert(statement, user);
			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	// 이메일 체크
	public int getUserEmailChecked(String userId) {
		int checked = 0;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getUserEmailChecked";
			checked = sqlSession.selectOne(statement, userId);
			if (checked == 1) {
				checked = 1;
			} else {
				checked = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return checked;
	}

	// 회원 이메일 조회
	public String getUserEmail(String userId) {
		String userEmail = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;

		try {
			statement = namespace + ".getUserEmail";
			System.out.println(userId + "getUserEmail");
			userEmail = sqlSession.selectOne(statement, userId);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return userEmail;
	}

	// 이메일 인증 확인
	public void setUserEmailChecked(String userId) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".setUserEmailChecked";
			sqlSession.update(statement, userId);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	// ID중복 조회
	public int getUserIdCheck(String userId) {
		int checked = 0;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		String userIdCheck = "";
		// System.out.println(userId);
		try {
			statement = namespace + ".getUserIdCheck";
			userIdCheck = sqlSession.selectOne(statement, userId);

			if (userIdCheck == null) {
				userIdCheck = "";
			}

			System.out.println(userIdCheck);
			System.out.println(userId);

			if (!userIdCheck.equals(userId)) {
				checked = 0;
			} else {
				checked = 1;
			}
			System.out.println(checked);

			return checked;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return checked;
	}

	// 로그인
	public String Login(User user) {
		String userId = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;

		try {
			statement = namespace + ".Login";
			userId = sqlSession.selectOne(statement, user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return userId;
	}

	// 나의 온도 조회
	public int getUserScore(String userId) {

		int userScore = 0;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getUserScore";
			userScore = sqlSession.selectOne(statement, userId);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return userScore;
	}

	//회원 정보 조회
	public User getUserInfo(String userId) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		User user = null;
		try {
			statement = namespace + ".getUserInfo";
			user = sqlSession.selectOne(statement, userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return user;
	}
	
//	아이디 존재 여부 확인
	public String checkUserId(String userName) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".checkUserId";
			return sqlSession.selectOne(statement, userName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	

	// 회원 삭제
	public void deleteUser(String userId) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".deleteUser";
			sqlSession.delete(statement, userId);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public String getUserPasswd(String userId) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		String userpasswdCK = null;
		try {
			statement = namespace + ".getUserPasswd";
			userpasswdCK = sqlSession.selectOne(statement, userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return userpasswdCK;
	}

	// user 정보 수정
	public int setUserUpdate(User user) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int checked = 0;

		try {

			sqlSession.update(namespace + ".setUserUpdate", user);
			sqlSession.commit();
			checked = 1;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return checked;
	}

	//user본인 주소 조회
	public String getUserAddress(String userid) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		String useraddress = null;

		try {
			statement = namespace + ".getUserAddress";
			useraddress = sqlSession.selectOne(statement, userid);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return useraddress;
	}
	
	//user 주변 거래 주소 검색
	public List<String> getAddress(String useraddress){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getAddress";
			return sqlSession.selectList(statement, useraddress);
		}finally {
			sqlSession.close();
		}		
	}
	
//	상위 x명 유저 가져오기
	public List<User> getUserList(int count) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String statement = null;
		try {
			statement = namespace + ".getUserList";
			return sqlSession.selectList(statement, count);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
}
