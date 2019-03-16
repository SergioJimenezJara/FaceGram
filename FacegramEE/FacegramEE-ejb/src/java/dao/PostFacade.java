/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Amigo;
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

    public List<Post> recogerMisPost(int id) {
        List<Post> listaPost;
        try {
            String sql = "select p from Post p where p.idUsuario=:id";
            listaPost = (List<Post>) em.createQuery(sql).setParameter("id", id).getResultList();
        } catch (Exception e) {
            throw e;
        }
        Collections.reverse(listaPost);

        return listaPost;
    }

    public List<Post> recogerPostsAmigos(Usuario user) {
        List<Amigo> listaAmigos;
        List<Post> listaPost;
        List<Integer> listaIdAmigos = new ArrayList<Integer>();
        try {
            // trae las id de los amigos
            String sql = "select a from Amigo a where a.idUsuario1=:id";
            listaAmigos = (List<Amigo>) em.createQuery(sql).setParameter("id", user).getResultList();
            for(Amigo a:listaAmigos){
                listaIdAmigos.add(a.getIdUsuario2().getIdUsuario());
            }
            // trae todos los post de los demas
            String hql = "select p from Post p where p.idUsuario in :amigo";
            listaPost = (List<Post>) em.createQuery(hql).setParameter("amigo", listaIdAmigos).getResultList();
        } catch (Exception e) {
            throw e;
        }
        Collections.reverse(listaPost);

        return listaPost;
    }
}
