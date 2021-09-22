package kr.ac.kopo.member.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.signal.vo.CorelateVO;
import kr.ac.kopo.signal.vo.CustomVO;
import kr.ac.kopo.signal.vo.PickrateVO;

@SessionAttributes({ "userVO" }) // 이 어노테이션만 있으면, 리퀘스트가 아니라 세션에 올라가
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	ServletContext servletContext;

	@GetMapping("/login")
	public String loginForm(HttpSession session) {

		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if (userVO != null) {
			session.setAttribute("msg", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}

		return "member/login";
	}

	@PostMapping("/login")
	public String login(MemberVO member, Model model, HttpSession session) { // 스프링에서는 그냥 세션객체 요구하면 그냥 줌.

		MemberVO userVO = service.login(member);

		String msg = "";
		String view = "";
		if (userVO == null) {
			msg = "아이디 또는 패스워드가 잘못되었습니다.";
			view = "member/login";
			model.addAttribute("msg", msg);
		} else {
			// 세션등록 새방법(세션등록마저 디스패처한테 짬 때릴래, 위에 어노테이션 붙이면 됨.)
			model.addAttribute("userVO", userVO);
			msg = "환영합니다. " + userVO.getName() + "님";
			session.setAttribute("msg", msg);

			// 이제 로그인 후에 그냥 가면 안되고 직전 페이지로 가게함.
			String dest = (String) session.getAttribute("dest");
			if (dest != null) {
				session.removeAttribute("dest");
				view = "redirect:" + dest;
			} else {
				view = "redirect:/";
			}
		}

		return view;
	}

	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {
		// 세션어트리뷰트(어노)를 사용한 이상 내가 여기서 session을 직접 조작할 수 없어. sessionStatus를 사용해서 삭제
		System.out.println("세션삭제 전: " + sessionStatus.isComplete());
		sessionStatus.setComplete();
		System.out.println("세션삭제 후: " + sessionStatus.isComplete());

		session.setAttribute("msg", "안녕히가세요. 이용해주셔서 감사합니다.");

		return "redirect:/";
	}

	@GetMapping("/signup")
	public String signupForm(HttpSession session) {

		MemberVO userVO = (MemberVO) session.getAttribute("userVO");

		if (userVO != null) {
			session.setAttribute("msg", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}

		return "member/signup";
	}

	@PostMapping("/signup")
	public String signup(@Valid MemberVO member, Errors error, HttpSession session, MultipartHttpServletRequest mRequest) throws Exception {
		
		if (error.hasErrors()) {
			System.out.println("회원가입 오류발생!!!");
			return "member/signup";
		}
		
		
		String uploadDir = servletContext.getRealPath("/upload/profile/");
		System.out.println(uploadDir);
		
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			
			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);
			
			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			System.out.println("원본 파일명 : " + oriFileName);
			
			if(oriFileName != null && !oriFileName.equals("")) {
			
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치 
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}
				
				// 고유한 파일명 만들기	
				String saveFileName = member.getId() + ext; //확장자까지 붙이기
				System.out.println("저장할 파일명 : " + saveFileName);

			
				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File(uploadDir + saveFileName));
			} 
		} 
		

		String msg = "";
		int result = service.signup(member);
		if (result == 0) {
			msg = "회원등록 실패했습니다.";
		} else {
			msg = "회원등록 완료했습니다.";
		}

		session.setAttribute("msg", msg);
		return "redirect:/login";
	}
	
	@GetMapping("/mypage")
	public ModelAndView mypage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("member/mypage");
		
		//이거 나중에 로그인체크 인터셉터로 다 처리할거야.
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if (userVO == null) {
			session.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			mav.setViewName("redirect:/");
		} else {
			MemberVO mypage = service.getMypage(userVO.getId());
			mav.addObject("mypage", mypage);
		}
		
		return mav;
	}
	
	
	@PostMapping("/mypage")
	public String checkPW(String password, HttpSession session) {
		
		String view = "";
		String msg = "";
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		if(userVO.getPassword().equals(password)) {
			msg = "개인정보수정 페이지로 이동합니다.";
			view = "redirect:/updateMypage";
		} else {
			msg = "비밀번호가 틀렸습니다.";
			view = "redirect:/mypage";
		}
		
		session.setAttribute("msg", msg);
		
		return view;
	}
	
	
	@GetMapping("/updateMypage")
	public ModelAndView updateMypageForm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("member/updateMypage");
		
		//이거 나중에 로그인체크 인터셉터로 다 처리할거야.
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if (userVO == null) {
			session.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			mav.setViewName("redirect:/");
		} else {
			MemberVO mypage = service.getMypage(userVO.getId());
			mav.addObject("mypage", mypage);
		}
		
		return mav;
	}
	
	
	@PostMapping("/updateMypage")
	public String updateMypage(MemberVO member, HttpSession session, MultipartHttpServletRequest mRequest, Model model) throws Exception {
		
		System.out.println("처리전:" + member);
		
		String msg = "";
		int result = 0;
		
		MemberVO mypage = service.getMypage(member.getId());
		System.out.println("비교대상:" + mypage);
		
		if(member.getPassword().equals("") && member.getName().equals("") && member.getEmail().equals("") && member.getTel().equals("") && (member.getAgree() == null || member.getAgree().equals(""))) {
			//전부 null이면 안바꿔
			result++;
			
		} else {
			//하나라도 입력했으면 바꿔
			
			if(member.getPassword().equals("")) {
				member.setPassword(mypage.getPassword());
			}
			if(member.getName().equals("")) {
				member.setName(mypage.getName());
			}
			if(member.getEmail().equals("")) {
				member.setEmail(mypage.getEmail());
			}
			if(member.getTel().equals("")) {
				member.setTel(mypage.getTel());
			}
			if(member.getAgree() == null || member.getAgree().equals("")) {
				member.setAgree(mypage.getAgree());
			}
			System.out.println("처리후:" + member);
			result = service.updateMypage(member);
		}
		
		if(result != 0) {
			msg = "수정을 완료했습니다.";
			//파일입력
			String uploadDir = servletContext.getRealPath("/upload/profile/");
			System.out.println(uploadDir);
			
			Iterator<String> iter = mRequest.getFileNames();
			while(iter.hasNext()) {
				
				String formFileName = iter.next();
				// 폼에서 파일을 선택하지 않아도 객체 생성됨
				MultipartFile mFile = mRequest.getFile(formFileName);
				
				// 원본 파일명
				String oriFileName = mFile.getOriginalFilename();
				System.out.println("원본 파일명 : " + oriFileName);
				
				if(oriFileName != null && !oriFileName.equals("")) {
				
					// 확장자 처리
					String ext = "";
					// 뒤쪽에 있는 . 의 위치 
					int index = oriFileName.lastIndexOf(".");
					if (index != -1) {
						// 파일명에서 확장자명(.포함)을 추출
						ext = oriFileName.substring(index);
					}
					
					// 고유한 파일명 만들기	
					String saveFileName = member.getId() + ext; //확장자까지 붙이기
					System.out.println("저장할 파일명 : " + saveFileName);

				
					// 임시저장된 파일을 원하는 경로에 저장
					mFile.transferTo(new File(uploadDir + saveFileName));
				} 
			}
			//파일입력
		} else {
			msg = "수정에 실패했습니다.";
		}
		session.setAttribute("msg", msg);
		
		
		
		//로그인 세션 초기화
		MemberVO userVO = service.login(member);
		model.addAttribute("userVO", userVO);
		
		return "redirect:/mypage";
	}

	
	@GetMapping("/custom/userpage")
	public ModelAndView getStruct(HttpSession session) {

		ModelAndView mav = new ModelAndView("custom/userpage/struct-default");

		MemberVO member = (MemberVO) session.getAttribute("userVO");

		if (member != null) {

			String struct = service.getStruct(member);
			Gson gson = new Gson();
			List<CustomVO> list = gson.fromJson(struct, new TypeToken<List<CustomVO>>() {
			}.getType());

			mav.addObject("list", list);

		}

		return mav;
	}

	@PostMapping("/custom/userpage")
	@ResponseBody
	public String setStruct(@RequestParam("struct") String struct, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("userVO");
		if (member != null) {
			member.setStruct(struct);
			// 서비스 불러서 디비 드가서 등록하고 int 로 반환하기
			result = service.setStruct(member);
		}

		String msg = "";
		if (result != 0) {
			msg = "저장 성공";
		} else {
			msg = "저장 실패 or 비로그인";
		}

		return msg;
	}

	@GetMapping("/custom/graph/{value}")
	public ModelAndView getGraph(@PathVariable("value") String value) {

		ModelAndView mav = new ModelAndView("custom/graph/" + value);

		return mav;
	}

	// 데이터분석: 전체 가져오기
	@GetMapping("/custom/pickrate")
	public ModelAndView getAllStruct(HttpSession session) {

		Gson gson = new Gson();
		List<String> structList = service.getAllStruct();
		int all = structList.size(); // 전체 회원수
		System.out.println("전체 회원수:" + all);

		PickrateVO pickrateVO = new PickrateVO(0, 0, 0, 0, 0, 0, 0, 0, 0);

		for (int j = 0; j < all; j++) {

			String one = structList.get(j);
			List<CustomVO> list = gson.fromJson(one, new TypeToken<List<CustomVO>>() {
			}.getType());

			if (list != null) {

				for (int i = 0; i < list.size(); i++) {
					String no = list.get(i).getNo();
					switch (no) {
					case "1":
						pickrateVO.setG1(pickrateVO.getG1() + 1);
						break;
					case "2":
						pickrateVO.setG2(pickrateVO.getG2() + 1);
						break;
					case "3":
						pickrateVO.setG3(pickrateVO.getG3() + 1);
						break;
					case "4":
						pickrateVO.setG4(pickrateVO.getG4() + 1);
						break;
					case "5":
						pickrateVO.setG5(pickrateVO.getG5() + 1);
						break;
					case "6":
						pickrateVO.setG6(pickrateVO.getG6() + 1);
						break;
					case "7":
						pickrateVO.setG7(pickrateVO.getG7() + 1);
						break;
					case "8":
						pickrateVO.setG8(pickrateVO.getG8() + 1);
						break;
					case "9":
						pickrateVO.setG9(pickrateVO.getG9() + 1);
						break;
					default:
						System.out.println("이상값 발생");
						break;
					}
				}
			}
		}

		System.out.println("계산전:" + pickrateVO);
		pickrateVO.getRate(all);
		System.out.println("계산후:" + pickrateVO);

		ModelAndView mav = new ModelAndView("modal/addgraph");
		mav.addObject("pickrateVO", pickrateVO);

		// 연관성 분석 시작
		MemberVO member = (MemberVO) session.getAttribute("userVO");

		List<CustomVO> clist = new ArrayList<CustomVO>();

		if (member != null) {

			String struct = service.getStruct(member);
			Gson gs = new Gson();
			clist = gs.fromJson(struct, new TypeToken<List<CustomVO>>() {
			}.getType());

			int size = clist.size();

			ArrayList<Integer> ilist = new ArrayList<Integer>();
			String memberStr = "c(";
			for (int i = 0; i < size; i++) {
				if (i == size - 1) {
					memberStr += clist.get(i).getNo() + ")";
				} else {
					memberStr += clist.get(i).getNo() + ",";
				}

				ilist.add(Integer.parseInt(clist.get(i).getNo()));
			}

			System.out.println(memberStr); // c(3,2,1)

			ilist.sort(null);
			String paraStr = "{";
			for (int i = 0; i < ilist.size(); i++) {
				if (i == size - 1) {
					paraStr += ilist.get(i) + "}";
				} else {
					paraStr += ilist.get(i) + ",";
				}

			}

			System.out.println(paraStr); // {1,2,3}

			RConnection connection = null;

			try {

				connection = new RConnection();
				connection.eval("source(\"C:/Users/HP/Rworkspace/rscript/apriori.R\")");
				connection.eval(
						"rules <- sort(apriori(result_trans, parameter=list(supp=0.001, conf = 0.08, minlen=2), appearance = list(default=\"rhs\", lhs="
								+ memberStr + "), control = list(verbose=F)), decreasing=TRUE, by=\"confidence\")");
				REXP df = connection.eval("res <- inspect(rules)");

				RList rlist = df.asList();

				System.out.println("ListSize : " + rlist.size()); // 8
				System.out.println("ListLength : " + rlist.at(0).length()); // 18
				int leng = rlist.at(0).length();

				String[] temp = rlist.at(4).asStrings();

				String[] temp2 = rlist.at(0).asStrings();

				String[] temp3 = rlist.at(2).asStrings();

				CorelateVO corelateVO = new CorelateVO();

				for (int i = 0; i < leng; i++) {

					if (temp2[i].equals(paraStr)) {
						System.out.println(temp2[i] + " => " + temp3[i] + " : " + temp[i] + " ");

						double confidence = Double.parseDouble(temp[i]);
						confidence = confidence * 100;
						DecimalFormat form = new DecimalFormat("#.##");
						String confiStr = form.format(confidence);
						confidence = Double.parseDouble(confiStr);

						switch (temp3[i]) {
						case "{1}":
							corelateVO.setG1(confidence);
							break;
						case "{2}":
							corelateVO.setG2(confidence);
							break;
						case "{3}":
							corelateVO.setG3(confidence);
							break;
						case "{4}":
							corelateVO.setG4(confidence);
							break;
						case "{5}":
							corelateVO.setG5(confidence);
							break;
						case "{6}":
							corelateVO.setG6(confidence);
							break;
						case "{7}":
							corelateVO.setG7(confidence);
							break;
						case "{8}":
							corelateVO.setG8(confidence);
							break;
						case "{9}":
							corelateVO.setG9(confidence);
							break;
						default:
							System.out.println("이상값 발생");
							break;
						}
					}
				}

				for (int i = 0; i < ilist.size(); i++) {
					switch (ilist.get(i)) {
					case 1:
						corelateVO.setG1(-1);
						break;
					case 2:
						corelateVO.setG2(-1);
						break;
					case 3:
						corelateVO.setG3(-1);
						break;
					case 4:
						corelateVO.setG4(-1);
						break;
					case 5:
						corelateVO.setG5(-1);
						break;
					case 6:
						corelateVO.setG6(-1);
						break;
					case 7:
						corelateVO.setG7(-1);
						break;
					case 8:
						corelateVO.setG8(-1);
						break;
					case 9:
						corelateVO.setG9(-1);
						break;
					default:
						System.out.println("이상값 발생");
						break;
					}
				}

				mav.addObject("corelateVO", corelateVO);

				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}

		return mav;
	}
}
