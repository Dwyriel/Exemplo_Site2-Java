package model;

import java.sql.Date;

public class Comentario {
	private int id;
	private String texto;
	private Date data_pub;
	private int conteudo_id;
	private int poster;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public Date getData_pub() {
		return data_pub;
	}
	public void setData_pub(Date data_pub) {
		this.data_pub = data_pub;
	}
	public int getConteudo_id() {
		return conteudo_id;
	}
	public void setConteudo_id(int conteudo_id) {
		this.conteudo_id = conteudo_id;
	}
	public int getPoster() {
		return poster;
	}
	public void setPoster(int poster) {
		this.poster = poster;
	}
	
}
