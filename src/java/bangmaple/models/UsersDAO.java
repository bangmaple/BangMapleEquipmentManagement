/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.models;

import bangmaple.dtos.Users;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;

/**
 *
 * @author bangmaple
 */
public class UsersDAO implements Serializable {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Assignment_Spring2020PU");

    public void persist(Object object) throws Exception {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (IllegalStateException e) {
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public void merge(Object object) throws Exception {
        EntityManager em = emf.createEntityManager();
        try {

            em.getTransaction().begin();
            em.merge(object);
            em.getTransaction().commit();
        } catch (IllegalStateException e) {
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public final void updateUser(Users u) throws Exception {
        merge(u);
    }

    public final Users getUserByUsername(final String username) throws IllegalArgumentException {
        return emf.createEntityManager().find(Users.class, username);
    }

    public final String getFullnameByUsername(final String username) throws IllegalArgumentException {
        return getUserByUsername(username).getFullname();
    }

    public final void disableOrEnableUser(final String username) throws Exception {
        Users u = getUserByUsername(username);
        if (u.getIsDisabled()) {
            u.setIsDisabled(false);
        } else {
            u.setIsDisabled(true);
        }
        merge(u);
    }

    public final String checkLogin(final String username, final String password) throws IllegalArgumentException {
        Users u = getUserByUsername(username);
        if (u == null) {
            throw new IllegalArgumentException("Username or password is not correct. Please try again.");
        }
        if (u.getPassword().equals(password)) {
            if (!activatedCheckBasedOnUsername(username)) {
                throw new IllegalArgumentException("This account hasn't been activated! Please check your mail box for account activation or contact administrators.");
            }
            return u.getRole();
        } else {
            throw new IllegalArgumentException("Username or password is not correct. Please try again.");
        }
    }

    public final void addUser(String username, String password,
            String fullname, String email, Date dateOfBirth, String role) throws IllegalArgumentException, Exception {
        Users u = new Users();
        u.setUsername(username);
        u.setPassword(password);
        u.setDoB(dateOfBirth);
        u.setRole(role);
        u.setEmail(email);
        u.setFullname(fullname);
        u.setIsActivated(true);
        u.setCreationDate(new Date(System.currentTimeMillis()));
        u.setIsDisabled(false);
        persist(u);
    }

    private boolean activatedCheckBasedOnUsername(final String username) throws IllegalArgumentException {
        return getUserByUsername(username).getIsActivated();
    }

    public boolean checkExistEmail(final String email) throws Exception {
        Users u = getUserBasedOnEmail(email);
        if (u == null) {
            return false;
        } else if (u.getEmail().equals("")) {
            return false;
        }
        return true;
    }

    private boolean checkExistUsername(final String username) throws Exception {
        return emf.createEntityManager().find(Users.class, username) != null;
    }

    public final boolean registerAccount(final String username,
            final String password, final String email) throws Exception {
        if (checkExistUsername(username)) {
            return false;
        } else if (checkExistEmail(email)) {
            return false;
        }
        Users u = new Users(username);
        u.setPassword(password);
        u.setEmail(email);
        u.setIsActivated(false);
        u.setRole("User");
        u.setCreationDate(new Date(System.currentTimeMillis()));
        u.setIsDisabled(false);
        persist(u);
        return true;
    }

    /**
     * Delete an account
     *
     * @param username
     * @return
     * @throws java.lang.Exception
     */
    public final boolean deleteAccount(final String username) throws Exception {
        EntityManager em = emf.createEntityManager();
        Users u = em.find(Users.class, username);
        try {
            em.getTransaction().begin();
            em.remove(u);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new Exception(e.getMessage());
        } finally {
            em.close();
        }
        return true;
    }

    public final int size() throws Exception {
        return emf.createEntityManager().createNamedQuery("Users.findAll").getResultList().size();
    }

    public final void changePassword(final String username, final String password) throws Exception {
        EntityManager em = emf.createEntityManager();
        Users u = em.find(Users.class, username);
        u.setPassword(password);
        merge(u);
    }

    public final boolean activateAccount(final String email, final String hash)
            throws Exception {
        EntityManager em = emf.createEntityManager();
        Users u = (Users) em.createNamedQuery("Users.findByEmail").setParameter("email", email)
                .getSingleResult();
        System.out.println(u.getHash());
        if (u.getIsActivated()) {
            return false;
        } else {
            if (u.getHash().equals(hash)) {
                u.setIsActivated(true);
                merge(u);
                return true;
            }
        }
        return false;
    }

    public final String getEmailByUsername(final String username) throws IllegalArgumentException {
        return getUserByUsername(username).getEmail();
    }

    public final String getUsernameByEmail(final String email) throws Exception {
        Users u;
        try {
            EntityManager em = emf.createEntityManager();
            u = (Users) em.createNamedQuery("Users.findByEmail").setParameter("email", email).getResultList().get(0);
        } catch (NoResultException | ArrayIndexOutOfBoundsException e) {
            return null;
        }
        return u.getUsername();
    }

    public final List<Users> getAll() throws Exception {
        return emf.createEntityManager().createNamedQuery("Users.findAll").getResultList();
    }

    public final void setHashBasedOnUsername(final String username, final String hash) throws Exception {
        Users u = getUserByUsername(username);
        u.setHash(hash);
        merge(u);
    }

    public final List<Users> getEnabledUsers() throws Exception {
        return emf.createEntityManager().createQuery("SELECT u FROM Users u WHERE u.isDisabled = false AND u.role = 'User'").getResultList();
    }

    private Users getUserBasedOnEmail(final String email) throws Exception {
        List<Users> list = emf.createEntityManager().createNamedQuery("Users.findByEmail", Users.class).setParameter("email", email).getResultList();
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public final boolean setPasswordBasedOnEmail(final String email, final String password) throws Exception {
        Users u = getUserBasedOnEmail(email);
        u.setPassword(password);
        merge(u);
        return true;
    }

    public final void setPasswordToken(final String token, final String username) throws Exception {
        Users u = getUserByUsername(username);
        u.setPasswordToken(token);
        merge(u);
    }

    public final boolean checkIfExistUsernameOrEmail(final String username, final String email) throws Exception {
        Users u = getUserByUsername(username);
        if (u == null) {
            return false;
        }
        return getEmailByUsername(username) == null;
    }

}
