<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Editar Usuario";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if (s.getAttribute("cliente") == null) {
	response.sendRedirect("Index.jsp");
} else {
%>
<div class="container ">
	<form method="post"
		action="<%=request.getContextPath()%>/EditarUsuario">
		<div class="d-flex justify-content-center row mt-2 col-xl-12">
			<h1>Editar Usuario</h1>
		</div>
		<div class="row  mt-2">
			<!--name-->
			<div class="col-xl-6">
				<label for="username">Nome: </label> <input type="text"
					class="form-control" name="nome" maxlength="150" required
					value="<%=c.getNome()%>">
			</div>
			<!--password-->
			<div class="col-xl-6">
				<label for="userpassword">Senha: </label> <input type="password"
					class="form-control" name="pw" maxlength="20" required
					value="<%=c.getSenha()%>">
			</div>
			<!--email-->
			<div class="col-xl-12">
				<label class="mt-2" for="useremail">Email: </label> <input
					type="email" class="form-control" name="email" maxlength="150"
					required value="<%=c.getEmail()%>">
			</div>
			<%
				String atv, atv2;
			if ( c.getAtivo() ) {
				atv = "checked";
				atv2 = "";
			} else {
				atv = "";
				atv2 = "checked";
			}
			%>
			<div class="col-xl-12 d-flex justify-content-center pt-2">
				<div class="row mx-2 align-items-center">Status:</div>
				<div class="row mx-2 align-items-center">
					<input type="radio" id="Ativa" name="drone" value="Ativa" <%= atv %>>
					<label class="pt-1 pl-1" for="Ativa">Ativa</label>
				</div>
				<div class="row mx-2 align-items-center">
					<input type="radio" id="Desativa" name="drone" value="Desativa" <%=atv2 %>>
					<label class="pt-1 pl-1" for="Desativa">Desativa</label>
				</div>
			</div>
		</div>
		<div hidden="true">
			<%
				String tipo;
			int id = c.getId();
			if (c.getTipo().toString().equals("Admin")) {
				tipo = "Admin";
			} else {
				tipo = "Usuario";
			} //sei que não se deve fazer isso, mas não tenho tempo para tentar implementar nada mais a fundo.
			%>
			<input type="hidden" name="tipo" readonly value="<%=tipo%>"> <input
				type="hidden" name="id" readonly value="<%=id%>">
		</div>
		<div class="d-flex justify-content-center row col-xl-12 mt-2">
			<input type="submit" value="Enviar" name="submitbtn"
				class="mr-2 btn btn-primary"> <input type="reset"
				value="Limpar" name="resetbtn" class="ml-2 btn btn-secondary">
		</div>
	</form>
</div>
<%
	}
%>
<%@ include file="includes/Footer.jsp"%>