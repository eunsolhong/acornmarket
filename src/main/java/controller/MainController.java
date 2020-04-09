package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.User;
import model.WebNote;
import repository.MybatisUserDao;

@Controller
@RequestMapping("/main/")
public class MainController {
	
	@Autowired
	MybatisUserDao userService;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("------------------");
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(){
		
		return "main/main";
	}
	
//	userscore top6 추출
	@RequestMapping(value = "chart1", method = RequestMethod.GET)
	@ResponseBody
	public List<User> chart1() {
		int count = 6;
		List<User> userList = userService.getUserList(count);
		
		return userList;
	}
	
//	거래장소 top6 추출 - 다음주에 합치면 작업하자.
	@RequestMapping(value = "chart2")
	@ResponseBody
	public WebNote chart2(){
		
		return new WebNote();
	}
	
}
