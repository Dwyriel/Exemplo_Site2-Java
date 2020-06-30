<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageTitle = "Login";
%>
<%@ include file="includes/Navbar.jsp"%>
<%
	if (s.getAttribute("login") != null) {
	boolean fl = (boolean) s.getAttribute("login");
	if (fl == true) {
%>
<script>
	alert("Login invalido.")
</script>
<%
	s.setAttribute("login", false);
}
}
%>
<div class="container">
	<form method="post" action="<%=request.getContextPath()%>/Auth">
		<div class="d-flex justify-content-center row mt-4 pl-1 col-xl-12">
			<h1>Login</h1>
		</div>
		<div class="col-xl-12 d-flex justify-content-center">
			<div class="d-flex justify-content-center col-xl-4 mt-1 mr-4"
				style="flex-direction: column;">
				<!--login-->
				<div class="">
					<label for="userlogin">Email: </label> <input type="email"
						class="form-control" name="userlogin" maxlength="60" required>
				</div>
				<!--password-->
				<div class="">
					<label for="userpassword">Senha: </label> <input type="password"
						class="form-control" name="userpassword" maxlength="60" required>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center row col-xl-12 mt-3">
			<input type="submit" value="Sign in" name="submitbtn"
				class="mr-2 btn btn-primary"> <input type="reset"
				value="Limpar" name="resetbtn" class="ml-2 mr-2 btn btn-secondary">
		</div>
	</form>
</div>
<%@ include file="includes/Footer.jsp"%>