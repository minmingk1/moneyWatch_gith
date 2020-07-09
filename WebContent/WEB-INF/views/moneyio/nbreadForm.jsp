<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<table border="0" style="align:center; text-align:center;" width="30%" id="n_people">

<c:forEach var="n" begin="1" end="${nPeople}" step="1">
	<tr>
			<td><label for="text">이름</label></td>
			<td><input type="text" class="form-control" name="n_debtor"/>
			<td><label for="text">N빵 금액</label></td>
			<td><input type="text" class="form-control" name="n_price"/>
	</tr>
</c:forEach>

</table>




