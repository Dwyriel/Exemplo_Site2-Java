package DAL;

import java.sql.*;
import java.util.ArrayList;
import model.Cliente;
import model.TCliente;

public class ClienteDal extends Connect {
	public ClienteDal() {
		super();
	}

	public Cliente insert(Cliente cliente) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("INSERT INTO usuario VALUES(null,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getEmail());
			stmt.setString(3, cliente.getSenha());
			stmt.setString(4, cliente.getTipo().toString());
			stmt.setBoolean(5, cliente.getAtivo());

			stmt.executeUpdate();

			ResultSet id = stmt.getGeneratedKeys();
			if (id.next())
				cliente.setId(id.getInt(1));

			return cliente;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}

	public boolean update(Cliente cliente) {
		try {
			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement(
					"UPDATE usuario SET nome = ?, email = ? , senha = ?, tipo = ?, ativo = ? WHERE id = ?");
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getEmail());
			stmt.setString(3, cliente.getSenha());
			stmt.setString(4, cliente.getTipo().toString());
			stmt.setBoolean(5, cliente.getAtivo());
			stmt.setInt(6, cliente.getId());

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

			PreparedStatement stmt = getCnn().prepareStatement("DELETE FROM usuario WHERE id = ?");
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

	public Cliente get(int id) {
		try {
			Cliente c = new Cliente();

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM usuario WHERE id = ?");
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				c.setId(rs.getInt("id"));
				c.setEmail(rs.getString("email"));
				c.setSenha(rs.getString("senha")); //Terrible idea to set password, will leave as is for now.
				c.setNome(rs.getString("nome"));
				if (rs.getString("tipo").equals("Admin")) {
					c.setTipo(TCliente.Admin);
				} else {
					c.setTipo(TCliente.Usuario);
				}
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

	public ArrayList<Cliente> listAll() {
		try {
			ArrayList<Cliente> cl = new ArrayList<Cliente>();

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM usuario");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Cliente c = new Cliente();
				c.setId(rs.getInt("id"));
				c.setEmail(rs.getString("email"));
				c.setSenha(rs.getString("senha")); //Terrible idea to set password, will leave as is for now.
				c.setNome(rs.getString("nome"));
				if (rs.getString("tipo").equals("Admin")) {
					c.setTipo(TCliente.Admin);
				} else {
					c.setTipo(TCliente.Usuario);
				}
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

	public Cliente autenticacao(Cliente c) {
		try {

			super.abrir();

			PreparedStatement stmt = getCnn().prepareStatement("SELECT * FROM usuario WHERE email = ? AND senha = ? AND ativo = 1");
			stmt.setString(1, c.getEmail());
			stmt.setString(2, c.getSenha());
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				c.setId(rs.getInt("id"));
				c.setEmail(rs.getString("email"));
				c.setSenha(rs.getString("senha")); //Terrible idea to set password, will leave as is for now.
				c.setNome(rs.getString("nome"));
				if (rs.getString("tipo").equals("Admin")) {
					c.setTipo(TCliente.Admin);
				} else {
					c.setTipo(TCliente.Usuario);
				}
				c.setAtivo(rs.getBoolean("ativo"));
			} else {
				return null;
			}
			return c;
		} catch (

		Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		} finally {
			super.fechar();
		}
	}

}
