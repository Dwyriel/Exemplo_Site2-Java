<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Nova Categoria";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if ((c = (Cliente) s.getAttribute("cliente")) != null && c.getTipo().toString().equals("Admin")) {
%>
<div class="container d-flex justify-content-center">
	<form method="post" action="<%=request.getContextPath()%>/NovaCat">
		<div class="d-flex justify-content-center mt-2 col-xl-12">
			<h2>Criar Nova Categoria</h2>
		</div>
		<div class="row mt-2">
			<!--Nome-->
			<div class="col-xl-12">
				<label for="nome">Nome: </label> <input required type="text"
					class="form-control" name="nome" maxlength="150" value="">
			</div>
		</div>
		<div class="d-flex justify-content-center row col-xl-12 mt-2">
			<input type="submit" value="Enviar" name="msgsbtbtn"
				class="mr-2 btn btn-primary"> <input type="reset"
				value="Limpar" name="resetbtn" class="ml-2 btn btn-secondary">
		</div>
	</form>
</div>
<%
	} else {
	response.sendRedirect("Index.jsp");
}
%>
<%@ include file="includes/Footer.jsp"%>