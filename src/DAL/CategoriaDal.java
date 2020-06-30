package DAL;

import java.sql.*;
import java.util.ArrayList;
import model.*;

public class CategoriaDal extends Connect {
	public CategoriaDal() {
		super();
	}

	public Categoria insert(Categoria cat) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("INSERT INTO categoria VALUES(null,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, cat.getNome());
			stmt.setBoolean(2, cat.isAtivo());
			stmt.executeUpdate();

			ResultSet id = stmt.getGeneratedKeys();
			if (id.next())
				cat.setId(id.getInt(1));

			return cat;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}

	public boolean update(Categoria cat) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("UPDATE categoria SET nome = ?, ativo = ? WHERE id = ?");
			stmt.setString(1, cat.getNome());
			stmt.setBoolean(2, cat.isAtivo());
			stmt.setInt(3, cat.getId());

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

			PreparedStatement stmt = getCnn().prepareStatement("DELETE FROM categoria WHERE id = ?");
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

	public Categoria get(int id) {
		try {
			Categoria c = new Categoria();
			super.abrir();
			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM categoria WHERE id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setAtivo(rs.getBoolean("ativo"));
			}
			return c;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}

	public ArrayList<Categoria> listAll() {
		try {
			ArrayList<Categoria> cl = new ArrayList<Categoria>();

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM categoria");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Categoria c = new Categoria();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setAtivo(rs.getBoolean("ativo"));
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
