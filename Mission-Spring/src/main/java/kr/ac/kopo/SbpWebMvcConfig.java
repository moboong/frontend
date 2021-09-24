package kr.ac.kopo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import kr.ac.kopo.handler.ExchangeEchoHandler;

@Configuration
@EnableWebSocket
public class SbpWebMvcConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new ExchangeEchoHandler(), "/exchangeEcho").setAllowedOrigins("*");
	}
	
}
