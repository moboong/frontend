package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@SuppressWarnings("deprecation")
public class MsgInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String uri = request.getRequestURI();
		System.out.println(uri + " : 메세지 인터셉터 처리");
		
		HttpSession session = request.getSession();
		String msg = (String)session.getAttribute("msg");
		
		if(msg != null) {
			
			session.removeAttribute("msg");
			request.setAttribute("msg", msg);
					
			return true;
		}
		
		return true;
		//return true; //무조건 통과 프리패스
		//return false; //무조건 못가 통곡의 벽
	}
}
