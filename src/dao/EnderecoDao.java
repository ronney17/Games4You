package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Endereco;


public class EnderecoDao {
	public int criar(Endereco en) {
		String sqlInsert = "INSERT INTO Enderecos(rua, bairro, cidade, estado, cep) VALUES (?, ?, ?, ?, ?)";
		// usando o try with resources do java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);) {
			stm.setString(1, en.getRua());
			stm.setString(2, en.getBairro());
			stm.setString(3, en.getCidade());
			stm.setString(4, en.getEstado());
			stm.setString(5, en.getCep());
			stm.execute();
			//Pega id gerado
			ResultSet rs = stm.getGeneratedKeys();
	        rs.next();
	        int idGerado = rs.getInt(1);
	        
	        en.setId(idGerado);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return en.getId();
	}

	public void atualizar(Endereco en) {
		String sqlUpdate = "UPDATE Enderecos SET rua=?, bairro=?, cidade=?, estado=?, cep=? WHERE id=?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, en.getRua());
			stm.setString(2, en.getBairro());
			stm.setString(3, en.getCidade());
			stm.setString(4, en.getEstado());
			stm.setString(5, en.getCep());
			stm.setInt(6, en.getId());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) {
		String sqlDelete = "DELETE FROM Enderecos WHERE id = ?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Endereco carregar(int id) {
		Endereco en = new Endereco();
		en.setId(id);
		String sqlSelect = "SELECT rua, bairro, cidade, estado, cep FROM Enderecos e WHERE e.id = ?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, en.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					en.setRua(rs.getString("rua"));
					en.setBairro(rs.getString("bairro"));
					en.setCidade(rs.getString("cidade"));
					en.setEstado(rs.getString("estado"));
					en.setCep(rs.getString("cep"));
				} else {
					en.setRua(null);
					en.setBairro(null);
					en.setCidade(null);
					en.setEstado(null);
					en.setCep(null);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return en;
	}
}
