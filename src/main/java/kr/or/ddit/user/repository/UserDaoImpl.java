package kr.or.ddit.user.repository;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.user.model.PageVo;
import kr.or.ddit.user.model.UserVo;

// <bean id="" class=""/>
// @Repository에서 별다른 설정을 하지 않으면 스프링 빈 이름으로 class 이름에서 첫글자를 소문자로 한
// 문자열이 스프링 빈의 이름으로 설정 된다
// UserDaoImpl ==> userDaoImpl

// UserDao / UserDaoImpl ==>@Resource(name="userDaoImpl)"
// UserDaoI / userDao    ==>==>@Resource(name="userDao)"

@Repository("userDao")
public class UserDaoImpl implements UserDao{
	
	@Resource(name = "sqlSessionTemplate")
					  
	private SqlSessionTemplate template;
	
	@Override
	public UserVo selectUser(String userid) {
		// 원래는 데이터베이스에서 조회를 해야하나, 개발 초기단계라
		// 설정이 완료되지 않음, 현재 확인하려고 하는 기능은 스프링 컨테이너에 초점을 맞추기 위해
		// new 연산자를 통해 생성한 vo객체를 반환
		
		return template.selectOne("users.selectUser",userid);
	}
	
	@Override
	public List<UserVo> selectAllUser() {
		
		return template.selectList("users.selectAllUser");
	}


	@Override
	public List<UserVo> selectPagingUser(PageVo vo) {
		
		return template.selectList("users.selectPagingUser", vo);
	}

	@Override
	public int selectAlluserCnt() {
		
		return template.selectOne("users.selectAlluserCnt");
	}

	@Override
	public int modifyUser(UserVo userVo) {
		
		return template.update("users.modifyUser", userVo);
	}

	@Override
	public int insertUser(UserVo userVo) {
		
		return template.insert("users.insertUser", userVo);
	}

	@Override
	public int deleteUser(String userid) {
		
		return template.insert("users.deleteUser",userid);
	}

}
