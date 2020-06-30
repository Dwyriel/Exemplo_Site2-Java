package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAL.CategoriaDal;
import model.*;

/**
 * Servlet implementation class NovaCat
 */
@WebServlet("/NovaCat")
public class NovaCat extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NovaCat() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Categoria c = new Categoria();
		CategoriaDal cDal = new CategoriaDal();

		c.setNome(request.getParameter("nome"));
		c.setAtivo(true);
		c = cDal.insert(c);
		response.sendRedirect(request.getContextPath() + "/PagAdmin.jsp");
	}

}
