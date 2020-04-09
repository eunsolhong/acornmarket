package controller;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.User;
import repository.MybatisUserDao;
import util.Gmail;
import util.KakaoAPI;
import util.NaverAPI;
import util.SHA256;

@Controller
@RequestMapping("/user/")
public class UserController {

	HttpSession session;
	String userId;
	int emailCheck = 0;

	@Autowired
	MybatisUserDao service;

	@ModelAttribute // 메소드를 실행할 때 마다 매번 실행된다.
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("------------------");

		HttpSession session = request.getSession();
		userId = (String) session.getAttribute("userId");
		System.out.println("User----------" + userId);

	}

	@RequestMapping(value = "selectJoinForm", method = RequestMethod.GET)
	public String selectJoinForm(HttpServletRequest request) throws Exception {
		String naverApiUrl = NaverAPI.getApiUrl();
		String kakaoApiUrl = KakaoAPI.getApiUrl();
		request.setAttribute("naverApiUrl", naverApiUrl);
		request.setAttribute("kakaoApiUrl", kakaoApiUrl);

		return "user/selectJoinForm";
	}

	@RequestMapping(value = "kakaoLoginForm", method = RequestMethod.GET)
	public String kakaoLoginForm(HttpServletRequest request) throws Exception {
		String code = request.getParameter("code");
		String error = request.getParameter("error");
		request.setAttribute("error", error);
		if (code != null) {
			KakaoAPI kakao = new KakaoAPI();
			String access_Token = kakao.getAccessToken(code);

			if(access_Token.equals("error")){
				System.out.println("- 카카오 토큰 받기 에러 -");
				
				return "redirect:/main/main";
			}
			HashMap<String, String> userInfo = kakao.getUserInfo(access_Token);
			System.out.println(userInfo);
			System.out.println("userId: " + userInfo.get("userId"));
			System.out.println("userName: " + userInfo.get("userName"));
			// 토큰 삭제
			int result = kakao.kakaoLogout(access_Token);
			if(result == 200){
				System.out.println("-카카오 연결 끊기 성공-");
			}else{
				System.out.println("-카카오 연결 끊기 실패-");
			}
			// 여기서 디비를 통해 ID체크
			int check = service.getUserIdCheck(userInfo.get("userId"));
			// 기존 아이디가 존재하지않는다면
			if (check == 0) {
				request.setAttribute("userId", userInfo.get("userId"));
				request.setAttribute("userName", userInfo.get("userName"));
				
				return "user/apiLoginForm";
			} else {
				return "user/overlapJoinForm";
			}	
		}else{
			System.out.println("- 토큰 오류가 발생했습니다 -");
			
			return "redirect:/main/main";
		}
	}

	@RequestMapping(value = "naverLoginForm", method = RequestMethod.GET)
	public String naverLoginForm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		NaverAPI naverAPI = new NaverAPI();
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String error = request.getParameter("error");
		String error_description = request.getParameter("error_description");
		String access_token;
		HashMap<String, String> userInfo;
//		네이버 로그인 정보와 정보제공 동의 과정 완료 및 실패
		if (code != null && state != null) {
			try{
				access_token = naverAPI.getAccessToken(code, state);
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("-토큰 절차 에러-");
				
				return "redirect:/main/main";
			}
			try{
				userInfo = naverAPI.getUserInfo(access_token);
				// 토큰 삭제
				String result = naverAPI.deleteAccessToken(access_token);
				if (result.equals("success")) {
					System.out.println("- 네이버 토큰 삭제 성공 -");
				} else {
					System.out.println("- 네이버 토큰 삭제 실패 -");
				}
				// 여기서 디비를 통해 ID체크
				int check = service.getUserIdCheck(userInfo.get("userId"));
				// 기존 아이디가 존재하지않는다면
				if (check == 0) {
					request.setAttribute("userId", userInfo.get("userId"));
					request.setAttribute("userName", userInfo.get("userName"));
					
					return "user/apiLoginForm";
				} else {
					return "user/overlapJoinForm";
				}			
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("-정보 제공 동의 에러-");
				
				String reAtr = naverAPI.reAuthorize(state);
				if(session.getAttribute(access_token) == null){
					session.setAttribute(access_token, 1);
					System.out.println("session값 체크: " + session.getAttribute(access_token));
					
					return "redirect:" + reAtr;
				}else{
					if(session.getAttribute(access_token).toString().equals("3") ){
						System.out.println("session값 체크: " + session.getAttribute(access_token));
						session.removeAttribute(access_token);
						
						return "user/naverLoginForm";
					}else{
						int count = ((int) session.getAttribute(access_token)) + 1;
						session.setAttribute(access_token, count);
						System.out.println("session값 체크: " + session.getAttribute(access_token));
						
						return "redirect:" + reAtr;
					}
				}
			}

		} else {
			System.out.println("네이버 아이디 로그인 인증 실패");
			System.out.println("에러코드: " + error);
			System.out.println("에러메시지: " + error_description);

			return "redirect:/main/main";
		}
	}

	// 로그인 폼
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request) throws Exception {
		System.out.println("userID : " + userId);

		return "user/loginForm";
	}

	// 로그인 처리
	@RequestMapping(value = "loginPro", method = RequestMethod.POST)
	public String loginPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		User user = new User();
		session = request.getSession();
		userId = request.getParameter("userId");

		String userPasswd = request.getParameter("userPasswd");

		user.setUserid(userId);
		user.setUserpasswd(userPasswd);

		userId = service.Login(user);
		emailCheck = service.getUserEmailChecked(userId);

		session.setAttribute("emailCheck", emailCheck);

		PrintWriter script = response.getWriter();

		if (userId == null) {
			script.println("<script>");
			script.println("alert('로그인에 실패하셨습니다. \\n다시 로그인해주세요.');");
			script.println("location.href = '/zSpringProject/user/loginForm'");
			script.println("</script>");
			script.close();
		} else if (userId != null) {
			if (emailCheck == 1) {
				user = service.getUserInfo(userId);
				session.setAttribute("userId", user.getUserid());
				session.setAttribute("userName", user.getUsername());
				script.println("<script>");
				script.println("location.href = '/zSpringProject/main/main'");
				script.println("</script>");
				script.close();
			} else if (emailCheck != 1) {
				session.setAttribute("userId", userId);
				script.println("<script>");
				script.println("alert('이메일 인증을 완료하지 않았습니다.\\n인증 완료 후 다시 로그인해주세요.');");
				System.out.println(userId);
				script.println("location.href = '/zSpringProject/user/loginForm'");
				script.println("</script>");
				script.close();
			}
		}
		return "";
	}

	@RequestMapping(value = "logoutForm", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "user/loginForm";
	}

	// 회원가입 폼
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm(HttpServletRequest request) throws Exception {
		return "user/joinForm";
	}

	// 회원가입 처리 (이메일 인증)
	@RequestMapping(value = "joinPro", method = RequestMethod.POST)
	public String joinPro(@ModelAttribute("user") User user, String phone1, String phone2, String phone3,
			String userAddress, String detailAddress, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		String userEmailHash = SHA256.getSHA256(user.getUseremail());
		int userEmailCheck = 0;

		user.setUseremailhash(userEmailHash);
		user.setUseremailcheck(userEmailCheck);
		user.setUserphone(phone1 + phone2 + phone3);
		user.setUseraddress(userAddress + " " + detailAddress);

		System.out.println(userEmailHash);
		System.out.println("-------------------------------");
		System.out.println(user);
		
		service.joinUser(user);
		session.setAttribute("userId", user.getUserid());

		return "redirect:/user/joinSendEmail";
	}

	// 인증메일 보내기
	@RequestMapping(value = "joinSendEmail", method = RequestMethod.GET)
	public String joinSendEmail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		String userId = null;

		// 세션에 저장된 id가 null이 아니라면 값 저장
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}

		if (userId == null) {
			// userId가 없다면 로그인폼으로 이동
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = '/zSpringProject/user/loginForm'");
			script.println("</script>");
			script.close();

			return "redirect:/user/loginForm";
		}

		int emailChecked = service.getUserEmailChecked(userId);

		if (emailChecked == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 인증 된 회원입니다.');");
			script.println("location.href = '/zSpringProject/main/main'");
			script.println("</script>");
			script.close();

			return "redirect:/main/main";
		} else if (emailChecked == 0) {
			// 사용자에게 보낼 이메일 내용을 입력
			String host = "http://localhost:9080/zSpringProject/user/";
			String from = "oakNutSpring@gmail.com";
			String to = service.getUserEmail(userId);

			String subject = "도토리마켓 회원가입 이메일 인증메일입니다!";
			String content = "다음 링크에 접속하여 이메일 확인을 진행해주세요:D" +

					"<a href='" + host + "joinEmailCheckPro?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

			// SMTP에 접속하기 위한 정보를 입력하는 부분
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try {

				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html;charset=UTF-8");
				Transport.send(msg);
			} catch (Exception e) {

				e.printStackTrace();
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류가 발생했습니다..');");
				script.println("history.back();");
				script.println("</script>");
				script.close();

				return "redirect:/user/joinForm";
			}
			return "user/joinSendEmail";
		}
		return "user/joinSendEmail";
	}

	// 메일 인증 확인
	@RequestMapping(value = "joinEmailCheckPro", method = RequestMethod.GET)
	public String joinEmailCheckPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		session = request.getSession();
		String code = request.getParameter("code");

		String userId = null;
		System.out.println(code);

		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");

			String userEmail = service.getUserEmail(userId);

			// 인증코드와 디비에 저장된 코드 확인
			boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
			System.out.println(rightCode);

			if (rightCode == true) {
				System.out.println("joinEmailCheckPro안에 있는 userId의 값 : " + userId);
				service.setUserEmailChecked(userId);
				session.setAttribute("userId", userId);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('인증에 성공했습니다.');");
				script.println("location.href = '/zSpringProject/main/main'");
				script.println("</script>");
				script.close();
			} else if (rightCode == false) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 코드입니다.');");
				script.println("location.href = '/zSpringProject/main/main'");
				script.println("</script>");
				script.close();
			}
		} else if (session.getAttribute("userId") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = '/zSpringProject/user/loginForm'");
			script.println("</script>");
			script.close();
		}

		return "";
	}

	// ID 중복체크 창
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	public String idCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String userId = request.getParameter("userId");
		// System.out.println(userId);

		int userIdChecked = service.getUserIdCheck(userId);

		// el로 사용할 수 있게 보냄
		request.setAttribute("userIdChecked", userIdChecked);
		request.setAttribute("userId", userId);
		return "user/idCheck";
	}

	// 마이페이지
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(HttpServletRequest request) throws Exception {

		int userScore = service.getUserScore(userId);
		String useraddress = service.getUserAddress(userId);

		System.out.println(useraddress + "------------------------");
		
		List<String> userAddress = service.getAddress(useraddress);
		System.out.println("userAddress------------------------" + userAddress);

		request.setAttribute("addressList", userAddress);
		request.setAttribute("userScore", userScore);
		request.setAttribute("useraddress", useraddress);

		return "user/mypage/myPage";
	}

	// 회원 정보 수정 전 비밀번호 체크
	@RequestMapping(value = "userPasswdCheck", method = RequestMethod.GET)
	public String userPasswdCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "user/update/userPasswdCheck";
	}

	// 회원 정보 수정 전 비밀번호 체크
	@RequestMapping(value = "userPasswdCheckPro", method = RequestMethod.POST)
	public String userPasswdCheckPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String userpasswd = request.getParameter("userpasswd");
		String userpasswdCh = service.getUserPasswd(userId);

		if (userpasswd.equals(userpasswdCh)) {
			return "redirect:/user/userModifyForm";
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 맞지 않습니다.\\n다시 입력해주세요..');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}

		return "";
	}

	// 회원 정보 수정 페이지
	@RequestMapping(value = "userModifyForm")
	public String userModifyForm(Model model, User user) throws Exception {

		user = service.getUserInfo(userId);

		model.addAttribute("user", user);

		System.out.println(user);
		return "user/update/userModifyForm";
	}

	// 회원 정보 수정 처리

	@RequestMapping(value = "userModifyPro", method = RequestMethod.POST)
	public void userModifyPro(Model model, User user, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		System.out.println(user);
		int check = service.setUserUpdate(user);
		PrintWriter script = response.getWriter();

		if (check == 1) {
			script.println("<script>");
			script.println(" alert('수정이 완료되었습니다.');");
			script.println("location.href = '/zSpringProject/user/myPage'");
			script.println("</script>");
			script.close();
		}
	}

	// 구매 내역
	@RequestMapping(value = "saleList", method = RequestMethod.GET)
	public String saleList(HttpServletRequest request) throws Exception {

		return "user/saleList";
	}

	// 찜 목록
	@RequestMapping(value = "jjimList", method = RequestMethod.GET)
	public String jjimList(HttpServletRequest request) throws Exception {

		return "user/jjimList";
	}

	// 회원 탈퇴
	@RequestMapping(value = "userDelete", method = RequestMethod.GET)
	public String userDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println(" if (confirm('정말 탈퇴하시겠습니까?')) {");
		service.deleteUser(userId);
		session.invalidate();
		script.println(" alert('탈퇴가 완료되었습니다.\\n그동안 도토리마켓을 이용해주셔서 감사합니다.');");
		script.println("location.href = '/zSpringProject/main/main'");
		script.println("   } else {");
		script.println("alert('탈퇴를 취소합니다.');");
		script.println("location.href = '/zSpringProject/user/myPage'}");
		script.println("</script>");
		script.close();

		return "redirect:/main/main";
	}

	///////////////////////////////////////////////////////////////////////////////////////////

	// 회원가입 폼
	@RequestMapping(value = "joinFormTest", method = RequestMethod.GET)
	public String joinFormTest(HttpServletRequest request) throws Exception {
		return "user/join/joinForm";
	}

	// ID 중복체크 창 TEST
	@ResponseBody
	@RequestMapping(value = "idCheckTest", method = RequestMethod.GET)
	public String idCheckTest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(userId);

		int userIdChecked = service.getUserIdCheck(userId);

		// el로 사용할 수 있게 보냄
		request.setAttribute("userIdChecked", userIdChecked);
		request.setAttribute("userId", userId);
		return "user/idCheckTest";
	}

}