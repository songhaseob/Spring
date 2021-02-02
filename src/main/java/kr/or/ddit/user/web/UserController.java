package kr.or.ddit.user.web;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.user.model.PageVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name = "userService")
	private UserService userService;
	
	@RequestMapping(path="allUser")
	public String alluser(Model model) {
		model.addAttribute("userlist", userService.selectAllUser());
		return "/user/allUser";
	}
	
	@RequestMapping("pagingUser")
	public String pagingUser(@RequestParam(defaultValue = "1") int page, 
			                 @RequestParam(defaultValue = "5") int pageSize,
			                 Model model){
		logger.debug("page :{},pageSize:{}", page,pageSize );
		
		PageVo pageVo = new PageVo(page,pageSize);
		
		model.addAllAttributes(userService.selectPagingUser(pageVo));
		
		return "/user/pagingUser";
	}
	
//	@RequestMapping("pagingUser")
	public String pagingUser(PageVo pageVo) {
		logger.debug("pageVo : {}",pageVo);
		return "";
	}
	
	@RequestMapping("registUser")
	public String registUser() {
		return "user/registUser";
	}
	
	@RequestMapping("detailuser")
	public String detailUser(String userid, Model model) {
		model.addAttribute("detaillist", userService.selectUser(userid));
		return "/user/user";
	}
	
	@RequestMapping(path="modifyuser",method = RequestMethod.GET)
	public String UserModify(String userid, Model model) {
		model.addAttribute("modifylist", userService.selectUser(userid));
		return "/user/userModify";
	}
	
	@RequestMapping(path="realmodifyuser",method = RequestMethod.POST)
	public String realUserModify(UserVo userVo, Model model,String userid,MultipartFile file) {
		
		if(file != null) {
			userVo.setFilename(file.getOriginalFilename());
			userVo.setRealfilename(file.getOriginalFilename());
			try {
				file.transferTo(new File("d:\\upload\\"+file.getOriginalFilename()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int cnt = 0;
		try {
			cnt = userService.modifyUser(userVo);
			
		} catch (Exception e) {
			cnt = 0;
		}
		if(cnt == 1) {
			return "redirect:/user/pagingUser";
		}else {
			return "/user/userModify";
		}
	}
	@RequestMapping("deleteUser")
	public String deleteUser(String userid, Model model) {
		model.addAttribute(userService.deleteUser(userid));
		return "redirect:/user/pagingUser";
	}
	@RequestMapping("insertUser")
	public String insertUser(Model model, UserVo userVo, MultipartFile file) {
		logger.debug("file:{}", file);
		userVo.setFilename(file.getOriginalFilename());
		userVo.setRealfilename(file.getOriginalFilename());
		userService.insertUser(userVo);
		
		try {
			file.transferTo(new File("d:\\upload\\"+file.getOriginalFilename()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/user/pagingUser";
	}
}
