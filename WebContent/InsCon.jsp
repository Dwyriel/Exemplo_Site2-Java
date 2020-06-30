<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Novo Artigo";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if ((c = (Cliente) s.getAttribute("cliente")) != null && c.getTipo().toString().equals("Admin")) {
%>
<div class="container">
	<form method="post" action="<%=request.getContextPath()%>/NovoCon">
		<div class="d-flex justify-content-center row mt-2 col-xl-12">
			<h1>Novo Artigo</h1>
		</div>
		<div class="row  mt-2">
			<!--Titulo-->
			<div class="col-xl-6">
				<label for="titulo">Titulo</label> <input type="text"
					class="form-control" name="titulo" required>
			</div>
			<!--Categoria-->
			<%
				ArrayList<Categoria> lCat = new ArrayList<Categoria>();
			CategoriaDal cDal = new CategoriaDal();
			lCat = cDal.listAll();
			%>
			<div class="col-xl-6">
				<label for="cats">Categoria: </label> <select
					class="form-control" id="cats" name="cats">
					<%
						for (Categoria cats : lCat) {
					%>
					<option value="<%=cats.getId()%>"><%=cats.getNome()%></option>
					<%
						}
					%>
				</select>
			</div>
			<!--Texto-->
			<div class="col-xl-12">
				<label for="content">Texto: </label>
				<textarea class="form-control" name="content" required></textarea>
			</div>
			<input type="hidden" name="poster" value="<%=c.getId()%>">
			<div class="d-flex justify-content-center row col-xl-12 mt-2">
				<input type="submit" value="Enviar" name="submitbtn"
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