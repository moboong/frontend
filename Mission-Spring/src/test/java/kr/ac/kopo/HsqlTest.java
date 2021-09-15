package kr.ac.kopo;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.exchange.vo.ExchangeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/config/spring/spring-mvc.xml")
public class HsqlTest {
    
	@Resource(name="hsqlSessionTemplate")
	private SqlSessionTemplate hsqlsessionTemplate;
    
    @Test
    public void test() {
//    	List<BoardVO> blist = hsqlsessionTemplate.selectList("board.BoardDAO.blist");
//    	System.out.println(blist);
    	
    	List<ExchangeVO> elist = hsqlsessionTemplate.selectList("exchange.ExchangeDAO.elist");
    	System.out.println(elist);
    }
}
