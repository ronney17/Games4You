package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Jogos;

public class JogosDao {
	public int criar(Jogos j) {
		String sqlInsert = "INSERT INTO jogos(nome, dataDeLancamento, genero, descricao, classificacao, valor, fornecedor, caminhoImagem, caminhoTrailer) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);) {
			stm.setString(1, j.getNome());
			stm.setDate(2, new java.sql.Date(j.getDataDeLancamento().getTime()));
			stm.setString(3, j.getGenero());
			stm.setString(4, j.getDescricao());
			stm.setString(5, j.getClassificacao());
			stm.setDouble(6, j.getValor());
			stm.setString(7, j.getFornecedor());
			stm.setString(8, j.getCaminhoImagem());
			stm.setString(9, j.getCaminhoTrailer());
			stm.execute();
			//Pega id gerado
			ResultSet rs = stm.getGeneratedKeys();
	        rs.next();
	        int idGerado = rs.getInt(1);
	        j.setId(idGerado);
	        
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return j.getId();
	}

	public void atualizar(Jogos j) {
		String sqlUpdate = "UPDATE jogos SET nome=?, dataDeLancamento=?, genero=?, descricao=?, classificacao=?, valor=?, fornecedor=?, caminhoImagem=?, caminhoTrailer=? WHERE id=?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, j.getNome());
			stm.setDate(2, new java.sql.Date(j.getDataDeLancamento().getTime()));
			stm.setString(3, j.getGenero());
			stm.setString(4, j.getDescricao());
			stm.setString(5, j.getClassificacao());
			stm.setDouble(6, j.getValor());
			stm.setString(7, j.getFornecedor());
			stm.setString(8, j.getCaminhoImagem());
			stm.setString(9, j.getCaminhoTrailer());
			stm.setInt(10, j.getId());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) {
		String sqlDelete = "DELETE FROM jogos WHERE id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Jogos carregar(int id) {
		Jogos j = new Jogos();
		j.setId(id);
		String sqlSelect = "SELECT nome, dataDeLancamento, genero, descricao, classificacao, valor, fornecedor, caminhoImagem, caminhoTrailer FROM jogos WHERE id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, j.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					j.setNome(rs.getString("nome"));
					j.setDataDeLancamento(rs.getDate("dataDeLancamento"));
					j.setGenero(rs.getString("genero"));
					j.setDescricao(rs.getString("descricao"));
					j.setClassificacao(rs.getString("classificacao"));
					j.setValor(rs.getDouble("valor"));
					j.setFornecedor(rs.getString("fornecedor"));
					j.setCaminhoImagem(rs.getString("caminhoImagem"));
					j.setCaminhoTrailer(rs.getString("caminhoTrailer"));
					
				} else {
					j.setNome(null);
					j.setDataDeLancamento(null);
					j.setGenero(null);
					j.setDescricao(null);
					j.setClassificacao(null);
					j.setValor(-1);
					j.setFornecedor(null);
					j.setCaminhoImagem(null);
					j.setFornecedor(null);
					j.setCaminhoTrailer(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return j;
	}
	
	public ArrayList<Jogos> listarJogos() {
		Jogos jogos;
		ArrayList<Jogos> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, nome, descricao, valor, caminhoImagem FROM jogos";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					jogos = new Jogos();
					jogos.setId(rs.getInt("id"));
					jogos.setNome(rs.getString("nome"));
					jogos.setDescricao(rs.getString("descricao"));
					jogos.setValor(rs.getDouble("valor"));
					jogos.setCaminhoImagem(rs.getString("caminhoImagem"));
					lista.add(jogos);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Jogos> listarJogos(String chave) {
		Jogos jogos;
		ArrayList<Jogos> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, nome, descricao, valor, caminhoImagem FROM jogos WHERE upper(nome) like ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					jogos = new Jogos();
					jogos.setId(rs.getInt("id"));
					jogos.setNome(rs.getString("nome"));
					jogos.setDescricao(rs.getString("descricao"));
					jogos.setValor(rs.getDouble("valor"));
					jogos.setCaminhoImagem(rs.getString("caminhoImagem"));
					lista.add(jogos);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}
	
	public ArrayList<Jogos> listarCarrinho(int id) {
		Jogos jogos;
		ArrayList<Jogos> lista2 = new ArrayList<>();
		String sqlSelect = "SELECT id, nome, descricao, valor, caminhoImagem FROM jogos WHERE id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, id);
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					jogos = new Jogos();
					jogos.setId(rs.getInt("id"));
					jogos.setNome(rs.getString("nome"));
					jogos.setDescricao(rs.getString("descricao"));
					jogos.setValor(rs.getDouble("valor"));
					jogos.setCaminhoImagem(rs.getString("caminhoImagem"));
					lista2.add(jogos);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista2;
	}
}
