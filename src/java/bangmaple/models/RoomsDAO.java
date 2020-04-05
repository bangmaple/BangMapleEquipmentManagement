/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.models;

import bangmaple.dtos.Rooms;
import java.io.Serializable;
import java.util.Date;
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
public class RoomsDAO implements Serializable {
    
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
    
    public void merge(Object object) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(object);
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
    
    public final int size() throws Exception {
        return emf.createEntityManager().createNamedQuery("Rooms.findAll").getResultList().size();
    }
    
    public final void disableOrEnableRoom(final int roomID) throws Exception {
        EntityManager em = emf.createEntityManager();
        Rooms r = em.find(Rooms.class, roomID);
        if (r.getIsDisabled()) {
            r.setIsDisabled(false);
        } else {
            r.setIsDisabled(true);
        }
        merge(r);
    }
    
    public final void addRoom(final int roomID, final String roomDescription) {
        Rooms r = new Rooms();
        r.setRoomID(roomID);
        r.setCreationDate(new Date(System.currentTimeMillis()));
        r.setIsDisabled(false);
        r.setRoomDescription(roomDescription);
        persist(r);
    }
    
    public final void deleteRoom(final int roomID) {
        remove(emf.createEntityManager().find(Rooms.class, roomID));
    }
    
    public final List<Rooms> getAllRooms() {
        return emf.createEntityManager().createNamedQuery("Rooms.findAll").getResultList();
    }
    
    public final void updateRoom(final String roomDescription, final int roomID) {
        Rooms r = getRoomByRoomID(roomID);
        r.setRoomDescription(roomDescription);
        merge(r);
    }
    
    public final Rooms getRoomByRoomID(final int roomID) {
        return emf.createEntityManager().find(Rooms.class, roomID);
    }
    
    public final List<Rooms> getEnabledRooms() throws Exception {
        return emf.createEntityManager().createQuery("SELECT r FROM Rooms r WHERE r.isDisabled = false").getResultList();
    }
}
