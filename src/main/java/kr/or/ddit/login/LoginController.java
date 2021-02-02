package kr.or.ddit.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;

@RequestMapping("login")
@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Resource(name="userService")
	private UserService userService;
	
	// 특정 파라미터의 값이 정해진 값과 일치 할때만 해당 요청을 처리
	@RequestMapping(path="view")
	public String view() {
		logger.debug("들어왔냐");
		return "login";
	}
	
//	@RequestMapping("process")
	//파라미터 ID랑 동일하게 - 인자값
	public String process(String userid, String pass, int price) {
		logger.debug("userid:{}",userid);
		logger.debug("pass:{}",pass);
		logger.debug("price:{}",price);
		return "";
	}
	//1개일때는 {} 안써도되고 여러개일경우 {} 써야한다!
	@RequestMapping(path="process", method = {RequestMethod.POST})
	public String process(UserVo userVo,HttpSession session) {
//		public String process(HttpSession session,UserVo userVo) {
		logger.debug("userVo : {}", userVo);
		
		UserVo dbUser = userService.selectUser(userVo.getUserid());
		if(dbUser != null && userVo.getPass().equals(dbUser.getPass())) {
			session.setAttribute("S_USER", dbUser);
			return "main";
		}else {
			return "redirect:/login/view";
		}
	}
}
