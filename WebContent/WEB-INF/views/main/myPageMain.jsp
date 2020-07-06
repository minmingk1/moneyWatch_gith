<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
  
      <h2>이번 달 나의 지출/수입</h2>
      <h5>July 7, 2020</h5><br />
      <div class="fakeimg" style="height:60%;">
      <h5>지출 : 
      <fmt:formatNumber value="${thisOut}" pattern="#,###" /> 원</h5>
      <h5>수입 : 
      <fmt:formatNumber value="${thisIn}" pattern="#,###" /> 원</h5>
      </div>
      <p>Some text..</p>
      <h7>잔액</h7>
      <br>