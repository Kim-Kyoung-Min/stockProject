package com.bitcamp.project.view.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.AdminService;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.AdminVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	@Autowired
	HttpSession session;
	

	@GetMapping("/admin/main")
	public ModelAndView adminPage() {
		ModelAndView mav = new ModelAndView();
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null || loginUser.getPoint() >= 0) {
			mav.addObject("msg", "관리자만 접근할 수 있습니다");
			mav.addObject("location", "/mainPage");
			mav.addObject("icon", "error");
			mav.setViewName("msg");
		}
		
		mav.setViewName("adminPage");
		return mav;
	}
	
	@GetMapping("/admin/qna")
	public String adminQnaList(AdminVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword) {

		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null || loginUser.getPoint() >= 0) {
			model.addAttribute("msg", "관리자만 접근할 수 있습니다");
			model.addAttribute("location", "/mainPage");
			model.addAttribute("icon", "error");
			return "msg";
		}
		
		loginUser.getPoint();
		
		
		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		if (searchStyle.equals("")) {
			keyword = "";
		}

		Map<String, Object> qnaList = adminService.qnaList(vo, Integer.parseInt(nowPage), 30, searchStyle, keyword);
		model.addAttribute("qnaList", (List<AdminVO>) qnaList.get("qnaList"));
		model.addAttribute("qnaPage", (PagingVO) qnaList.get("qnaPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		return "adminQna";
	}
	
	@GetMapping("/admin/qna/detail")
	public ModelAndView adminQnaDetail(AdminVO vo) {
		ModelAndView mav = new ModelAndView();
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");

		if(loginUser == null || loginUser.getPoint() >= 0) {
			mav.addObject("msg", "관리자만 접근할 수 있습니다");
			mav.addObject("location", "/mainPage");
			mav.addObject("icon", "error");
			mav.setViewName("msg");
			
			return mav;
		}
		
		int check = adminService.qnaCount(vo);
		if(check == 1) {
			vo.setAno(1);
		}
		else
			vo.setAno(-1);
		
		AdminVO qnaDetail = adminService.qnaDetail(vo);
		mav.addObject("qna", qnaDetail);
		mav.setViewName("adminQnaDetail");
		
		return mav;
	}
	
	
	
	@GetMapping("/admin/report")
	public String adminReportList(AdminVO vo) {
		
		Map<String, Object> reportList = adminService.reportList(vo);
		return "adminReport";
	}
}
