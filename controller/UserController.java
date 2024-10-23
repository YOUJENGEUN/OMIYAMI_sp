package com.omiyami.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omiyami.shop.user.UserService;
import com.omiyami.shop.user.UserVO;


@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value ="/login", method = RequestMethod.GET)
	public String showLogin() {
		return "user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username,
            				   @RequestParam("password") String password,
            				   HttpSession session,
            				   Model model) {

		UserVO userVO = userService.getUserForLogin(username, password);
		if(userVO != null) {
			session.setAttribute("userVO", userVO);
			
			
			String redirectUrl = (String)session.getAttribute("redirectUrl");
			
			if(redirectUrl != null) {
				session.removeAttribute("redirectUrl");
				return "redirect:" + redirectUrl;
			}else {
				if(username.equals("admin")){
					return "redirect:admin";
				}else {
					return "redirect:/main";
				}
			}
		}else {
			model.addAttribute("loginError", "아이디 또는 비밀번호가 다릅니다");
			return "user/login";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUp(){
		return "user/signup";
	}
	
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	@ResponseBody
	public String checkId(@RequestParam("username") String username) {
		boolean isDuplicated = userService.idCheck(username);
		System.out.println(isDuplicated);
		return isDuplicated ? "duplicated" : "available";
	}
	
	@RequestMapping("/mypage")
	public String showMypage(HttpSession session, Model model) {
		
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		if(userVO != null) {
			model.addAttribute("userVO", userVO);
			return "mypage/mypageMain";
		}else {
			session.setAttribute("redirectUrl", "/mypage");
			return "redirect:/login";
		}
		
	}
	
	@RequestMapping("/admin")
	public String showAdmin() {
		
		//localhost:admin으로 직접 접속할때, 관리자가 아니면 main으로 리다이렉트
		
		return "admin/adminMain";
	}
	
}

