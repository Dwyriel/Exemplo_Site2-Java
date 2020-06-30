package DAL;

import java.sql.*;
import java.util.ArrayList;
import model.Comentario;

public class ComentarioDal extends Connect {
	public ComentarioDal() {
		super();
	}

	public Comentario insert(Comentario com) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("INSERT INTO Comentario VALUES(null, ?, now(), ?, ?)",
					Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, com.getTexto());
			stmt.setInt(2, com.getConteudo_id());
			stmt.setInt(3, com.getPoster());
			stmt.executeUpdate();

			ResultSet id = stmt.getGeneratedKeys();
			if (id.next())
				com.setId(id.getInt(1));

			return com;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}

	public boolean update(Comentario com) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement(
					"UPDATE Comentario SET texto = ?, data_pub = ?, conteudo_id = ?, usuario_id = ? WHERE id = ?");
			stmt.setString(1, com.getTexto());
			stmt.setDate(2, com.getData_pub());
			stmt.setInt(3, com.getConteudo_id());
			stmt.setInt(4, com.getPoster());
			stmt.setInt(5, com.getId());

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

			PreparedStatement stmt = getCnn().prepareStatement("DELETE FROM Comentario WHERE id = ?");
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

	public Comentario get(int id) {
		try {
			Comentario c = new Comentario();
			super.abrir();
			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM Comentario WHERE id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				c.setId(rs.getInt("id"));
				c.setTexto(rs.getString("texto"));
				c.setData_pub(rs.getDate("data_pub"));
				c.setConteudo_id(rs.getInt("conteudo_id"));
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

	public ArrayList<Comentario> listAll() {
		try {
			ArrayList<Comentario> cl = new ArrayList<Comentario>();

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM Comentario");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Comentario c = new Comentario();
				c.setId(rs.getInt("id"));
				c.setTexto(rs.getString("texto"));
				c.setData_pub(rs.getDate("data_pub"));
				c.setConteudo_id(rs.getInt("conteudo_id"));
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
	public ArrayList<Comentario> listAll(int id) {
		try {
			ArrayList<Comentario> cl = new ArrayList<Comentario>();

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM Comentario WHERE conteudo_id = ?");
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Comentario c = new Comentario();
				c.setId(rs.getInt("id"));
				c.setTexto(rs.getString("texto"));
				c.setData_pub(rs.getDate("data_pub"));
				c.setConteudo_id(rs.getInt("conteudo_id"));
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
