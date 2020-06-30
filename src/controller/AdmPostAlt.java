package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdmPostAlt")
public class AdmPostAlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdmPostAlt() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("idp"));
		request.setAttribute("idpost", id);
		response.setContentType( "text/html; charset=utf-8" );
    	request.getRequestDispatcher("AdminEditPost.jsp").include(request, response);
	}

}
