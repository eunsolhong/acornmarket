package controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import repository.MybatisBoardDao;

@Controller
@RequestMapping("/board/")
public class BoardController {

	String boardid;
	String pageNum;

	@Autowired
	MybatisBoardDao dbPro;

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
	public String board_list(HttpServletRequest request, Board article) {
	//List 있어야함, 뷰단에서 li 뿌려줘야함
		
		
		return "board/list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String board_writeForm(@ModelAttribute("article") Board article) {
		article.setReadcount(0);
		return "board/writeForm";
	}

	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String board_writePro2(Board article,Model m) throws Exception {
		
		System.out.println(">>>>>>>test hello=======1" + article );
		article.setFilename("null");
		System.out.println("@@@@@2");
		System.out.println("@@@@@3");
		dbPro.insertArticle(article);
		System.out.println("@@@@@4");
		System.out.println(article.getCategory()+"@@@@@5");
		m.addAttribute("category",article.getCategory());
		
		
//		파라미터에 HttpServletRequest multipart 추가해주기, 폼쪽에도 추가해줄거 enctype="multipart/form-data"
//		MultipartFile multi = ((MultipartRequest) multipart).getFile("filename");
//		
//		String filename = multi.getOriginalFilename();
//		if (filename != null && !filename.equals("")) {
//			String uploadPath = multipart.getRealPath("/") + "/uploadFile";
//			System.out.println(uploadPath);
//
//			FileCopyUtils.copy(multi.getInputStream(),
//					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));
//
//			article.setFilename(filename);
//		} else {
//			article.setFilename("");
//		}
//		article.setBoardid(boardid);
//		dbPro.insertArticle(article);
		
		
		return "board/writePro";
	}
	
	@RequestMapping(value = "categoryForm")
	public String board_categoryForm(HttpServletRequest request,@RequestParam("category") String category,Model m) {
		HttpSession session = request.getSession();
		System.out.println(category+"@@@@");
		
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
		System.out.println(category+"@@@@");
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
		System.out.println(li+"@@@li");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;

		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("count", count);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("number", number);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageCount", pageCount);

		m.addAttribute("li", li);

		return "board/categoryForm";
	}
	
	@RequestMapping(value = "content")
	public String content (Board article, Model m) throws Exception {
		
		
		
		return "board/content";
		
	}
	
	
}
