package kr.or.ddit.user.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Resource(name = "userService")
	private UserService userService;
	
	@RequestMapping(path="allUser")
	public String alluser(Model model) {
		model.addAttribute("userlist", userService.selectAllUser());
		return "/user/allUser";
	}
	
}
