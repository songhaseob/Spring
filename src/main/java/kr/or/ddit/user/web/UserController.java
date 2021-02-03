package kr.or.ddit.user.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.user.model.PageVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.validator.UserVoValidator;

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
	//bindingResult 객체는 command 객체 바로 뒤에 인자로 기술해야한다
	
	public String insertUser(@Valid UserVo userVo, BindingResult result, Model model, MultipartFile file) {
		
		new UserVoValidator().validate(userVo, result);
		
		if(result.hasErrors()) {
			logger.debug("result has error ");
			return "/user/registUser";
		}
		
		logger.debug("file:{}", file);
		userVo.setFilename(file.getOriginalFilename());
		userVo.setRealfilename(file.getOriginalFilename());
		try {
			file.transferTo(new File("d:\\upload\\"+file.getOriginalFilename()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int insertCnt = 0;
		try {
			insertCnt = userService.insertUser(userVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			insertCnt =0;
		}
		if(insertCnt ==1) {
			return "redirect:/user/pagingUser";
		}else {
			return "/user/registUser";
		}
	}
	
	@RequestMapping("excelDownload")
	public String excelDownload(Model model) {
		List<String> header = new ArrayList<String>();
		
		header.add("사용자아이디");
		header.add("사용자이름");
		header.add("사용자 별명");
		
		model.addAttribute("header", header);
		model.addAttribute("data",userService.selectAllUser());
		
		return "userExcelDownloadView";
	}
	
	@RequestMapping("pagingUserTiles")
	public String pagingUserTiles(@RequestParam(defaultValue = "1") int page, 
			                 @RequestParam(defaultValue = "5") int pageSize,
			                 Model model){
		logger.debug("page :{},pageSize:{}", page,pageSize );
		
		PageVo pageVo = new PageVo(page,pageSize);
		
		model.addAllAttributes(userService.selectPagingUser(pageVo));
		
		// tiles-definition에 설정한 name
		return "tiles.user.pagingUser";
	}
	
	@RequestMapping(path="allUserTiles")
	public String alluserTiles(Model model) {
		model.addAttribute("userlist", userService.selectAllUser());
		return "tiles.user.allUser";
	}
	
	// localhost/user/profile
	@RequestMapping("profile")
	public void profile(HttpServletResponse resp, String userid,HttpServletRequest req) {
		resp.setContentType("image");
		
		UserVo uservo = userService.selectUser(userid);
		String path = "";
		if(uservo.getRealfilename() == null) {
			path = req.getServletContext().getRealPath("/image/aa.png");
		}else {
			path = uservo.getRealfilename();
			
		}
		logger.debug("path : {}",path);
		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = resp.getOutputStream();
			
			byte[] buff = new byte[512];
			
			while(fis.read(buff) != -1) {
				sos.write(buff);
			}
			
			fis.close();
			sos.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		
	}
	}
	@RequestMapping("profileDownload")
	public void profiledownload(String userid, HttpServletResponse resp) {
		 UserVo userVo = userService.selectUser(userid);

		 String filename = userVo.getFilename();
	      resp.setHeader("Content-Disposition", "attachement; filename=" + filename);
	      
	      String realFilename = userVo.getRealfilename();
	      
	      try {
	         ServletOutputStream sos = resp.getOutputStream();
	         
	         FileInputStream fis = new FileInputStream(new File(realFilename));
	         byte[] buf = new byte[1024];
	         while(fis.read(buf) != -1) {
	            sos.write(buf);
	         }
	         sos.close();
	         fis.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
}

