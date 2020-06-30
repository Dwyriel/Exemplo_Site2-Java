<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Index";
%>
<%@ include file="includes/Navbar.jsp"%>
<div class="container">
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<h2 class="border-bottom border-gray pb-2 mb-0" style="font-size: 2.2rem"><strong>Categorias:</strong></h2>
		<%
			CategoriaDal catDal = new CategoriaDal();
		ArrayList<Categoria> lCat = catDal.listAll();
		for (Categoria cat : lCat){
		%>
		<div class="media text-muted pt-3 position-relative border-bottom border-gray">
			<p
				class="media-body pb-3 mb-0 small lh-125 ">
				<strong class="d-block text-gray-dark" style="font-size: 1.5rem"> <%= cat.getNome() %> </strong>
			</p>
			<p class="small" style="float: right;"><a
					href="<%=request.getContextPath()%>/FiltroCat?cat=<%=cat.getId() %>" class="stretched-link"></a></p>
			
		</div>
	<%}%>
	</div>
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<h6 class="border-bottom border-gray pb-2 mb-0">Posts Recentes:</h6>
		<%
			ConteudoDal conDal = new ConteudoDal();
		ArrayList<Conteudo> lCon = conDal.listAllLimit(5);
		for (Conteudo con : lCon){
			ClienteDal cDal = new ClienteDal();
			Cliente c2 = cDal.get(con.getPoster());
			CategoriaDal catDal2 = new CategoriaDal();
			Categoria cat = catDal2.get(con.getCat_id());
		%>
		<div class="media text-muted pt-3 position-relative border-bottom border-gray">
			<p
				class="media-body pb-3 mb-0 small lh-125 ">
				<strong class="d-block text-gray-dark"> <%= con.getTitulo() %> </strong> <%= c2.getNome() %> <br><a
					href="<%=request.getContextPath()%>/PagCont?id=<%=con.getId() %>" class="stretched-link">Continuar lendo.</a>
			</p>
			<div><p class="small" style="float: right;"><%= con.getData_pub() %></p><br>
			<p class="small" style="float: right;">  <%= cat.getNome() %></p>
			</div>
		</div>
	<%}%>
	</div>
</div>
<%@ include file="includes/Footer.jsp"%>