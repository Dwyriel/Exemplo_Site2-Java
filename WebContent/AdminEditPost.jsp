<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Editar Usuario";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if ((c = (Cliente) s.getAttribute("cliente")) == null || !c.getTipo().toString().equals("Admin")) {
	response.sendRedirect("Index.jsp");
} else if (request.getAttribute("idpost") != null) {
	ConteudoDal conDal = new ConteudoDal();
	Conteudo con = conDal.get(Integer.parseInt(request.getAttribute("idpost").toString()));
%>
<div class="container">
	<form method="post" action="<%=request.getContextPath()%>/EditCon">
		<div class="d-flex justify-content-center row mt-2 col-xl-12">
			<h1>Novo Artigo</h1>
		</div>
		<div class="row  mt-2">
			<!--Titulo-->
			<div class="col-xl-6">
				<label for="titulo">Titulo</label> <input type="text"
					class="form-control" name="titulo" required
					value="<%= con.getTitulo() %>">
			</div>
			<!--Categoria-->
			<%
				ArrayList<Categoria> lCat = new ArrayList<Categoria>();
			CategoriaDal cDal = new CategoriaDal();
			lCat = cDal.listAll();
			String select;
			%>
			<div class="col-xl-6">
				<label for="cats">Categoria: </label> <select
					class="form-control" id="cats" name="cats">
					<%
						for (Categoria cats : lCat) {
							if (con.getCat_id() == cats.getId()){
								select = "selected";
							} else {
								select = "";
							}
					%>
					<option value="<%=cats.getId()%>" <%= select %>><%=cats.getNome()%></option>
					<%
						}
					%>
				</select>
			</div>
			<!--Texto-->
			<div class="col-xl-12">
				<label for="content">Texto: </label>
				<textarea class="form-control" name="content" required><%= con.getTexto() %></textarea>
			</div>
			<%
				String atv, atv2;
			if ( con.isAtivo() ) {
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
					<label class="pt-1 pl-1" for="Ativa">Ativo</label>
				</div>
				<div class="row mx-2 align-items-center">
					<input type="radio" id="Desativa" name="drone" value="Desativa" <%=atv2 %>>
					<label class="pt-1 pl-1" for="Desativa">Desativo</label>
				</div>
			</div>
			<input type="hidden" name="poster" value="<%=con.getPoster()%>">
			<input type="hidden" name="idcontent" value="<%=con.getId()%>">
			<input type="hidden" name="date" value="<%= con.getData_pub() %>">
			<div class="d-flex justify-content-center row col-xl-12 mt-2">
				<input type="submit" value="Enviar" name="submitbtn"
					class="mr-2 btn btn-primary"> <input type="reset"
					value="Limpar" name="resetbtn" class="ml-2 btn btn-secondary">
			</div>
	</form>
</div>
<%
	} else {
		%>
<p>123</p>
<%
		response.sendRedirect("Index.jsp");
}
%>
<%@ include file="includes/Footer.jsp"%>