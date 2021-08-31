package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.member.vo.MemberVO;

//테스트를 위해 필요한 자바객체와 xml 파일을 읽어준다.
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class MybatisTest {
	
	//단위테스트 란: 내가 만든 객체의 메소드가 잘 작동하는지 시험해보는 것.
	//그냥 하면 다 구축하고 생성하는데 시간이 걸리잖아. 무거운 서버일 수록 더
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private SqlSessionFactory sqlFactory;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	//Test어노테이션을 통해 이 메소드 실행, Ignore 했던거 지나가게 하기
	@Ignore
	@Test
	public void DataSource생성테스트() throws Exception {
		//System.out.println("dataSource : " + dataSource);
		assertNotNull(dataSource);
	}
	
	@Ignore
	@Test
	public void mybatis연동테스트() throws Exception {
		assertNotNull(sqlFactory);
	}
	
	@Test
	public void mybatis템플릿테스트() throws Exception {
		assertNotNull(sessionTemplate);
	}
	
	@Test
	public void 전체게시글조회Test() throws Exception {
		List<BoardVO> list = sessionTemplate.selectList("board.BoardDAO.selectAll");
		
		for(BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	@Test
	public void 상세게시글조회Test() throws Exception {
		BoardVO board = sessionTemplate.selectOne("board.BoardDAO.selectByNo", 422);
		
		System.out.println(board);
	}
	
	@Test
	public void 로그인테스트() throws Exception {
		MemberVO member = new MemberVO();
		member.setId("user");
		member.setPassword("user");
		
		MemberVO userVO = sessionTemplate.selectOne("member.MemberDAO.login", member);
		
		assertNotNull(userVO);
	}
}
