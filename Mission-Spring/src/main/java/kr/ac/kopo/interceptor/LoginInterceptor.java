package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.member.vo.MemberVO;

@SuppressWarnings("deprecation")
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println(request.getRequestURI() + " : 로그인요구 인터셉터 처리");
		
		HttpSession session = request.getSession();
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		
		if(userVO == null) {
			
			String uri = request.getRequestURI();
			uri = uri.substring(request.getContextPath().length());
			// request.getQueryString() 얘도 필요함.
			// if(query != null) uri = uri + "?" + query
			
			session.setAttribute("dest", uri);
			session.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			
			response.sendRedirect(request.getContextPath() + "/login");
			//나의 경우는 로그인 모달 띄우기
			
			return false;
		}
		
		return true;
		//return true; //무조건 통과 프리패스
		//return false; //무조건 못가 통곡의 벽
	}
}
