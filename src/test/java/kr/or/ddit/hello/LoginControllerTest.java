package kr.or.ddit.hello;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Test;

import kr.or.ddit.test.config.WebTestConfig;
import kr.or.ddit.user.model.UserVo;

public class LoginControllerTest extends WebTestConfig{

	@Test
	public void viewTest() throws Exception {
		//localhost/login/view + enter ==> GET
		mockMvc.perform(get("/login/view")).andExpect(status().isOk())
		.andExpect(view().name("login"));
				
	}
	
	@Test
	public void processSuccessTest() throws Exception{
		mockMvc.perform(post("/login/process").param("userid","brown")
											  .param("pass","brownPass")
											  .param("price","1000"))
											  .andExpect(view().name("main"))
											  .andDo(print());
	}
	
	@Test
	public void processFailTest() throws Exception{
		mockMvc.perform(post("/login/process").param("userid","brown")
											  .param("pass","brownPas")
											  .param("price","1000"))
											  .andExpect(view().name("redirect:/login/view"))
											  .andDo(print());
	}


}
