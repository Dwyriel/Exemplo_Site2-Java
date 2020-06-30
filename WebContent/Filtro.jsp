<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getAttribute("catid") != null) {
	CategoriaDal categDal = new CategoriaDal();
	Categoria categ = categDal.get(Integer.parseInt(request.getAttribute("catid").toString()));
	String pageTitle = categ.getNome();
%>
<%@ include file="includes/Navbar.jsp"%>

<div class="container">
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<h6 class="border-bottom border-gray pb-2 mb-0">
			Posts Recentes -
			<%=categ.getNome()%>:
		</h6>
		<%
			ConteudoDal conDal = new ConteudoDal();
		ArrayList<Conteudo> lCon = conDal.listAll(Integer.parseInt(request.getAttribute("catid").toString()));
		if (lCon.isEmpty()) {
		%><div
			class="media text-muted pt-3 position-relative border-bottom border-gray">
			<p class="media-body pb-3 mb-0 small lh-125 ">Nenhum artigo
				encontrado.</p>
		</div>
		<%
			} else {
			for (Conteudo con : lCon) {
				ClienteDal cDal = new ClienteDal();
				Cliente c2 = cDal.get(con.getPoster());
				CategoriaDal catDal = new CategoriaDal();
				Categoria cat = catDal.get(con.getCat_id());
		%>
		<div
			class="media text-muted pt-3 position-relative border-bottom border-gray">
			<p class="media-body pb-3 mb-0 small lh-125 ">
				<strong class="d-block text-gray-dark"> <%=con.getTitulo()%>
				</strong>
				<%=c2.getNome()%>
				<br> <a
					href="<%=request.getContextPath()%>/PagCont?id=<%=con.getId()%>"
					class="stretched-link">Continuar lendo.</a>
			</p>
			<div>
				<p class="small" style="float: right;"><%=con.getData_pub()%></p>
				<br>
				<p class="small" style="float: right;">
					<%=cat.getNome()%></p>
			</div>
		</div>
		<%
			}
		}
		%>
	</div>
</div>
<%
	} else {
	response.sendRedirect(request.getContextPath() + "/Index.jsp");
}
%>
<%@ include file="includes/Footer.jsp"%>

