package kr.or.ddit.user.repository;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.config.ModelTestConfig;
import kr.or.ddit.user.model.UserVo;

// 스프링 환경에서 junit 코드를 실행 ==> junit 코드도 스프링 빈으로 등록


public class UserDaoTest extends ModelTestConfig{
	
	@Resource(name = "userDao")
	private UserDao userDao;

	@Test
	public void getUserTest() {
		/*** Given ***/
		String userid = "brown";
		/*** When ***/
		UserVo userVo =  userDao.selectUser(userid);
		/*** Then ***/
		assertEquals("브라운", userVo.getUsernm());
	}
	
	
	

}
