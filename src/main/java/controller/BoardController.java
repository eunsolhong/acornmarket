package controller;

import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
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
import org.springframework.web.multipart.MultipartRequest;

import model.Board;
import model.Reply;
import repository.MybatisBoardDao;
import repository.MybatisReplyDao;

@Controller
@RequestMapping("/board/")
public class BoardController {

	String boardid;
	String pageNum;

	@Autowired
	MybatisBoardDao dbPro;

	@Autowired
	MybatisReplyDao replyPro;

	@ModelAttribute
	public void initProcess(HttpServletRequest request) {

		HttpSession session = request.getSession();

		if (request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", 1);
			boardid = (String) session.getAttribute("boardid");
		}

		if (boardid == null) {
			boardid = "1";
			session.setAttribute("boardid", "1");
		}
	}

	@RequestMapping(value = "list")
	public String board_list(HttpServletRequest request, Model m) {

		List li = dbPro.getlistArticles();
		m.addAttribute("li", li);

		return "board/list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String board_writeForm(@ModelAttribute("article") Board article) {
		article.setReadcount(0);
		return "board/writeForm";
	}

	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String board_writePro(HttpServletRequest multipart, Board article, Model m, String address1, String address2)
			throws Exception {

		article.setAddress(address1 + " " + address2);

		article.setFilename("null");
		m.addAttribute("category", article.getCategory());

		MultipartFile multi = ((MultipartRequest) multipart).getFile("uploadfile");

		String filename = multi.getOriginalFilename();
		if (filename != null && !filename.equals("")) {
			String uploadPath = multipart.getRealPath("/") + "/uploadFile";

			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));

			article.setFilename(filename);
		} else {
			article.setFilename("");
		}

		dbPro.insertArticle(article);

		return "board/writePro";
	}

	@RequestMapping(value = "categoryForm")
	public String board_categoryForm(HttpServletRequest request, @RequestParam("category") String category, Model m) {

		HttpSession session = request.getSession();

		int pageSize = 5;
		int num = 9;
		int currentPage = 1;

		if (session.getAttribute("pageNum") == null) {
			session.setAttribute("pageNum", 1);
			System.out.println("2 " + currentPage);
		}

		try {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);

			System.out.println("1 " + currentPage);

		} catch (Exception e) {

		}

		currentPage = (Integer) session.getAttribute("pageNum");
		int count = dbPro.getArticleCount(category);

		System.out.println(count);

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		if (currentPage > pageCount) {
			currentPage = pageCount;
			session.setAttribute("pageNum", currentPage);
		}

		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		// int endRow = currentPage * pageSize;

		List li = dbPro.getArticles(startRow, endRow, category);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;

		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow); // 몇개를 보여줄건지
		m.addAttribute("endRow", endRow);
		m.addAttribute("count", count);
		m.addAttribute("pageSize", pageSize); // 페이징작업
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine); // [1][2][3]
		m.addAttribute("startPage", startPage);//
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);

		m.addAttribute("li", li);

		return "board/categoryForm";
	}

	@RequestMapping(value = "content")
	public String content(int num, Model m) throws Exception {

		Board article = dbPro.getArticle(num);

		m.addAttribute("article", article);

		return "board/content";
	}

	@RequestMapping(value = "updateForm")
	public String board_updateForm(int num, Model m) {

		Board article = dbPro.getUpdateArticle(num);
		m.addAttribute("article", article);

		return "board/updateForm";
	}

	@RequestMapping(value = "updatePro", method = RequestMethod.POST)
	public String board_updatePro(HttpServletRequest request, Board article, Model m) throws Exception {

		int boardnum = Integer.parseInt(request.getParameter("boardnum"));

		dbPro.updateArticle(article);

		request.setAttribute("boardnum", boardnum);

		return "board/updatePro";
	}

	@RequestMapping(value = "delete")
	public String board_deleteForm(int num, Model m) {

		m.addAttribute("num", num);
		return "board/deleteForm";
	}

	@RequestMapping(value = "deletePro", method = RequestMethod.POST)
	public String board_deletePro(int num, String passwd, Model m) throws Exception {

		int check = dbPro.deleteArticle(num, passwd);
		m.addAttribute("check", check);
		return "board/deletePro";
	}

	@RequestMapping(value = "replyList", method = RequestMethod.GET)
	public String reply_List(Model m, int boardnum) throws Exception {

	List list = replyPro.readReply(boardnum);
	
	m.addAttribute("list", list);
	m.addAttribute("boardnum", boardnum);

		return "board/updatePro";
	}

	@RequestMapping(value = "replyinsert", method = RequestMethod.POST)
	public String reply_insert(HttpServletRequest request, Reply reply) throws Exception {
		
		System.out.println(reply);
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));

		replyPro.insertreply(reply);
		
		
		
		request.setAttribute("boardnum", boardnum);
		
		return "reply/replyList";
	}

	@RequestMapping(value = "replyupdate", method = RequestMethod.POST)
	public String reply_update() {

		return "";
	}

	@RequestMapping(value = "replydelete", method = RequestMethod.POST)
	public String reply_delete() {

		return "";
	}

}// class end
