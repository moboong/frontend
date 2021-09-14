package kr.ac.kopo.rjava.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.signal.vo.CustomVO;

@Controller
@RequestMapping("/rjava/")
public class RjavaController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("connection")
	public void connection() throws Exception {

		RConnection conn = new RConnection();
		REXP x = conn.eval("R.version.string");
		System.out.println(x.asString());

		conn.close();

	}

	@RequestMapping("test")
	public void test(HttpSession session) throws Exception {

		//MemberVO member = (MemberVO) session.getAttribute("userVO");
		MemberVO member = new MemberVO();
		member.setId("messi10");
		
		List<CustomVO> clist = new ArrayList<CustomVO>();
		
		if (member != null) {

			String struct = service.getStruct(member);
			Gson gson = new Gson();
			clist = gson.fromJson(struct, new TypeToken<List<CustomVO>>() {
			}.getType());
			
		}
		
		int size = clist.size();
		
		ArrayList<Integer> ilist = new ArrayList<Integer>();
		String memberStr = "c("; 
		for(int i = 0; i < size; i++) {
			if(i == size-1) {
				memberStr += clist.get(i).getNo() + ")";
			} else {
				memberStr += clist.get(i).getNo() + ",";
			}
			
			ilist.add(Integer.parseInt(clist.get(i).getNo()));
		}
		
		System.out.println(memberStr); //c(3,2,1)
		
		ilist.sort(null);
		String paraStr = "{";
		for(int i = 0; i < ilist.size(); i++) {
			if(i == size-1) {
				paraStr += ilist.get(i) + "}";
			} else {
				paraStr += ilist.get(i) + ",";
			}
			
		}
		
		System.out.println(paraStr); //{1,2,3}
		
		
		
		
		RConnection connection = null;
		
		//생성
		connection = new RConnection();
		connection.eval("source(\"C:/Users/HP/Rworkspace/rscript/apriori.R\")");
		connection.eval("rules <- sort(apriori(result_trans, parameter=list(supp=0.001, conf = 0.08, minlen=2), appearance = list(default=\"rhs\", lhs=" + memberStr + "), control = list(verbose=F)), decreasing=TRUE, by=\"confidence\")");
		REXP df = connection.eval("res <- inspect(rules)");
		
		RList rlist = df.asList();
		
		System.out.println("ListSize : " + rlist.size()); //8
		System.out.println("ListLength : " + rlist.at(0).length()); //18
		/*
		 * int leng = rlist.at(0).length();
		 * 
		 * 
		 * String [] temp = rlist.at(4).asStrings();
		 * 
		 * String [] temp2 = rlist.at(0).asStrings();
		 * 
		 * String [] temp3 = rlist.at(2).asStrings();
		 * 
		 * CorelateVO corelateVO = new CorelateVO();
		 */
		/*for (int i = 0; i < leng; i++) {

			if (temp2[i].equals(paraStr)) {
				System.out.println(temp2[i] + " => " + temp3[i] + " : " + temp[i] + " ");

				double confidence = Double.parseDouble(temp[i]);

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
		}*/

		// mav.addObject("corelateVO", corelateVO);
	}
	
	
}