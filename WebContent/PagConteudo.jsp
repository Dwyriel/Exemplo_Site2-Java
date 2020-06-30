<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getAttribute("idcont") != null) {
	ConteudoDal conDal = new ConteudoDal();
	ClienteDal cDal = new ClienteDal();
	Conteudo con = new Conteudo();
	con.setId(Integer.parseInt(request.getAttribute("idcont").toString()));
	con = conDal.get(con.getId());
	if (con.getTitulo() != null) {
		String pageTitle = con.getTitulo();
%>
<%@ include file="includes/Navbar.jsp"%>

<div class="container bg-white rounded shadow-sm pb-2 mb-5"
	style="text-align: justify;">
	<%
		Cliente c2 = cDal.get(con.getPoster());
	%>
	<div class="d-flex justify-content-center row my-1 col-xl-12">
		<h2 class="mt-3"><%=con.getTitulo()%></h2>
	</div>

	<%
		String[] breaks = con.getTexto().split("\\r?\\n");
	for (String lines : breaks) {
	%>
	<p>
		<%=lines%>
	</p>
	<%
		}
	%>
	<p class="small text-right ">
		Data de publicação:
		<%=con.getData_pub()%></p>
	<p class="small text-right mt-n1 border-bottom border-gray pb-4">
		Autor:
		<%=c2.getNome()%></p>

	<h6 class="border-bottom border-gray pb-3 mb-0">Comentarios:</h6>
	<%
		ComentarioDal comDal = new ComentarioDal();
	ArrayList<Comentario> lCom = comDal.listAll(con.getId());
	for (Comentario coment : lCom) {
		Cliente c3 = cDal.get(coment.getPoster());
	%>
	<div class="media text-muted py-3 border-bottom border-gray row">
		<div class="col-12">
			<span> <strong class="text-gray-dark"> <%=c3.getNome()%>
			</strong> escreveu:
			</span> <span class="small float-right"> <%=coment.getData_pub()%></span>
		</div>

		<div class="mx-3 col-12">
			<%
				String[] breakc = coment.getTexto().split("\\r?\\n");
			for (String linec : breakc) {
			%>
			<p class="pr-4"><%=linec%></p>
			<%
				}
			%>
		</div>
	</div>

	<%
		}
	if ((c = (Cliente) s.getAttribute("cliente")) != null) {
	%>
	<div class="pb-2">
		<form method="post" action="<%=request.getContextPath()%>/NovoComent">
			<div class="col-12 my-2 pb-2">
				<!--Ususario-->
				<input required type="hidden" name="user" maxlength="150"
					value="<%=c.getId() %>">
				<!--Conteudo-->
				<input required type="hidden" name="content" maxlength="150"
					value="<%=con.getId()%>">
				<!--Texto-->
				<div class="col-xl-12">
					<label for="txt">Novo comentario: </label>
					<textarea required class="form-control" name="comment"></textarea>
				</div>
			</div>
			<div class="d-flex justify-content-center row col-xl-12 mt-2">
				<input type="submit" value="Enviar" name="msgsbtbtn"
					class="mr-2 btn btn-primary"> <input type="reset"
					value="Limpar" name="resetbtn" class="ml-2 btn btn-secondary">
			</div>
		</form>
	</div>
</div>
<%
	}
} else {
	response.sendRedirect(request.getContextPath() + "/Index.jsp"); // not working for some reason
}
} else {
	response.sendRedirect(request.getContextPath() + "/AllPosts.jsp");
}
%>
<%@ include file="includes/Footer.jsp"%>