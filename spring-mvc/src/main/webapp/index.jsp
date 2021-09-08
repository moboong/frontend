<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<a href="<%= request.getContextPath() %>/hello/hello.do">hello</a>
	<a href="<%= request.getContextPath() %>/method/method.do">method</a>
	<a href="<%= request.getContextPath() %>/form/joinForm.do">form</a>
	<a href="<%= request.getContextPath() %>/ajax/resBody.do">문자열 응답</a>
	<a href="<%= request.getContextPath() %>/ajax/resBody.json">json 응답</a>
	<a href="<%= request.getContextPath() %>/ajax/resVOBody.json">json vo 응답</a>
	<a href="<%= request.getContextPath() %>/ajax/resStringListBody.json">json list(문자열) 응답</a>
	<a href="<%= request.getContextPath() %>/ajax/resVOListBody.json">json list(vo) 응답</a>
	
	<!-- 결과는 똑같아. 항상 메시지를 리턴해. 그래서 ResponseBody를 다 떼도 돼. -->
	<a href="<%= request.getContextPath() %>/ajax/restBody.do">문자열 응답</a>
	<a href="<%= request.getContextPath() %>/ajax/restBody.json">json 응답</a>
	<a href="<%= request.getContextPath() %>/ajax/restVOBody.json">json vo 응답</a>
	<a href="<%= request.getContextPath() %>/ajax/restStringListBody.json">json list(문자열) 응답</a>
	<a href="<%= request.getContextPath() %>/ajax/restVOListBody.json">json list(vo) 응답</a>
	
	<a href="<%= request.getContextPath() %>/file/uploadForm.do">파일 업로드</a>
	
	<a href="<%= request.getContextPath() %>/ajax/jsonList.json">환율</a>
	
</body>
</body>

</html>