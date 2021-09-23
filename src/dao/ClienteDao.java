package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Cliente;
import model.Endereco;

public class ClienteDao {
	public int criar(Cliente cli) {
		String sqlInsert = "INSERT INTO Clientes(nome, cpfCliente, sexo, dataDeNasc, email, senha, numero, complemento, id_enderecos) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		// usando o try with resources do fava 7, que fecha o que abriu
		
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);) {
			stm.setString(1, cli.getNome());
			stm.setString(2, cli.getCpfCliente());
			stm.setString(3, cli.getSexo());
			stm.setDate(4, new java.sql.Date(cli.getDataDeNasc().getTime()));
			stm.setString(5, cli.getEmail());
			stm.setString(6, cli.getSenha());
			stm.setInt(7, cli.getNumero());
			stm.setString(8, cli.getComplemento());
			stm.setInt(9, cli.getEnderecos().getId());
			stm.execute();
			//Pega id gerado
			ResultSet rs = stm.getGeneratedKeys();
	        rs.next();
	        int idGerado = rs.getInt(1);
	        cli.setId(idGerado);
	        
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cli.getId();
	}

	public void atualizar(Cliente cli) {
		String sqlUpdate = "UPDATE Clientes SET nome=?, cpfCliente=?, sexo=?, email=?, senha=?, dataDeNasc=?, numero=?, complemento=?, id_enderecos=? WHERE id=?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, cli.getNome());
			stm.setString(2, cli.getCpfCliente());
			stm.setString(3, cli.getSexo());
			stm.setString(4, cli.getEmail());
			stm.setString(5, cli.getSenha());
			stm.setDate(6, new java.sql.Date(cli.getDataDeNasc().getTime()));
			stm.setInt(7, cli.getNumero());
			stm.setString(8, cli.getComplemento());
			stm.setInt(9, cli.getEnderecos().getId());
			stm.setInt(10, cli.getId());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) {
		String sqlDelete = "DELETE FROM Clientes WHERE id = ?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Cliente carregar(int id) {
		Cliente cli = new Cliente();
		Endereco en = new Endereco();
		cli.setId(id);
		String sqlSelect = "SELECT nome, cpfCliente, sexo, email, senha, dataDeNasc, numero, complemento, id_enderecos FROM Clientes WHERE id = ?";
		// usando o try with resources do fava 7, que fecha o que abriu
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, cli.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					cli.setNome(rs.getString("nome"));
					cli.setCpfCliente(rs.getString("cpfCliente"));
					cli.setSexo(rs.getString("sexo"));
					cli.setEmail(rs.getString("email"));
					cli.setSenha(rs.getString("senha"));
					cli.setDataDeNasc(rs.getDate("dataDeNasc"));
					cli.setNumero(rs.getInt("numero"));
					cli.setComplemento(rs.getString("complemento"));
					en.setId(rs.getInt("id_enderecos"));

				} else {
					cli.setNome(null);
					cli.setCpfCliente(null);
					cli.setSexo(null);
					cli.setEmail(null);
					cli.setSenha(null);
					cli.setDataDeNasc(null);
					cli.setNumero(-1);
					cli.setComplemento(null);
					cli.setEnderecos(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return cli;
	}
	
	public boolean validar(Cliente usuario) {
		Endereco en = new Endereco();
		String sqlSelect = "SELECT id, nome, cpfCliente, sexo, email, senha, dataDeNasc, numero, complemento, id_enderecos FROM Clientes WHERE email = ? and senha = ?";
		try {
			Connection conn = ConnectionFactory.obtemConexao();
			try (PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
				stm.setString(1, usuario.getEmail());
				stm.setString(2, usuario.getSenha());
				try (ResultSet rs = stm.executeQuery();) {
					if (rs.next()) {
						usuario.setId(rs.getInt("id"));
						usuario.setNome(rs.getString("nome"));
						usuario.setCpfCliente(rs.getString("cpfCliente"));
						usuario.setSexo(rs.getString("sexo"));
						usuario.setEmail(rs.getString("email"));
						usuario.setSenha(rs.getString("senha"));
						usuario.setDataDeNasc(rs.getDate("dataDeNasc"));
						usuario.setNumero(rs.getInt("numero"));
						usuario.setComplemento(rs.getString("complemento"));
						en.setId(rs.getInt("id_enderecos"));
						return true;
					} else {
						return false;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				System.out.print(e1.getStackTrace());
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		return false;
	}
}
