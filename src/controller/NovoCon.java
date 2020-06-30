package controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAL.*;
import model.*;

@WebServlet("/NovoCon")
public class NovoCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NovoCon() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Conteudo c = new Conteudo();
		ConteudoDal cDal = new ConteudoDal();
		long timenow = System.currentTimeMillis();
		Date stuff = new Date(timenow);
		c.setTitulo(request.getParameter("titulo"));
		c.setCat_id(Integer.parseInt(request.getParameter("cats")));
		c.setPoster(Integer.parseInt(request.getParameter("poster")));
		c.setTexto(request.getParameter("content"));
		c.setAtivo(true);
		c.setData_pub(stuff);
		c = cDal.insert(c);
		response.sendRedirect(request.getContextPath() + "/Index.jsp");
	}

}
