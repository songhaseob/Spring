package kr.or.ddit.mvc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("user")
@Controller
public class excotroller {
	
	@RequestMapping(path = "login", method = RequestMethod.POST)
	public String login() {
		return "login2";
	}
}
