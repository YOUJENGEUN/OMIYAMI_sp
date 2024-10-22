package com.omiyami.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omiyami.shop.cart.CartService;
import com.omiyami.shop.user.UserService;
import com.omiyami.shop.user.UserVO;


@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value ="/login", method = RequestMethod.GET)
	public String showLogin(HttpSession session, Model model) {

		return "user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username,
    				   @RequestParam("password") String password,
    				   HttpSession session, Model model) {

		UserVO userVO = userService.getUserForLogin(username, password);
		if(userVO != null) {
			session.setAttribute("userVO", userVO);
			
			// 장바구니에 임시로 저장된 상품 정보가 있는지 확인
	        Integer tempProductId = (Integer) session.getAttribute("temp_product_id");
	        Integer tempQuantity = (Integer) session.getAttribute("temp_quantity");

	        // 임시 데이터가 있으면 장바구니에 추가
	        if (tempProductId != null && tempQuantity != null) {
	            cartService.addToCart(userVO.getUser_id(), tempProductId, tempQuantity);
	            session.removeAttribute("temp_product_id");
	            session.removeAttribute("temp_quantity");
	        }
			
			//필요 경로로 리다이렉트 (mypage, cart에서 redirectUrl연결중)
			String redirectUrl = (String)session.getAttribute("redirectUrl");
			
			if(redirectUrl != null) {
				session.removeAttribute("redirectUrl");
				model.addAttribute("loginMessage", "로그인이 필요합니다");
				return "redirect:" + redirectUrl;
			}else {
				if(username.equals("admin")){
					return "redirect:admin"; //관리자페이지
				}else {
					return "redirect:/main"; //메인이동
				}
			}
		}else {
			model.addAttribute("ErrorMessage", "아이디 또는 비밀번호가 다릅니다");
			return "user/login";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";
	}
	
	
	//회원가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String showSignup(){
		return "user/signup";
	}
	
	//회원가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String getSignup(
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("phone") String phone,
			@RequestParam("post_num") String post_num,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam("address3") String address3,
			Model model) throws Exception{
			String fulladdress = address1+address2+address3;
			
			UserVO vo= new UserVO();
			
			vo.setUsername(username);
			vo.setPassword(password);
			vo.setName(name);
			vo.setEmail(email);
			vo.setPhone(phone);
			vo.setPost_num(post_num);
			vo.setAddress(fulladdress);
			
			userService.signup(vo);
					
			model.addAttribute("username", vo.getUsername());
			model.addAttribute("name", vo.getName());
			
			return "user/signup_end";
		}
	
	//회원가입 ID중복체크
	@RequestMapping(value = "/checkID", method = RequestMethod.GET)
	@ResponseBody
	public String checkId(@RequestParam("username") String username) {
		boolean isDuplicated = userService.idCheck(username);
		System.out.println(isDuplicated);
		return isDuplicated ? "duplicated" : "available";
	}
	
	
	//아이디찾기get
	@RequestMapping(value = "/findID", method = RequestMethod.GET)
    public String ShowfindId(){
        return "user/findID";
    }
    
	//아이디찾기post
    @RequestMapping(value = "/findID", method = RequestMethod.POST)
    public String findId(UserVO vo, Model model,
    	    @RequestParam("name") String name,
    	    @RequestParam("email") String email,
    	    @RequestParam("phone") String phone) {
    	    
    	    vo.setName(name);
    	    vo.setEmail(email);
    	    vo.setPhone(phone);

    	    System.out.println(vo.getName());
    	    System.out.println(vo.getEmail());
    	    System.out.println(vo.getPhone());
    	    
    	    String username = userService.findId(vo);
    
    	    if (username != null) {
    	        model.addAttribute("username", username);
    	    } else {
    	        model.addAttribute("ErrorMessage", "해당하는 회원 정보가 없습니다");
    	        return "user/findID";
    	    }

    	    return "user/findID_end";
    	}
    
    
    // 비밀번호찾기get
    @RequestMapping (value = "/findPW", method = RequestMethod.GET)
    public String showfindPw() {
    	return "user/findPW";
    }
    
    // 비밀번호찾기post
    @RequestMapping(value = "/findPW", method = RequestMethod.POST)
    public String rePW(UserVO vo, Model model,
    		@RequestParam("username") String username,
    		@RequestParam("name") String name,
    		@RequestParam("phone") String phone,
    		@RequestParam("email") String email) {
    	vo.setUsername(username);
    	vo.setName(name);
    	vo.setPhone(phone);
    	vo.setEmail(email);
    	
    	String findPw = userService.findPw(vo);
    	
    	if (findPw == null) {
			return  "user/findPw";
		}else {
			model.addAttribute("username", username);
		 	return "user/rePW"; 
		} 
    	
    }

    //비밀번호재설정
    @RequestMapping (value = "/rePW", method = RequestMethod.POST)
    public String upPw(
          @RequestParam("username") String username,  // username을 받아서
          @RequestParam("password") String password ) {  // UserVO vo를 직접 사용
    	
    	UserVO vo = new UserVO();

    	vo.setUsername(username);  // username 설정
        vo.setPassword(password);  // password 설정
        userService.updatePw(vo);  // 서비스 호출하여 비밀번호 업데이트
        return "user/rePW_end";  // 완료 페이지로 이동
    }


    ////////////////////////////////////////////////////////////////////////////////////////
    
    //마이페이지
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

