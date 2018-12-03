/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;

/**
 *
 * @author sajsm
 */
public class Perfil {
    
    private int id;
    private String nome;
    private String descricao;
    private int status;
    
    private ArrayList<Menu> meusMenus;

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    } 

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public ArrayList<Menu> getMeusMenus() {
        return meusMenus;
    }

    public void setMeusMenus(ArrayList<Menu> meusMenus) {
        this.meusMenus = meusMenus;
    }
}
