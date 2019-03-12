/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Usuario;

/**
 *
 * @author asafe
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "FacegramEE-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    public Usuario comprobarDatos(String mail, String password){
        Usuario usuario=null;
        try{
        String sql = "Select * from usuario u where usuario.correo=:correo and u.pass=:password";
        usuario = (Usuario) em.createQuery(sql).setParameter("correo", mail).setParameter("password", password).getSingleResult();
        } catch(Exception e){
            throw e;
        }
        
        return usuario;
    }
}
