<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script>
	function deleteConfirm(io_num){
		if(confirm("해당 내역을 삭제하시겠습니까?")){
			location.href='/moneyWatch/ioDeletePro.mw?io_num='+io_num;
		}else{
			return;
		}
	}
</script>

<table border="1" width=100%>
	<tr>
		<td width="100" align="center">
			${dto.io_category}
		</td>
		<td width="300" align="center" colspan="3">
			${dto.io_detail}
		</td>
		<td width="100" align="center">
			<c:if test="${dto.io_set==1}">
				지출
			</c:if>
			<c:if test="${dto.io_set==0}">
				수입
			</c:if>
		</td>
	</tr>
	<tr>
		<td width="300" align="center" colspan="3">
			${dto.io_bank}
		</td>
		<td width="200" align="center" colspan="2">
			<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#myModal" 
				<%-- onclick="window.open('/moneyWatch/nbreadList?ioNum=${dto.io_num}')" --%>>
	    		N빵 내역
	  		</button>		
		</td>
	</tr>
	<tr>
		<td width="300" align="center" colspan="3">
			${dto.io_account}
		</td>
		<td width="100" align="center">
			<button class="btn btn-outline-danger" onclick="window.location.href='/moneyWatch/ioUpdateForm.mw?ioNum=${dto.io_num}&id=${dto.id}&account_num=${dto.io_account}'">수정</button>
		</td>	
		<td width="100" align="center">
			<button class="btn btn-outline-danger" onclick="deleteConfirm(${dto.io_num})">삭제</button>
		</td>
	</tr>
</table>


<!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">N빵 리스트</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
	    	<div class="form-group">
		    	<label class="control-label">카테고리  [${category}]</label>
		    	<div class="form-group">
		    	<div class="input-group mb-3">
		    	<table>
		    	<c:forEach items="${nlist}" var="n">
			    	<c:if test="${n.n_num <= 0}">
			    		<tr>
			    		<td style="color:red;">${n.n_check}</td>
			    		</tr>
			    	</c:if>
			    	
			    	<c:if test="${n.n_num > 0}">
			    	<tr>
			 			<td>
					        <div class="input-group-prepend">
					        	<span class="input-group-text">이름</span>
					      	</div>
					      	</td>
					      	<td>
					     
				      	<input type="text" class="form-control" value="${n.n_debtor}"aria-label="Amount (to the nearest dollar)" disabled />
				      	</td>
				      	<td>
					      	<div class="input-group-prepend">
					       	 	<span class="input-group-text">금액</span>
					      	</div></td>
					    <td>
					    	<fmt:setLocale value="ko"/>
					    	<fmt:formatNumber type="text" value="${n.n_price}" pattern="#,###" var="n_price"/>
					      	<input type="text" class="form-control" pattern="#,###" value="${n_price}" aria-label="Amount (to the nearest dollar)" disabled /> 
					    </td>
				    </tr>
					
			    </c:forEach>
			    
			    	<tr>
				    	<td colspan="3"></td>
				    	<th style="text-align:right;">합계 :
				    	
				    	<fmt:setLocale value="ko"/>
				    	<fmt:formatNumber type="text" value="${nSum}" pattern="#,###"/>	 
				    	</th>
				    </tr>
				    </c:if>
			    </table>
			    </div>
		   		</div>
	  		 </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>