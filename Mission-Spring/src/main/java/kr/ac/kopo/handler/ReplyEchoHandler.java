package kr.ac.kopo.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.ac.kopo.member.vo.MemberVO;


public class ReplyEchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	//클라이언트가 접속했을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished:" + session);
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}
	
	//소켓에 메시지 보낼 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage:" + session + " : " + message);
		//String senderId = getId(session);
		
		//모든 유저에게 보내기
//		for (WebSocketSession sess: sessions) {
//			sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
//		}
		
		
		//protocol: cmd,댓글작성자,게시글작성자,bno  (ex: reply,user2,user1,234)
		String msg = message.getPayload();
		if (StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if (strs != null && strs.length == 4) { //이거 안하면 아웃바운더리 에러, 런타임 등등 발생할 수 있음. 3개 입력하면 그런 에러 발생.
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				
				//온라인중인가를 판단함.
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
				if ("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 " + "<a href=\"/Mission-Spring/board/" + bno + "\"><label class=\"label label-success\">" + bno + "</label></a>번 게시글에 댓글을 달았습니다!");
					boardWriterSession.sendMessage(tmpMsg);
				}
				if ("alarm".equals(cmd) && "all".equals(boardWriter)) {
					TextMessage tmpMsg = new TextMessage(bno + "이상 감지!! 확인 요함.");
					for (WebSocketSession sess: sessions) {
						sess.sendMessage(tmpMsg);
					}
				}
			}
		}
	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO userVO = (MemberVO)httpSession.get("userVO");
		if (null == userVO)
			return session.getId();
		else
			return userVO.getId();
	}
	
	public List<WebSocketSession> getSessionList(){
		List<WebSocketSession> sessionList = this.sessions;
		return sessionList;
	}

	//커넥션 클로즈 시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionEstablished:" + session + ":" + status);
	}
}