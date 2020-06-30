<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Artigos";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if ((c = (Cliente) s.getAttribute("cliente")) == null || !c.getTipo().toString().equals("Admin")) {
	response.sendRedirect("Index.jsp");
}
%>
<div class="container">
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<h6 class="border-bottom border-gray pb-2 mb-0">Artigos:</h6>
		<%
			ConteudoDal conDal = new ConteudoDal();
		ArrayList<Conteudo> lCon = conDal.listAll();
		for (Conteudo con : lCon){
			ClienteDal cDal = new ClienteDal();
			Cliente c2 = cDal.get(con.getPoster());
			CategoriaDal catDal = new CategoriaDal();
			Categoria cat = catDal.get(con.getCat_id());
		%>
		<div class="media text-muted pt-3 position-relative border-bottom border-gray">
			<p
				class="media-body pb-3 mb-0 small ">
				<strong class="d-block text-gray-dark"> <%= con.getTitulo() %> </strong> <%= c2.getNome() %> <br><a
					href="<%=request.getContextPath()%>/AdmPostAlt?idp=<%=con.getId() %>" class="stretched-link">Editar</a>
			</p>
			<div><p class="small" style="float: right;"><%= con.getData_pub() %></p><br>
			<p class="small" style="float: right;">  <%= cat.getNome() %></p>
			</div>
		</div>
	<%}%>
	</div>
</div>
<%@ include file="includes/Footer.jsp"%>