package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Venda;

public class VendaDao {
	public int criar(Venda ve) {
		String sqlInsert = "INSERT INTO venda(id_clientes, formadepagamento, nomeCartao, numeroCartao, validadeCartao, cvvCartao, parcelasCartao) VALUES (?, ?, ?, ?, ?, ?, ?)";
		// usando o try with resources do java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);) {
			stm.setInt(1, ve.getCliente().getId());
			stm.setString(2, ve.getFormadepagamento());
			stm.setString(3, ve.getNomeCartao());
			stm.setString(4, ve.getNumeroCartao());
			stm.setString(5, ve.getValidadeCartao());
			stm.setString(6, ve.getCvvCartao());
			stm.setInt(7, ve.getParcelasCartao());
			stm.execute();
			//Pega id gerado
			ResultSet rs = stm.getGeneratedKeys();
	        rs.next();
	        int idGerado = rs.getInt(1);
	        ve.setId(idGerado);
	        
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ve.getId();
	}
	
	public int inserir(Venda ve) {
		String sqlInsert = "INSERT INTO venda(id_clientes, formadepagamento) VALUES (?, ?)";
		// usando o try with resources do java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);) {
			stm.setInt(1, ve.getCliente().getId());
			stm.setString(2, ve.getFormadepagamento());
			stm.execute();
			//Pega id gerado
			ResultSet rs = stm.getGeneratedKeys();
	        rs.next();
	        int idGerado = rs.getInt(1);
	        ve.setId(idGerado);
	        
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ve.getId();
	}

	public Venda carregar(int id) {
		Venda ve = new Venda();
		ve.setId(id);
		String sqlSelect = "SELECT nomeCartao, numeroCartao, validadeCartao, cvvCartao, parcelasCartao FROM venda WHERE id = ?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, ve.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					ve.setNomeCartao(rs.getString("nomeCartao"));
					ve.setNumeroCartao(rs.getString("numeroCartao"));
					ve.setValidadeCartao(rs.getString("validadeCartao"));
					ve.setCvvCartao(rs.getString("cvvCartao"));
					ve.setParcelasCartao(rs.getInt("parcelasCartao"));
				} else {
					ve.setNomeCartao(null);
					ve.setNumeroCartao(null);
					ve.setValidadeCartao(null);
					ve.setCvvCartao(null);
					ve.setParcelasCartao(-1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return ve;
	}
}