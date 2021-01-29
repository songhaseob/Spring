package kr.or.ddit.ioc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.repository.UserDao;
import kr.or.ddit.user.service.UserService;

@ContextConfiguration("classpath:kr/or/ddit/ioc/component-scan.xml")
@RunWith(SpringJUnit4ClassRunner.class)

public class ComponentScanTest {
	
	// @Repository 어노테이션을 적용한 userDaoImpl 스프링 빈이 정상적으로 컨테이너에 등록 되었는지 확인
	
	@Resource(name = "userDao")
	private UserDao userDao;
	
	@Resource(name = "UserService")
	private UserService UserService;
	
	@Test
	public void userDaoImplSpringBeanTest() {
		assertNotNull(userDao);
		
		UserVo userVo =  userDao.getUser("brown");
		
		assertEquals("브라운", userVo.getUsernm());
		
		
	}
	//userServiceImpl 스프링 빈이 정상적으로 컨테이너에 등록 되었는지 확인
	@Test
	public void userServiceImplSpringBeanTest() {
		assertNotNull(UserService);
		
		UserVo userVo =  UserService.getUser("brown");
		
		assertEquals("브라운", userVo.getUsernm());
		
		
	}

}
