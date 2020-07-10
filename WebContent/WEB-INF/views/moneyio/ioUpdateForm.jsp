<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입출력 내역 수정하기</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var n_all;
		function N_divFunction() {
			var checkBox = document.getElementById("customSwitch1");
			var text = document.getElementById("io_N_div");
			var n_bread = document.getElementById("n_bread");

			if (checkBox.checked == true) {
				text.style.display = "block";
				n_bread.style.display="block";
				
			} else {
				text.style.display = "none";
				n_bread.style.display="none";
				n_people.style.display="none";
				document.getElementById("io_N_div").value = "0";	
				document.getElementById("n_people").value = "0";	
			}
			
					
		}
		
		function n_button(){
			/* var n_div = document.getElementById("io_N_div").value; */
			n_people.style.display="block";
			$.ajax({
				url : "nbreadForm.mw",
				data : {nPeople: $("#io_N_div").val()},
				success : function(data){
					$("#n_people").html(data);
				}
			});			
		}
		
		jQuery(document).ready(function($){
			$('#io_price').on('focus', function(){
				var val = $('#io_price').val();
				if(!isEmpty(val)){
					val = val.replace(/,/g,'');
					$('#io_price').val(val);
				}
			});
			
			$('#io_price').on('blur', function(){
				var val = $('#io_price').val();
				if(!isEmpty(val) && isNumeric(val)){
					val = currencyFormatter(val);
					$('#io_price').val(val);
				}
			});
		}); 
		
		//Null check
		function isEmpty(value){
			if(value.length ==0 || value==null){
				return true;
			}else{
				return false;
			}
		}
		//정규식 표현식으로 숫자 값 여부 체크
		function isNumeric(value){
			var regExp = /^[0-9]+$/g;
			return regExp.test(value);
		}
		//숫자 세자리 마다 콤마를 추가하여 금액 표기 형태로 변환
		function currencyFormatter(amount){
			return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
		}

	</script>
<body><br/><br/>
	<form action="/moneyWatch/ioUpdatePro.mw" >


	<div class="form-group">
		<h3 style="text-align:center;">수입/지출 내역 수정하기</h3><br/>
		<input type="hidden" name="id" value="${memId}"/>
		<input type="hidden" name="io_num" value="${dto.io_num}" />
		<table border="1" align="center" width="60%">
				<tr>
						<td><label for="Select">&nbsp&nbsp&nbsp&nbsp카테고리</label></td>
						<td><select class="form-control" name="io_category">
								<option value="none">--선택--</option>
								<option value="카페/간식">카페/간식</option>
								<option value="교통비">교통비</option>
								<option value="생활비">생활비</option>
								<option value="교육">교육</option>
								<option value="쇼핑">쇼핑</option>
								<option value="유흥비">유흥비</option>
								<option value="n빵비">n빵비</option>
								<option value="식비">식비</option>
								<option value="미용">미용</option>
								<option value="교육">교육</option>
								<option value="급여">급여</option>
								<option value="의료/건강">의료/건강</option>
								<option value="주거/통신">주거/통신</option>
								<option value="취미/여가">취미/여가</option>
								<option value="여행">여행</option>
								<option value="용돈">용돈</option>
								<option value="국가장학금">국가장학금</option>
								<option value="보험/세금">보험/세금</option>
								<option value="기부/후원">기부/후원</option>
								<option value="저축/투자">저축/투자</option>
								<option value="국비지원 교육비">국비지원 교육비</option>
								<option value="예금이자">예금이자</option>
								<option value="기타">기타</option>
						</select></td>
						<td><label for="moneyioChoice">&nbsp;&nbsp;&nbsp;&nbsp;수입/지출
								선택</label></td>
						<td>
							<div class="custom-control custom-radio">
								<input type="hidden" name="io_old_set" value="${dto.io_set}" />
								<input type="radio" id="customRadio1" name="io_set" value=1 class="custom-control-input" checked> &nbsp;&nbsp;
								<label class="custom-control-label" for="customRadio1">&nbsp;&nbsp;지출</label>
							</div>
						</td>	
						<td>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio2" name="io_set" value=0
									class="custom-control-input"> &nbsp;&nbsp;<label
									class="custom-control-label" for="customRadio2">&nbsp;&nbsp;수입</label>
							</div>
						</td>
				</tr>
				<tr>
						<td><label for="exampleSelect1">&nbsp;&nbsp;&nbsp;&nbsp;대상(은행/카드)</label></td>
						<td><input type="text" class="form-control" name="io_bank" value="${dto.io_bank}" readOnly/> </td>
						<td><label for="exampleSelect1">&nbsp;&nbsp;&nbsp;&nbsp;거래번호(계좌/카드번호)</label></td>
						<td colspan="2"><input type="text" class="form-control" name="io_account" value="${dto.io_account}" readOnly/></td>	
				</tr>
				<tr>
						<td><label for="money">&nbsp;&nbsp;&nbsp;&nbsp;거래 금액</label></td>
						<td>
							<fmt:setLocale value="ko"/>
							<%-- <fmt:formatNumber type="text" value="${dto.io_price}" pattern="#,###" var="io_price"/> --%>
							<input type = "hidden" name="io_old_price" value="${dto.io_price}" />
							<input type="text" class="form-control" name="io_price" value="${dto.io_price}" /></td>
						<td><label for="text">&nbsp;&nbsp;&nbsp;&nbsp;거래 잔액</label></td>
						<td colspan="2">
							<fmt:setLocale value="ko"/>
							<fmt:formatNumber type="text" value="${balance}" pattern="#,###" var="b"/>
						<input type="hidden" name="io_remain" value="${balance}" />		 			
						<input type="text" class="form-control" placeholder="${b}" disabled></td>
				</tr>
				<tr>
						<td><label for="exampleTextarea">&nbsp;&nbsp;&nbsp;&nbsp;세부내역</label></td>
						<td colspan="1"><textarea class="form-control" name="io_detail" rows="3" >${dto.io_detail}</textarea></td>
						<td><label for="text">&nbsp;&nbsp;&nbsp;&nbsp;날짜</label>
							<input type="date" class="form-control" name="io_reg_date" value="${dto.io_reg_date}"></td>
						<td colspan="2"><div class="custom-control custom-switch">
						<input type="checkbox" class="custom-control-input" id="customSwitch1" value="${dto.io_N_div}" onclick="N_divFunction()" />
						&nbsp;&nbsp;
						<label class="custom-control-label" for="customSwitch1">&nbsp;&nbsp;N빵 Check</label> </td>
				</tr>

				<tr>
			</table><br/>
			<input type="submit" value="수정하기" class="btn btn-primary" style="float:right; margin-right:20%;" /> 
			</div>
		<br /><br />
	
		<div id="n_bread" style="text-align:center;display: none;">
		<h5 >N빵 상세 내역 기입하기</h5><br />
		<table border="1" align="center" width="40%">
		<tr>
		<td align="center"><label for="text">인원</label></td>
		<td><input type="text" id="io_N_div" name="io_N_div" value="0" style="display: none" placeholder="N빵 인원"></td>
		<td><button type="button" class="btn btn-primary" OnClick="n_button()">Click</button></td>
		</tr>
		</table>
		</div>
		
		<br />
		<div class="form-group">
			<table border="0" align="center" width="50%" id="n_people">

			</table>
		</div>
	</form>
	
</body>
<%@ include file = "/WEB-INF/views/main/footer.jsp" %>
</html>