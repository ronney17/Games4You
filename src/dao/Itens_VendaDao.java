package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Itens_Venda;

public class Itens_VendaDao {
	public int criar(Itens_Venda iv) {
		String sqlInsert = "INSERT INTO itens_venda(quantidade, id_jogos, id_venda) VALUES (?, ?, ?)";
		// usando o try with resources do java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);) {
			stm.setInt(1, iv.getQuantidade());
			stm.setInt(2, iv.getJogos().getId());
			stm.setInt(3, iv.getVenda().getId());
			stm.execute();
			//Pega id gerado
			ResultSet rs = stm.getGeneratedKeys();
	        rs.next();
	        int idGerado = rs.getInt(1);
	        iv.setId(idGerado);
	        
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return iv.getId();
	}

	public void atualizar(Itens_Venda iv) {
		String sqlUpdate = "UPDATE itens_Venda SET quantidade=? WHERE id=?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setInt(1, iv.getQuantidade());
			stm.setInt(2, iv.getId());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) {
		String sqlDelete = "DELETE FROM itens_Venda WHERE id = ?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Itens_Venda carregar(int id) {
		Itens_Venda iv = new Itens_Venda();
		iv.setId(id);
		String sqlSelect = "SELECT quantidade FROM itens_Venda WHERE id = ?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, iv.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					iv.setQuantidade(rs.getInt("quantidade"));
				} else {
					iv.setQuantidade(-1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return iv;
	}
}
