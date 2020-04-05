/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.models;

import bangmaple.dtos.Equipments;
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
public final class EquipmentsDAO implements Serializable {

    private final EntityManagerFactory emf = Persistence.createEntityManagerFactory("Assignment_Spring2020PU");

    private void persist(Object object) {
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

    private void remove(Object object) {
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

    private void merge(Object object) {
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

    public final int size() throws Exception {
        return emf.createEntityManager().createNamedQuery("Equipments.findAll").getResultList().size();
    }

    public final void disableOrEnableEquipment(final int equipID) throws Exception {
        EntityManager em = emf.createEntityManager();
        Equipments e = em.find(Equipments.class, equipID);
        if (e.getIsDisabled()) {
            e.setIsDisabled(false);
        } else {
            e.setIsDisabled(true);
        }
        merge(e);
    }

    public final List<Equipments> getAllEquipments() {
        return emf.createEntityManager().createNamedQuery("Equipments.findAll").getResultList();
    }

    public final void updateEquipment(final Equipments e) {
        merge(e);
    }

    public final void addEquipment(final int equipID, final String equipmentName, final String equipmentDescription, final String equipImage, final String equipmentType) throws Exception {
        Equipments e = new Equipments();
        e.setEquipID(equipID);
        e.setEquipName(equipmentName);
        e.setEquipDescription(equipmentDescription);
        e.setIsDisabled(false);
        e.setEquipImage(equipImage);
        e.setEquipType(equipmentType);
        persist(e);
    }

    public final List<Equipments> getEnabledEquipments() throws Exception {
        EntityManager em = emf.createEntityManager();
        List<Equipments> list;
        String jpql = "SELECT e FROM Equipments e WHERE e.isDisabled = false";
        list = em.createQuery(jpql).getResultList();
        return list;
    }

    public final void deleteEquipment(final int equipID) throws Exception {
        EntityManager em = emf.createEntityManager();
        Equipments e = em.find(Equipments.class, equipID);
        GenericDAO dao = new GenericDAO();
        if (dao.containsCurrentlyUsingEquipment(e)) {
            throw new Exception("The equipment you want to delete is currently using by another user!");
        }
        remove(e);
    }

    public final Equipments getEquipmentBasedOnEquipmentID(final int equipID) throws Exception {
        return emf.createEntityManager().find(Equipments.class, equipID);
    }

}
