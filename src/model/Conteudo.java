package model;

import java.sql.Date;

public class Conteudo {
	private int id;
	private String titulo;
	private String texto;
	private Date data_pub;
	private boolean ativo;
	private int cat_id;
	private int poster;

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
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

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public int getPoster() {
		return poster;
	}

	public void setPoster(int poster) {
		this.poster = poster;
	}

}
