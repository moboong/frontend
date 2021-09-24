package kr.ac.kopo.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.ac.kopo.member.vo.MemberVO;

public class ExchangeEchoHandler extends TextWebSocketHandler {

	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();

	// 클라이언트가 접속했을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished:" + session);
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}

	// 소켓에 메시지 보낼 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage:" + session + " : " + message);

		// 온라인중인가를 판단함.
//		for(int i = 0; i < userSessions.size(); i++) {
//			WebSocketSession onlinSession = userSessions.get(i)
//			if (onlinSession != null) {
//				TextMessage tmpMsg = new TextMessage("비상");
//				onlinSession.sendMessage(tmpMsg);
//			}			
//		}
		
		for (Map.Entry<String, WebSocketSession> entry : userSessions.entrySet()) {
		    WebSocketSession onlinSession = entry.getValue();
		    if (onlinSession != null) {
				TextMessage tmpMsg = new TextMessage("환율 변동성 감지!!");
				onlinSession.sendMessage(tmpMsg);
			}
		}

	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO userVO = (MemberVO) httpSession.get("userVO");
		if (null == userVO)
			return session.getId();
		else
			return userVO.getId();
	}

	// 커넥션 클로즈 시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionEstablished:" + session + ":" + status);
	}
}