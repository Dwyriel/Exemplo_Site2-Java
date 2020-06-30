<%@ page import="javax.servlet.http.*,model.*, DAL.*,java.util.ArrayList"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- Change later \/ -->
<link rel="stylesheet" href="../background.css">

<title><%=pageTitle%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body class="" style="background-color: rgb(222, 255, 255)">
	<nav class="navbar navbar-expand-lg navbar-light mb-2"
		style="background-color: rgba(95, 95, 95, 0.85)">
		<div class="container">
			<a class="navbar-brand btn btn-outline-dark border-0"
				href="<%=request.getContextPath()%>/Index.jsp"><img
				style="width: 4rem" src="img/senac_logo_branco.png" alt="Senac"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExample07" aria-controls="navbarsExample07"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarsExample07">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a
						class="nav-link btn btn-outline-light mr-2 border-0"
						href="<%=request.getContextPath()%>/Index.jsp">Home </a></li>
					<li class="nav-item active"><a
						class="nav-link btn btn-outline-light mx-2 border-0" href="<%=request.getContextPath()%>/AllPosts.jsp">Posts</a></li>
				</ul>
				<ul class="navbar-nav">
					<%
						HttpSession s = request.getSession();
					Cliente c;
					if ((c = (Cliente) s.getAttribute("cliente")) != null) {
					%>
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle btn btn-outline-light mx-2 border-0"
						href="#" id="dropdown07" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"><%=c.getNome()%></a>
						<div class="dropdown-menu" aria-labelledby="dropdown07">
							<%
								if (c.getTipo().toString().equals("Admin")) {
							%>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/PagAdmin.jsp">Administração</a>
							<%
								}
							%>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/EditarConta.jsp">Editar
								conta</a> <a class="dropdown-item" href="Logout">Log out</a>
						</div></li>
					<%
						} else {
					%>
					<li class="nav-item active"><a
						class="nav-link btn btn-outline-light mx-2 border-0"
						href="<%=request.getContextPath()%>/Login.jsp">Log in</a></li>
					<li class="nav-item active"><a
						class="nav-link btn btn-outline-light mx-2 border-0"
						href="<%=request.getContextPath()%>/NovaConta.jsp">Nova conta</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>