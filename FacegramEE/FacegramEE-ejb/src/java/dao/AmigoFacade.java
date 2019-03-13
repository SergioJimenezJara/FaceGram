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
import model.Amigo;
import model.Usuario;

/**
 *
 * @author asafe
 */
@Stateless
public class AmigoFacade extends AbstractFacade<Amigo> {

    @PersistenceContext(unitName = "FacegramEE-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AmigoFacade() {
        super(Amigo.class);
    }
    
    public List<Usuario> traerAmigos(int id){
    List<Usuario> amigos = null;
        try{  
        String sql = "SELECT * FROM Usuario WHERE id_usuario in (select id_usuario_2 from amigo where id_usuario_1=:id)";
        amigos = (List<Usuario>) em.createQuery(sql).setParameter("id", id).getResultList();
        } catch(Exception e){
            throw e;
        }
        return amigos;
    }
    
}
