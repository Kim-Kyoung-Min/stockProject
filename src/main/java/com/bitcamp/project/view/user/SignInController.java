package com.bitcamp.project.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bitcamp.project.service.SignInService;
import com.bitcamp.project.vo.UserVO;

@Controller
public class SignInController {
	
	@Autowired
	private SignInService signInService;
	
	@GetMapping(value="/signInPage" )
	public String signInView(UserVO vo) {
		return "login";
	}
	
	@PostMapping(value="/signIn")
	public String signIn(@ModelAttribute("id") String id, @ModelAttribute("pw") String pw, HttpSession session) {
		UserVO vo = new UserVO();
		vo.setId(id);
		vo = signInService.logIn(vo);
//		if(vo != null)
//			System.out.println(vo.toString());
//		else
//			System.out.println(vo);
		if(vo != null) {
//			System.out.println("pw1 " + vo.getPw());
//			System.out.println("pw2 " + pw);
			if(vo.getPw().equals(pw)) {
				session.setAttribute("loginUser", vo);
				return "mainpage";
			}
			else return "login";
		}
		else 
			return "login";
	}
	
	@GetMapping(value="/logOut")
	public String logout(HttpSession session) {
		session.invalidate();
		return "mainpage";
	}
	
	@GetMapping(value="/forGetPassword")
	public String findPwView() {
		return "forgetpasswordpage";
		
	}
	@PostMapping(value="/forGetPassword")
	public String findPw(UserVO vo, @ModelAttribute("id") String id, @ModelAttribute("pw") String pw, HttpSession session) {
		vo.setId(id);
		System.out.println("vo.setid : " + id);
		vo.setPw(pw);
		System.out.println("vo.setpassword : " + pw);
		vo = signInService.findPw(vo);
		if(vo==null) {
			System.out.println("인증번호 틀림");
		}
		else {
			System.out.println("너의 새 비밀번호는 ?????니다.");
		}
		return null;
		
	}
	
}












