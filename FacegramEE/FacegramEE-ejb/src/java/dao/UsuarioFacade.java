/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
        String sql = "Select u from Usuario u where u.correo=:correo and u.pass=:password";
        List<Usuario> temp;
        temp = (List<Usuario>) em.createQuery(sql).setParameter("correo", mail).setParameter("password", password).getResultList();
        if(temp.size()!=0){
            usuario = temp.get(0);
        }
        } catch(Exception e){
            throw e;
        }
        
        return usuario;
    }
    
    //Comprobar Usuario
    public Usuario comprobarUsuario (String mail) {
        Usuario usuario=null;
        try {
        String sql = "Select u from Usuario where u.correo=:correo";
        List<Usuario> temp;
        
        temp = (List<Usuario>)em.createQuery(sql).setParameter("correo", mail).getSingleResult();
        if (temp.size() !=0) {
            usuario = temp.get(0);
        }
        } catch(Exception e){
            throw e;
        }
        return usuario;
    }
    
    public void registrarUsuario(Usuario u) {
        // Código para registrar el usuario en la DDBB, debería de ir en la facade
        
        em.persist(u);
        
    }
}
