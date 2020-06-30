package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DAL.ClienteDal;
import model.*;

@WebServlet("/NovoUsuario")
public class NovoUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NovoUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cliente c = new Cliente();
		ClienteDal cDal = new ClienteDal();

		c.setEmail(request.getParameter("email"));
		c.setSenha(request.getParameter("pw"));
		c.setNome(request.getParameter("nome"));
		c.setTipo(TCliente.Usuario);
		c.setAtivo(true);
		c = cDal.insert(c);
		HttpSession session = request.getSession();
		session.setAttribute("cliente", c);
		response.sendRedirect(request.getContextPath() + "/Index.jsp");
	}

}
