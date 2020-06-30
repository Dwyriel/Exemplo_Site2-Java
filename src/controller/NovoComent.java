package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAL.*;
import model.*;

@WebServlet("/NovoComent")
public class NovoComent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NovoComent() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Comentario coment = new Comentario();
		ComentarioDal comentDal = new ComentarioDal();
		coment.setPoster(Integer.parseInt(request.getParameter("user")));
		coment.setTexto(request.getParameter("comment"));
		coment.setConteudo_id(Integer.parseInt(request.getParameter("content")));
		coment = comentDal.insert(coment);
		response.sendRedirect(request.getContextPath() + "/PagCont?id=" + coment.getConteudo_id());
	}

}
