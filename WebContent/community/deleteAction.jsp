<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int idx=Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	String password = request.getParameter("password");

	FreeboardDao dao = FreeboardDao.getInstance();
	Map<String,Object> map = new HashMap<>();
	map.put("idx", idx);
	map.put("password",password);
	
	int n = dao.delete(map);	//주요 실행 메소드
	/* out.print(n); */
	out.print("<script>");
	String message =null;
	String href = null;
	if(n==1){	//정상 delete 실행
		message="글삭제 되었습니다.";
		href="listAction.jsp?page="+pageNo;
	}
	else	{	//n=0 : password가 틀릴때
		message="글 비밀번호가 틀립니다.";
		href="detailAction.jsp?page="+pageNo+"&idx="+idx;
	}
	out.print("alert('"+message+"');");
	out.print("location.href='"+href+"';");
	out.print("</script>");
	
%>

<!-- 
메인글과 댓글의 참조관계(외래키)
설정되어 있을 때

: 외래키 On Delete 동작을 설정합니다.

1. 메인글 삭제 못하게 한다. - Restrict
2. 메인글과 댓글 모두 삭제한다. - Cascade
3. 메인글의 subject를 [삭제된글]로 하고 작성자, 내용은 ""없게 update한다.
4. 메인글은 삭제하고
댓글의 mref 값은 null(또는 기본값) 변경한다. - Set Null 또는 Set Default
(단, mref는 null 허용으로 한다.)



 -->

