package DAL;

import java.sql.*;
import java.util.ArrayList;
import model.*;

public class ConteudoDal extends Connect {
	public ConteudoDal() {
		super();
	}

	public Conteudo insert(Conteudo con) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("INSERT INTO Conteudo VALUES(null, ?, ?, ?, ?, ?, ?)",
					Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, con.getTitulo());
			stmt.setDate(2, con.getData_pub());
			stmt.setString(3, con.getTexto());
			stmt.setBoolean(4, con.isAtivo());
			stmt.setInt(5, con.getCat_id());
			stmt.setInt(6, con.getPoster());
			stmt.executeUpdate();

			ResultSet id = stmt.getGeneratedKeys();
			if (id.next())
				con.setId(id.getInt(1));

			return con;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}

	public boolean update(Conteudo con) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement(
					"UPDATE Conteudo SET titulo = ?, data_pub = ?, texto = ?, ativo = ?, categoria_id = ?, usuario_id = ? WHERE id = ?");
			stmt.setString(1, con.getTitulo());
			stmt.setDate(2, con.getData_pub());
			stmt.setString(3, con.getTexto());
			stmt.setBoolean(4, con.isAtivo());
			stmt.setInt(5, con.getCat_id());
			stmt.setInt(6, con.getPoster());
			stmt.setInt(7, con.getId());

			stmt.executeUpdate();

			return true;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		} finally {
			super.fechar();
		}
	}

	public boolean delete(int id) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("DELETE FROM Conteudo WHERE id = ?");
			stmt.setInt(1, id);

			stmt.executeUpdate();

			return true;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		} finally {
			super.fechar();
		}
	}

	public Conteudo get(int id) {
		try {
			Conteudo c = new Conteudo();
			super.abrir();
			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM Conteudo WHERE id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				c.setId(rs.getInt("id"));
				c.setTitulo(rs.getString("titulo"));
				c.setAtivo(rs.getBoolean("ativo"));
				c.setData_pub(rs.getDate("data_pub"));
				c.setTexto(rs.getString("texto"));
				c.setCat_id(rs.getInt("categoria_id"));
				c.setPoster(rs.getInt("usuario_id"));
			}
			return c;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}
	
	public ArrayList<Conteudo> listAll() {
		try {
			ArrayList<Conteudo> cl = new ArrayList<Conteudo>();

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM Conteudo ORDER BY data_pub DESC");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Conteudo c = new Conteudo();
				c.setId(rs.getInt("id"));
				c.setTitulo(rs.getString("titulo"));
				c.setAtivo(rs.getBoolean("ativo"));
				c.setData_pub(rs.getDate("data_pub"));
				c.setTexto(rs.getString("texto"));
				c.setCat_id(rs.getInt("categoria_id"));
				c.setPoster(rs.getInt("usuario_id"));
				cl.add(c);
			}

			return cl;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}
	public ArrayList<Conteudo> listAll(int id) {
		try {
			ArrayList<Conteudo> cl = new ArrayList<Conteudo>();

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM Conteudo WHERE categoria_id = ? ORDER BY data_pub DESC");
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Conteudo c = new Conteudo();
				c.setId(rs.getInt("id"));
				c.setTitulo(rs.getString("titulo"));
				c.setAtivo(rs.getBoolean("ativo"));
				c.setData_pub(rs.getDate("data_pub"));
				c.setTexto(rs.getString("texto"));
				c.setCat_id(rs.getInt("categoria_id"));
				c.setPoster(rs.getInt("usuario_id"));
				cl.add(c);
			}

			return cl;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}
	public ArrayList<Conteudo> listAllLimit(int limit) {
		try {
			ArrayList<Conteudo> cl = new ArrayList<Conteudo>();

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM Conteudo ORDER BY data_pub DESC LIMIT ?");
			stmt.setInt(1, limit);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Conteudo c = new Conteudo();
				c.setId(rs.getInt("id"));
				c.setTitulo(rs.getString("titulo"));
				c.setAtivo(rs.getBoolean("ativo"));
				c.setData_pub(rs.getDate("data_pub"));
				c.setTexto(rs.getString("texto"));
				c.setCat_id(rs.getInt("categoria_id"));
				c.setPoster(rs.getInt("usuario_id"));
				cl.add(c);
			}

			return cl;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}
}
