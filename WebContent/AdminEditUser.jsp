<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Editar Usuario";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if ((c = (Cliente) s.getAttribute("cliente")) == null || !c.getTipo().toString().equals("Admin")) {
	response.sendRedirect("Index.jsp");
} else if (request.getAttribute("iduser") != null) {
	ClienteDal cDal = new ClienteDal();
	Cliente c2 = cDal.get(Integer.parseInt(request.getAttribute("iduser").toString()));
%>
<div class="container ">
	<form method="post"
		action="<%=request.getContextPath()%>/EditarUsuario2">
		<div class="d-flex justify-content-center row mt-2 col-xl-12">
			<h1>Editar Usuario</h1>
		</div>
		<div class="row  mt-2">
			<!--name-->
			<div class="col-xl-6">
				<label for="username">Nome: </label> <input type="text"
					class="form-control" name="nome" maxlength="150" required
					value="<%=c2.getNome()%>">
			</div>
			<!--password-->
			<div class="col-xl-6">
				<label for="userpassword">Senha: </label> <input type="password"
					class="form-control" name="pw" maxlength="20" required
					value="<%=c2.getSenha()%>">
			</div>
			<!--email-->
			<div class="col-xl-12">
				<label class="mt-2" for="useremail">Email: </label> <input
					type="email" class="form-control" name="email" maxlength="150"
					required value="<%=c2.getEmail()%>">
			</div>
			<%
				String atv, atv2;
			if ( c2.getAtivo() ) {
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
			<%
				String adm, adm2;
			if ((c2.getTipo().toString()).equals("Admin")) {
				adm = "checked";
				adm2 = "";
			} else {
				adm = "";
				adm2 = "checked";
			}
			%>
			<div class="col-xl-12 d-flex justify-content-center pt-2">
				<div class="row mx-2 align-items-center">Status:</div>
				<div class="row mx-2 align-items-center">
					<input type="radio" id="admin" name="tipo" value="Admin" <%= adm %>>
					<label class="pt-1 pl-1" for="Admin">Administrador</label>
				</div>
				<div class="row mx-2 align-items-center">
					<input type="radio" id="Desativa" name="tipo" value="User" <%= adm2 %>>
					<label class="pt-1 pl-1" for="User">Usuario</label>
				</div>
			</div>
		</div>
		<div hidden="true">
			<input type="hidden" name="id" readonly value="<%=c2.getId() %>">
		</div>
		<div class="d-flex justify-content-center row col-xl-12 mt-2">
			<input type="submit" value="Enviar" name="submitbtn"
				class="mr-2 btn btn-primary"> <input type="reset"
				value="Limpar" name="resetbtn" class="ml-2 btn btn-secondary">
		</div>
	</form>
</div>
<%
	} else {
		%> <p> 123 </p> <%
		response.sendRedirect("Index.jsp");
}
%>
<%@ include file="includes/Footer.jsp"%>