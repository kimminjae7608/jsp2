<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day10 el 내장객체</title>
</head>
<body>
	<h3>EL 내장(implicit)객체</h3>
		<% pageContext.setAttribute("data1", 23); 
		//pageContext.setAttribute("data", 23); %>
		<% request.setAttribute("data2", "hi~~"); 
		//request.setAttribute("data", "hi~~"); %>
		<% session.setAttribute("data3", "hi jsp"); 
		//session.setAttribute("data", "hi jsp"); 
		//session에 저장된 애트리뷰트는 세션 time out 전까지 또는 세션 종료되기전까지 남아있습니다.%>
		
		<% application.setAttribute("data4", "hello java");  //톰캣서버가 종료되거나, 애플리케이션이 서버에서 종료되면
			application.setAttribute("data", "hello java"); //그 때 application 객체가 소멸됩니다.
		%>
	<dl>
		<dt>pageScope</dt>
		<dd>pageContext에 저장된 객체(애트리뷰트) 참조 : ${pageScope.data1 }</dd>
		<dd>pageContext에 저장된 객체(애트리뷰트) 참조 : \${pageScope.data } : ${pageScope.data }</dd>
		<dt>requestScope</dt>
		<dd>request에 저장된 객체(애트리뷰트) 참조 : ${requestScope.data2 }</dd>
		<dd>request에 저장된 객체(애트리뷰트) 참조 : \${requestScope.data } : ${requestScope.data }</dd>
		<dt>sessionScope</dt>
		<dd>session에 저장된 객체(애트리뷰트) 참조 : ${sessionScope.data3 }</dd>
		<dd>session에 저장된 객체(애트리뷰트) 참조 : \${sessionScope.data } : ${sessionScope.data }</dd>
		<dt>applicationScope</dt>
		<dd>application에 저장된 객체(애트리뷰트) 참조 : ${applicationScope.data4 }</dd>
		<dd>application에 저장된 객체(애트리뷰트) 참조 : \${applicationScope.data } : ${applicationScope.data }</dd>
		<dd>scope을 생략하고 사용 \${data } : ${data }</dd>
		
		<dt>param</dt>
		<dd>request.getParameter 메소드를 대신하는 el 객체</dd>
		<dt>header</dt>
		<dd>request.getHeader 메소드를 특정 요청헤더 항목을 가져올때 사용</dd>
		<dt>cookie</dt>
		<dd>브라우저에 저장된 쿠기값 가져올때 사용</dd>
		<dt>pageContext</dt>
		<dd>요청을 처리하는 페이지 정보저장 객체, 예) \${pageContext.request.remoteAddr } : ${pageContext.request.remoteAddr }</dd>
		<dd>el을 사용할때는 jsp 내장객체를 제공하지 않습니다. pageContext 만 있고 이것으로 나머지 내장객체에 접근합니다.
		<%
			//pageContext를 jsp 내장객체를 리턴하는 메소드가 있습니다.
			//jsp request 객체 대신에
			pageContext.getRequest();
			//jsp session 객체
			pageContext.getSession();
			//jsp application
			pageContext.getResponse();
			
			//jsp out
			pageContext.getOut();
			
			//jsp application
			pageContext.getServletContext();
			//
			pageContext.getServletConfig();
			//
			pageContext.getPage();
			
		%>
		<dt>paramValues, headrrValues, initParam</dt>
	</dl>

</body>
</html>