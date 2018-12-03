/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PerfilDAO extends DataSource{

//Criar o método inserir um perfil.
public void inserir(Perfil p) throws Exception{
        this.conectar();
        String sql = "INSERT INTO perfil (nome,descricao) VALUES(?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.execute();
        this.desconectar();
    }
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM perfil WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Perfil> listar() throws Exception{
        this.conectar();
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        String sql = "SELECT * FROM perfil";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }
    public ArrayList<Perfil> listar(String nome) throws Exception{
        this.conectar();
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        String sql = "SELECT * FROM perfil WHERE nome like '%"+nome+"%'";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }
    public Perfil carregarPorId(int id) throws Exception{
        this.conectar();
        Perfil p = new Perfil();
        String sql = "SELECT * FROM perfil WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setMeusMenus(this.menusPerfil(id));
        }
        this.desconectar();
        return p;
    }
    public void alterar(Perfil p) throws Exception{
        this.conectar();
        String sql = "UPDATE perfil SET nome=?,descricao=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.setInt(3, p.getId());
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Menu> menusPerfil(int perfil_id) throws Exception{
        this.conectar();
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT m.* FROM menu as m, perfil_menu as pm WHERE pm.menu_id=m.id AND pm.perfil_id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    public ArrayList<Menu> menusNaoPerfil(int perfil_id) throws Exception{
        this.conectar();
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu WHERE id NOT IN(SELECT menu_id FROM perfil_menu as pm WHERE pm.perfil_id=?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    public void vincular(int perfil_id, int menu_id) throws Exception{
        this.conectar();
        String sql = "INSERT INTO perfil_menu (perfil_id,menu_id) VALUES(?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        pstm.setInt(2, menu_id);
        pstm.execute();
        this.desconectar();
    }
    public void desvincular(int perfil_id, int menu_id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM perfil_menu WHERE perfil_id=? AND menu_id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        pstm.setInt(2, menu_id);
        pstm.execute();
        this.desconectar();
    }
}
