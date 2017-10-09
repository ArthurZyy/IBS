package com.five.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.pojo.User;
import com.five.service.IUserService;

@Controller
public class UserController {

    @Resource
    private IUserService userService;

    @RequestMapping("/showUser")
    public String toIndex(HttpServletRequest request, Model model) {
        int userId = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.getUserById(userId);
        model.addAttribute("user", user);
        return "User";
    }
    
    @RequestMapping("/login")
    public String login(User user,HttpServletRequest request) {
    	try {
    		User loginUser = null;
    		loginUser=userService.login(loginUser);
    		if (loginUser!=null) {
    			request.setAttribute("loginUser", loginUser.getName());  
                return "index";  
			}else{  
                request.setAttribute("loginUser", "登录失败");  
                return "login";  
            }  
    	}catch (Exception e) {
			// TODO: handle exception
    		request.setAttribute("InfoMessage", "登录失败！具体异常信息：" + e.getMessage());  
            return "result";  
		}
    }
}