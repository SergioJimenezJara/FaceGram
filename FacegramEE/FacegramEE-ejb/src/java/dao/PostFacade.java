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
import model.Post;
import model.Usuario;

/**
 *
 * @author asafe
 */
@Stateless
public class PostFacade extends AbstractFacade<Post> {

    @PersistenceContext(unitName = "FacegramEE-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostFacade() {
        super(Post.class);
    }
    
    public List<Post> recogerMisPost(int id){
        List<Post> listaPost;
        try{  
        String sql = "select p from Post p where p.idUsuario=:id";
        listaPost = (List<Post>) em.createQuery(sql).setParameter("id", id).getResultList();
        } catch(Exception e){
            throw e;
        }
        return listaPost;
    }
    
    public List<Post> recogerPostsAmigos(int id){
        List<Post> listaPost;
        try{  
        String sql = "select p from Post p where p.idUsuario!=:id";
        listaPost = (List<Post>) em.createQuery(sql).setParameter("id", id).getResultList();
        } catch(Exception e){
            throw e;
        }
        return listaPost;
    }
}
