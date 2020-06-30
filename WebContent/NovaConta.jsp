<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Novo Usuario";
%>
<%@ include file="includes/Navbar.jsp"%>
<div class="container ">
	<form method="post" action="<%=request.getContextPath()%>/NovoUsuario">
		<div class="d-flex justify-content-center row mt-2 col-xl-12">
			<h1>Novo Usuario</h1>
		</div>
		<div class="row  mt-2">
			<!--name-->
			<div class="col-xl-6">
				<label for="username">Nome: </label> <input type="text"
					class="form-control" name="nome" maxlength="150" required>
			</div>
			<!--password-->
			<div class="col-xl-6">
				<label for="userpassword">Senha: </label> <input type="password"
					class="form-control" name="pw" maxlength="20" required>
			</div>
			<!--email-->
			<div class="col-xl-12">
				<label for="useremail">Email: </label> <input type="email"
					class="form-control" name="email" maxlength="150" required>
			</div>
		</div>
		<div class="d-flex justify-content-center row col-xl-12 mt-2">
			<input type="submit" value="Enviar" name="submitbtn"
				class="mr-2 btn btn-primary"> <input type="reset"
				value="Limpar" name="resetbtn" class="ml-2 btn btn-secondary">
		</div>
	</form>
</div>
<%@ include file="includes/Footer.jsp"%>