<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="frmPaging" action="/ask/ask_list">
	<input type="hidden" name=page value="${pagingDto.page}">
	<input type="hidden" name=perPage value="${pagingDto.perPage}">
	<input type="hidden" name=searchType>
	<input type="hidden" name=keyword>
</form>