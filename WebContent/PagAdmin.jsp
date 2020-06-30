<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Administração";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if ((c = (Cliente) s.getAttribute("cliente")) == null || !c.getTipo().toString().equals("Admin")) {
	response.sendRedirect("Index.jsp");
}
%>
<div class="container pt-5">
	<div class=" d-flex justify-content-center"
		style="flex-direction: column;">
		<div class=" d-flex justify-content-center">
			<div class="row ">
				<h1>
					<a href="<%=request.getContextPath()%>/InsCat.jsp"> <span
						class="badge badge-pill badge-secondary">Nova Categoria</span>
					</a>
				</h1>
			</div>
		</div>
		<div class=" d-flex justify-content-center">
			<div class="row">
				<h1>
					<a href="<%=request.getContextPath()%>/InsCon.jsp"> <span
						class="badge badge-pill badge-secondary">Novo Artigo</span>
					</a>
				</h1>
			</div>
		</div>
		<div class=" d-flex justify-content-center">
			<div class="row">
				<h1>
					<a href="<%=request.getContextPath()%>/ListUsers.jsp"> <span class="badge badge-pill badge-secondary">Usuarios</span>
					</a>
				</h1>
			</div>
		</div>
		<div class=" d-flex justify-content-center">
			<div class="row">
				<h1>
					<a href="<%=request.getContextPath()%>/ListArtigos.jsp"> <span class="badge badge-pill badge-secondary">Artigos</span>
					</a>
				</h1>
			</div>
		</div>
	</div>
</div>
<%@ include file="includes/Footer.jsp"%>