package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Cliente;
import model.Telefones;

public class TelefonesDao {
	public int criar(Telefones t) {
		String sqlInsert = "INSERT INTO telefones(telefones, id_clientes) VALUES (?, ?)";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);) {
			stm.setString(1, t.getTelefone());
			stm.setInt(2, t.getClientes().getId());
			stm.execute();
			//Pega id gerado
			ResultSet rs = stm.getGeneratedKeys();
	        rs.next();
	        int idGerado = rs.getInt(1);
	        t.setId(idGerado);
	        
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t.getId();
	}

	public void atualizar(Telefones t) {
		String sqlUpdate = "UPDATE telefones SET telefones=? WHERE id_clientes=?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, t.getTelefone());
			stm.setInt(2, t.getId());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) {
		String sqlDelete = "DELETE FROM telefones WHERE id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Telefones carregar(int id) {
		Telefones t = new Telefones();
		Cliente c = new Cliente();
		t.setId(id);
		String sqlSelect = "SELECT telefones, id_clientes FROM telefones WHERE id_clientes = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, t.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					t.setTelefone(rs.getString("telefones"));
					c.setId(rs.getInt("id_clientes"));

				} else {
					t.setId(-1);
					t.setTelefone(null);
					t.setClientes(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return t;
	}
}
