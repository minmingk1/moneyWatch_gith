<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>

  	
      <h2>이번 달 나의 지출/수입</h2>
      <h5>${today}</h5><br /><br />
      <div class="fakeimg" style="height:60%;">
      <h5>지출 : 
      <fmt:formatNumber value="${thisOut}" pattern="#,###" /> 원</h5>
      <h5>수입 : 
      <fmt:formatNumber value="${thisIn}" pattern="#,###" /> 원</h5>
      </div>
      <p>Some text..</p>
      <h7>잔액</h7>
      <br>