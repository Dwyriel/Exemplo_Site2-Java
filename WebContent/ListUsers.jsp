<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Usuarios";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if ((c = (Cliente) s.getAttribute("cliente")) == null || !c.getTipo().toString().equals("Admin")) {
	response.sendRedirect("Index.jsp");
}
%>
<div class="container">
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<h6 class="border-bottom border-gray pb-2 mb-0">Usuarios:</h6>
		<%
			ClienteDal cDal = new ClienteDal();
		ArrayList<Cliente> lC = cDal.listAll();
		if (lC.isEmpty()) {
		%>
		<div
			class="media text-muted pt-3 position-relative border-bottom border-gray">
			<p class="media-body pb-3 mb-0 small">Nenhum usuario encontrado.
			</p>
		</div>
		<%
			} else {
			for (Cliente c2 : lC) {
		%>
		<div
			class="media text-muted pt-3 position-relative border-bottom border-gray">
			<p class="media-body pb-3 mb-0 small">
				<strong class="d-block text-gray-dark"><%=c2.getNome()%>
				</strong>
				<%=c2.getEmail()%>
			</p>
			<div class="">
				<p class="small text-right" >
					Tipo:
					<%=c2.getTipo()%>
					<a href="<%=request.getContextPath()%>/AdmUserAlt?idc=<%= c2.getId() %> " class="d-block stretched-link">Editar</a>
				</p>
			</div>
		</div>
		<%
			}
		}
		%>
	</div>
</div>
<%@ include file="includes/Footer.jsp"%>