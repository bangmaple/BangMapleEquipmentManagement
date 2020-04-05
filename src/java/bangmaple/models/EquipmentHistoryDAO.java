/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.models;

import bangmaple.dtos.EquipmentsReq;
import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author bangmaple
 */
public class EquipmentHistoryDAO implements Serializable {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Assignment_Spring2020PU");

    public void persist(Object object) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public void remove(Object object) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            if (!em.contains(object)) {
                object = em.merge(object);
            }
            em.remove(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public void removeAll() {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.createQuery("DELETE FROM EquipmentsReq").executeUpdate();
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public final List<EquipmentsReq> getAllEquipReqByUser(final String username) throws Exception {
        return emf.createEntityManager()
                .createQuery("SELECT e FROM EquipmentsReq e WHERE e.usernameRequest = :username")
                .setParameter("username", new UsersDAO().getUserByUsername(username)).getResultList();
    }

    public final List<EquipmentsReq> getAllForAdmin() throws Exception {
        return emf.createEntityManager().createQuery("SELECT r FROM EquipmentsReq r WHERE r.repairResult NOT LIKE 'Waiting Response...'").getResultList();
    }

    public EquipmentsReq getEquipmentReqByID(final int id) throws Exception {
        return emf.createEntityManager().find(EquipmentsReq.class, id);
    }
    
    
    public List<EquipmentsReq> getAllEquipResbyTech(final String username) throws Exception {
        return emf.createEntityManager().createQuery("SELECT e FROM EquipmentsReq e WHERE e.usernameResponse = :username")
                .setParameter("username", new UsersDAO().getUserByUsername(username)).getResultList();
    }

}
