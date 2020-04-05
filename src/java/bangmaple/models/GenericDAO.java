/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.models;

import bangmaple.dtos.Equipments;
import bangmaple.dtos.EquipmentsLocationHistory;
import bangmaple.dtos.EquipmentsReq;
import bangmaple.dtos.EquipmentsUsingByUsers;
import bangmaple.dtos.Rooms;
import bangmaple.dtos.Users;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

/**
 *
 * @author bangmaple
 */
public class GenericDAO implements Serializable {

    private final EntityManagerFactory emf = Persistence.createEntityManagerFactory("Assignment_Spring2020PU");

    public void persist(Object object) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(object);
            et.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            et.rollback();

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

    public final void addEquipmentLocationHistory(final int id, final Users u, final Rooms r, final String reason, final int equipUsingID) throws Exception {
        EquipmentsLocationHistory el = new EquipmentsLocationHistory(id);
        el.setDateChange(new Date());
        el.setChangeLocationDescription(reason);
        el.setUsernameChange(u);
        el.setRoomID(r);
        persist(el);
        EquipmentsLocationHistory elNew = getEquipmentsLocationHistoryByID(id);
        elNew.setEquipByUserID(getEquipUsingByID(equipUsingID));
        merge(elNew);
    }

    public EquipmentsLocationHistory getEquipmentsLocationHistoryByID(final int id) throws Exception {
        return emf.createEntityManager().find(EquipmentsLocationHistory.class, id);
    }

    public final void addUEToRoom(final int id, final Users u, final Rooms r, final Equipments e) throws Exception {
        EquipmentsUsingByUsers eu = new EquipmentsUsingByUsers();
        eu.setEquipByUserID(id);
        eu.setUsername(u);
        eu.setEquipID(e);
        eu.setRoomID(r);
        eu.setEquipDateBought(new Date());
        eu.setEquipDateWarranty(new Date(LocalDate.now().getYear() - 1897, LocalDate.now().getMonthValue() - 1, LocalDate.now().getDayOfMonth()));
        eu.setEquipStatus("OK");
        eu.setNumOfRepair(0);
        persist(eu);
    }

    public final List<EquipmentsUsingByUsers> getAllCurrentUsingByUser(final Users user) throws Exception {
        List<EquipmentsUsingByUsers> list;
        EntityManager em = emf.createEntityManager();
        list = em.createQuery("SELECT r FROM EquipmentsUsingByUsers r WHERE r.username = :username")
                .setParameter("username", user).getResultList();
        return list;
    }

    public final List<EquipmentsUsingByUsers> getAllCurrentUsing() throws Exception {
        return emf.createEntityManager().createNamedQuery("EquipmentsUsingByUsers.findAll").getResultList();
    }

    public final List<EquipmentsUsingByUsers> getAllCurrentUsingDateRange(final Date dateFrom, final Date dateTo) throws Exception {
        return emf.createEntityManager().createQuery("SELECT eu FROM EquipmentsUsingByUsers eu WHERE eu.equipDateBought >= :dateFrom AND eu.equipDateBought <= :dateTo")
                .setParameter("dateFrom", dateFrom).setParameter("dateTo", dateTo).getResultList();
    }

    public final List<EquipmentsUsingByUsers> getAllCurrentUsingDateRangeByUser(final Date dateFrom, final Date dateTo, final String username) throws Exception {
        return emf.createEntityManager().createQuery("SELECT eu FROM EquipmentsUsingByUsers eu WHERE eu.equipDateBought >= :dateFrom AND eu.equipDateBought <= :dateTo AND eu.username.username = :username")
                .setParameter("dateFrom", dateFrom).setParameter("dateTo", dateTo).setParameter("username", username).getResultList();
    }

    public final List<EquipmentsUsingByUsers> getAllCurrentUsingRepairTime(final int repairTime) throws Exception {
        return emf.createEntityManager().createQuery("SELECT eu FROM EquipmentsUsingByUsers eu WHERE eu.numOfRepair >= :repairTime")
                .setParameter("repairTime", repairTime).getResultList();
    }

    public final List<EquipmentsUsingByUsers> getAllCurrentUsingRepairTimeByUser(final int repairTime, final String username) throws Exception {
        return emf.createEntityManager().createQuery("SELECT eu FROM EquipmentsUsingByUsers eu WHERE eu.numOfRepair >= :repairTime AND eu.username.username = :username")
                .setParameter("username", username)
                .setParameter("repairTime", repairTime).getResultList();
    }

    public final boolean containsCurrentlyUsingEquipment(final Equipments e) throws Exception {
        List<EquipmentsUsingByUsers> list = emf.createEntityManager()
                .createNamedQuery("EquipmentsUsingByUsers.findAll").getResultList();
        for (EquipmentsUsingByUsers equipmentsUsingByUsers : list) {
            if (equipmentsUsingByUsers.getEquipID().equals(e)) {
                return true;
            }
        }
        return false;
    }

    public final EquipmentsUsingByUsers getEquipUsingByID(final int ID) throws Exception {
        return emf.createEntityManager().find(EquipmentsUsingByUsers.class, ID);
    }

    public final List<EquipmentsUsingByUsers> getNotOkEquipments(final Users user) throws Exception {
        EntityManager em = emf.createEntityManager();
        return em.createQuery("SELECT r FROM EquipmentsUsingByUsers r WHERE r.username = :username "
                + "AND r.equipStatus != 'OK'").setParameter("username", user).getResultList();
    }

    public final void changeEquipmentLocation(final int equipUsingID, final int roomID) throws Exception {
        EquipmentsUsingByUsers eu = getEquipUsingByID(equipUsingID);
        RoomsDAO rDAO = new RoomsDAO();
        eu.setRoomID(rDAO.getRoomByRoomID(roomID));
        merge(eu);
    }

    public final List<EquipmentsUsingByUsers> getNotOkEquipments() throws Exception {
        EntityManager em = emf.createEntityManager();
        return em.createQuery("SELECT r FROM EquipmentsUsingByUsers r WHERE r.equipStatus != 'OK' AND r.equipReqID != null").getResultList();
    }

    public EquipmentsReq getEquipmentRequestByID(final int id) throws Exception {
        return emf.createEntityManager().find(EquipmentsReq.class, id);
    }

    public final void setEquipUsingOK(int equipUsingID) throws Exception {
        EquipmentsUsingByUsers eUsing = getEquipUsingByID(equipUsingID);
        eUsing.setEquipStatus("OK");
        if (eUsing.getEquipReqID() != null) {
            eUsing.setNumOfRepair(eUsing.getNumOfRepair() - 1);
            EquipmentsReq req = getEquipmentRequestByID(eUsing.getEquipReqID());
            remove(req);
        }
        eUsing.setEquipReqID(null);
        merge(eUsing);
    }

    public final void requestRepairEquipment(final EquipmentsReq req, final int equipUsingID) throws Exception {

        EquipmentsUsingByUsers eUsing = getEquipUsingByID(equipUsingID);
        eUsing.setEquipStatus("BROKEN");
        eUsing.setNumOfRepair(eUsing.getNumOfRepair() + 1);

        eUsing.setEquipReqID(req.getEquipReqID());
        merge(eUsing);
        persist(req);
    }

}
