package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DAL.ClienteDal;
import model.*;

@WebServlet("/EditarUsuario")
public class EditarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cliente c = new Cliente();
		ClienteDal cDal = new ClienteDal();

		c.setEmail(request.getParameter("email"));
		c.setSenha(request.getParameter("pw"));
		c.setNome(request.getParameter("nome"));
		if (request.getParameter("drone").equals("Ativa")) {
			c.setAtivo(true);
		} else if (request.getParameter("drone").contentEquals("Desativa")) {
			c.setAtivo(false);
		}
		if (request.getParameter("tipo").equals("Usuario")) {
			c.setTipo(TCliente.Usuario);
		} else if (request.getParameter("tipo").equals("Admin")) {
			c.setTipo(TCliente.Admin);
		}
		c.setId(Integer.parseInt(request.getParameter("id")));
		if (cDal.update(c)) {
			HttpSession session = request.getSession();
			session.setAttribute("cliente", c);
			response.sendRedirect(request.getContextPath() + "/Index.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/Login.jsp");
		}
	}

}
