package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAL.ConteudoDal;
import model.Conteudo;

/**
 * Servlet implementation class EditCon
 */
@WebServlet("/EditCon")
public class EditCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EditCon() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Conteudo c = new Conteudo();
		ConteudoDal cDal = new ConteudoDal();
		Date stuff = Date.valueOf(request.getParameter("date"));
		c.setTitulo(request.getParameter("titulo"));
		c.setCat_id(Integer.parseInt(request.getParameter("cats")));
		c.setPoster(Integer.parseInt(request.getParameter("poster")));
		c.setTexto(request.getParameter("content"));
		if (request.getParameter("drone").equals("Ativa")) {
			c.setAtivo(true);
		} else if (request.getParameter("drone").contentEquals("Desativa")) {
			c.setAtivo(false);
		}
		c.setData_pub(stuff);
		c.setId(Integer.parseInt(request.getParameter("idcontent")));
		cDal.update(c);
		response.sendRedirect(request.getContextPath() + "/ListArtigos.jsp");
	}

}
