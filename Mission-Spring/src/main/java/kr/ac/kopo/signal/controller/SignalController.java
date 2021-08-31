package kr.ac.kopo.signal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signal")
public class SignalController {
	
	@GetMapping("/exchange")
	public String exchange() {
		
		return "signal/exchange";
	}
	
	@GetMapping("/rate")
	public String rate() {
		
		return "signal/rate";
	}
	
	@GetMapping("/oil")
	public String oil() {
		
		return "signal/oil";
	}
	
	@GetMapping("/commodity")
	public String commodity() {
		
		return "signal/commodity";
	}
	
	@GetMapping("/metal")
	public String metal() {
		
		return "signal/metal";
	}
	
	@GetMapping("/market")
	public String market() {
		
		return "signal/market";
	}

}
