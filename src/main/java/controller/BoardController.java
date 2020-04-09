package controller;

import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import model.Board;
import model.Likecheck;
import repository.MybatisBoardDao;

@Controller
@RequestMapping("/board/")
public class BoardController {

	String boardid;
	String pageNum;
	String userid;

	@Autowired
	MybatisBoardDao dbPro;

//	@Autowired
//	MybatisReplyDao replyPro;

	@ModelAttribute
	public void initProcess(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userId");
	}

	@RequestMapping(value = "list")
	public String board_list(HttpServletRequest request, Model m) {

		List li = dbPro.getlistArticles();
		System.out.println(">>>>>" + li);
		m.addAttribute("li", li);

		return "board/list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String board_writeForm(@ModelAttribute("article") Board article) {

		return "board/writeForm";
	}

	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String board_writePro(HttpServletRequest multipart, Board article, Model m, String address1, String address2, HttpServletRequest request)
			throws Exception {
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userId");
		
		System.out.println(article);
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

		String userid = (String) session.getAttribute("userId");
		System.out.println(userid);

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
		request.setAttribute("userid", userid);

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
	public String board_updatePro(HttpServletRequest request, Board article, Model m, String address1, String address2)
			throws Exception {

		article.setAddress(address1 + " " + address2);

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

	@ResponseBody
	  @RequestMapping(value="/liketo/like.do", produces="text/plain;charset=UTF-8")
	  public String like(int boardnum, HttpSession session, String userid){
	    //System.out.println("--> like() created");
	    int mno = (Integer)session.getAttribute("userid");
	    JSONObject obj = new JSONObject();
	 
	    ArrayList<String> msgs = new ArrayList<String>();
	    HashMap<String,Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("boardnum", boardnum);
	    hashMap.put("userid", userid);
	    Likecheck liketoVO = MybatisBoardDao.read(hashMap);
	    
	    Board board = MybatisBoardDao.read(boardnum);
	    int like_cnt = Board.getLike_cnt();     //게시판의 좋아요 카운트
	    int like_check = 0;
	    like_check = liketoVO.getLike_check();    //좋아요 체크 값
	    
	    if(MybatisBoardDao.countbyLike(hashMap)==0){
	    	MybatisBoardDao.create(hashMap);
	    }
	      
	    if(like_check == 0) {
	      msgs.add("좋아요!");
	      MybatisBoardDao.like_check(hashMap);
	      like_check++;
	      like_cnt++;
	      MybatisBoardDao.like_cnt_up(boardnum);   //좋아요 갯수 증가
	    } else {
	      msgs.add("좋아요 취소");
	      MybatisBoardDao.like_check_cancel(hashMap);
	      like_check--;
	      like_cnt--
	      MybatisBoardDao.like_cnt_down(boardnum);   //좋아요 갯수 감소
	    }
	    obj.put("boardnum", Likecheck.getBoardnum());
	    obj.put("like_check", like_check);
	    obj.put("like_cnt", like_cnt);
	    obj.put("msg", msgs);
	    
	    return obj.toJSONString();
	  }
}// class end
