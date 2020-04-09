package controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.CScenterDataBean;
import repository.CScenterDao;

@Controller
@RequestMapping("/CScenter/")
public class CScenterController {

	String ip;

	@Autowired
	CScenterDao service;

	@ModelAttribute
	public void initProcess(HttpServletRequest request) {

		ip = request.getRemoteAddr();
	}

	@RequestMapping(value = "CScenter", method = RequestMethod.GET)
	public String CScenter(Model model) throws Exception {

		List li1 = service.getArticles1();
		List li2 = service.getArticles2();

		model.addAttribute("li1", li1);
		model.addAttribute("li2", li2);

		return "CScenter/CScenter";
	}

	@RequestMapping(value = "CScenter_writeForm", method = RequestMethod.GET)
	public String CScenter_writeForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,@RequestParam("type") String type, Model model) {

		model.addAttribute("type", type);
		model.addAttribute("page", page);

		return "CScenter/CScenter_writeForm";
	}
	
	@RequestMapping(value = "CScenter_preContent", method = RequestMethod.POST)
	public String CScenter_preContent(@RequestParam(value = "page", required = false, defaultValue = "1") int page,@RequestParam String type,CScenterDataBean article,Model model) throws Exception {

		System.out.println(article);
		model.addAttribute("article", article);
		model.addAttribute("type", type);
		model.addAttribute("page", page);
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd hh:mm:ss");
		String regdate = format.format(new Date());
		
		model.addAttribute("regdate",regdate);
		return "CScenter/CScenterNotice_preContent";
		
	}

	@RequestMapping(value = "CScenter_write", method = RequestMethod.POST)
	public String CScenter_writePro(CScenterDataBean article,@RequestParam(value="type", required = false, defaultValue="n") String type) throws Exception {

		System.out.println(article);
		article.setIp(ip);
		service.insertArticle(article);
		if(type.equals("n")) {
		return "redirect:/CScenter/CScenterNotice";
		}
		return "redirect:/CScenter/CScenterFAQ";
	}

	@RequestMapping(value = "CScenterNotice_contentForm", method = RequestMethod.GET)
	public String CScenterNotice_contentForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,@RequestParam int num, @RequestParam String type, Model model)
			throws Exception {

		CScenterDataBean article = service.getArticle(num);
		model.addAttribute("article", article);
		model.addAttribute("type", type);
		model.addAttribute("page", page);

		return "CScenter/CScenterNotice_contentForm";
	}

	@RequestMapping(value = "CScenterNotice", method = RequestMethod.GET)
	public String CScenterNotice(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) throws Exception {

		int perPageNum = 10; //데이터의 갯수
		int getPageStart = (page - 1) * perPageNum+1; //시작데이터
		int getPageEnd = perPageNum*page;
		int displayPageCnt = 10; // 화면에 보여질 페이지 번호 수
		int totalDataCount = service.getArticleCount();; // 실제 게시물 수
		int endPage = (int)(Math.ceil(page/(double)displayPageCnt)*displayPageCnt); // 현재 페이지 기준 끝 페이지 번호 ex)13/10=1.3 올림 -> 2*10=20
		int startPage = (endPage-displayPageCnt) + 1; // 현재 페이지 기준 시작 페이지 번호 ex)13 -> 20-10+1=11
		int tempEndPage = (int)(Math.ceil(totalDataCount / (double) perPageNum)); //전체 게시물 수가 88개이면 88/10=8.8 올림-> 9
		//만약 계산된 끝 페이지 번호보다 실제 사용되는 페이지 수가 더 작으면 실제 사용될 페이지 번호만 보여줌
				if(endPage > tempEndPage) {
					endPage = tempEndPage;
				}
		int number = totalDataCount - (page - 1) * perPageNum;	
		List li = service.getNotice(getPageStart, getPageEnd);
		model.addAttribute("li", li);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("tempEndPage",tempEndPage);
		model.addAttribute("page",page);
		model.addAttribute("number",number);
		return "CScenter/CScenterNotice";
	}

	@RequestMapping(value = "CScenter_modifyForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String CScenter_modifyForm(@RequestParam String type, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(value = "num", required = false, defaultValue = "1") int num, 
			CScenterDataBean article,
			Model model) throws Exception {

		System.out.println(type);
		if(type.equals("read")) {
		article = service.getArticle(num);
		} 
		model.addAttribute("article", article);
		model.addAttribute("page", page);
		
		return "CScenter/CScenter_modifyForm";
	}

	@RequestMapping(value = "CScenter_modify", method = RequestMethod.POST)
	public String CScenter_modifyPro(CScenterDataBean article, @RequestParam(value = "num", required = false, defaultValue = "1") int num, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) throws Exception {

		article.setIp(ip);
		article.setNum(num);
		service.modifyArticle(article);
		//int articleNum = service.getNum();
		return "redirect:/CScenter/CScenterNotice_contentForm?num=" + num + "&type=w&page="+page;
	}

	@RequestMapping(value = "CScenter_deleteForm", method = RequestMethod.GET)
	public String CScenter_deleteForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,@RequestParam int num, Model model) {

		model.addAttribute("num", num);
		model.addAttribute("page", page);
		return "CScenter/CScenter_deleteForm";
	}

	@RequestMapping(value = "CScenter_delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String CScenter_delete(@RequestParam(value = "page", required = false, defaultValue = "1") int page,@RequestParam int num, String passwd, Model model) throws Exception {

		int check = service.deleteArticle(num, passwd);
		model.addAttribute("check", check);
		model.addAttribute("page", page);
		return "CScenter/CScenter_deletePro";
	}

	@RequestMapping(value = "CScenterFAQ", method = { RequestMethod.GET, RequestMethod.POST })
	public String CScenterFAQ(@RequestParam(value = "category", required = false) String category, Model model)
			throws Exception {

		List li = service.getArticles2();
		List li1 = service.getArticle1();
		List li2 = service.getArticle2();
		model.addAttribute("li", li);
		model.addAttribute("li1", li1);
		model.addAttribute("li2", li2);
		model.addAttribute("category", category);

		return "CScenter/CScenterFAQ";
	}

	@RequestMapping(value = "CScenterQ&A", method = RequestMethod.GET)
	public String CScenterQ(Model model) throws Exception {

		List li = service.getArticles2();
		model.addAttribute("li", li);
		return "CScenter/CScenterQ&A";
	}

	@RequestMapping(value = "CScenterFAQsearch", method = RequestMethod.GET)
	public String list5(HttpServletRequest request, HttpServletResponse response) {
		return "CScenterFAQsearch";
	}

}