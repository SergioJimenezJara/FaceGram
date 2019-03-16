/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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

    public List<Usuario> traerAmigos(Usuario u) {
        
        List<Usuario> listaAmigos = new ArrayList();
        List<Amigo> amigos = new ArrayList();
        String sql = "Select a from Amigo a where a.idUsuario1=:usuario";
        amigos = (List<Amigo>) em.createQuery(sql).setParameter("usuario", u).getResultList();

        for (Amigo a : amigos) {
            listaAmigos.add(a.getIdUsuario2());
        }


        return listaAmigos;
    }

    public List<Usuario> traerDesconocidos(Usuario u) {
        List<Usuario> listaUsers = new ArrayList();
        List<Usuario> listaAmigos = new ArrayList();
        List<Amigo> amigos = new ArrayList();

        // creamos una lista con los amigos
        String sql = "Select a from Amigo a where a.idUsuario1=:usuario";
        amigos = (List<Amigo>) em.createQuery(sql).setParameter("usuario", u).getResultList();

        for (Amigo a : amigos) {
            listaAmigos.add(a.getIdUsuario2());
        }

        // creamos una lista con todos los usuarios
        sql = "Select u from Usuario u";
        listaUsers = (List<Usuario>) em.createQuery(sql).getResultList();

        // quitamos de la lista a los amigos, obteniendo a los usuarios NO amigos
        for (Usuario amigo : listaAmigos) {
            if (listaUsers.contains(amigo)) {
                listaUsers.remove(amigo);
            }

            //Quitamos al usuario actual
            listaUsers.remove(u);
        }

        return listaUsers;
    }

    public void anadirAmigo(Usuario u, int idDesconocido) {
        Amigo a = new Amigo();
        Usuario desconocido = new Usuario();
        a.setIdUsuario1(u);
        desconocido.setIdUsuario(idDesconocido);
        a.setIdUsuario2(desconocido);
        em.persist(a);

        Amigo b = new Amigo();
        b.setIdUsuario1(desconocido);
        b.setIdUsuario2(u);
        em.persist(b);
    }

    public void borrarAmigo(Usuario u, int idDesconocido) {
            Amigo a = new Amigo();
        Usuario desconocido = new Usuario();

        a.setIdUsuario1(u);
        desconocido.setIdUsuario(idDesconocido);
        a.setIdUsuario2(desconocido);
        em.remove(a);

        a.setIdUsuario1(desconocido);
        a.setIdUsuario2(u);
        em.remove(a);
    }
}
