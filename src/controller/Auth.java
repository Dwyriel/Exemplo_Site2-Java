package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DAL.ClienteDal;
import model.*;

@WebServlet("/Auth")
public class Auth extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Auth() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cliente c = new Cliente();
		ClienteDal cDal = new ClienteDal();
		boolean fl;
		c.setEmail(request.getParameter("userlogin"));
		c.setSenha(request.getParameter("userpassword"));
		c = cDal.autenticacao(c);
		HttpSession session = request.getSession();
		if (c != null) {
			fl = false;
			session.setAttribute("cliente", c);
			session.setAttribute("login", fl);
			response.sendRedirect(request.getContextPath() + "/Index.jsp");
		} else {
			fl = true;
			session.setAttribute("login", fl);
			response.sendRedirect(request.getContextPath() + "/Login.jsp");
		}
	}

}
