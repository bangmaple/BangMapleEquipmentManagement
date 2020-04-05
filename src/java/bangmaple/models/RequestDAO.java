/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.models;

import java.io.Serializable;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author bangmaple
 */
public class RequestDAO implements Serializable {

    private final EntityManagerFactory emf = Persistence.createEntityManagerFactory("Assignment_Spring2020PU");

    public synchronized void removeOutdateRequest() {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.createNativeQuery("DELETE FROM EquipmentsReq WHERE UsernameResponse IS NULL AND DATEDIFF(DAY,EquipmentsReq.RepairRequestDate,GETDATE())>=2").executeUpdate();
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            Logger.getLogger("Error at auto-remove outdated request.");
        } finally {
            em.close();
        }
    }

}
