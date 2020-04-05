/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.dtos;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author bangmaple
 */
@Entity
@Table(name = "Users")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findByUsername", query = "SELECT u FROM Users u WHERE u.username = :username"),
    @NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password"),
    @NamedQuery(name = "Users.findByFullname", query = "SELECT u FROM Users u WHERE u.fullname = :fullname"),
    @NamedQuery(name = "Users.findByDoB", query = "SELECT u FROM Users u WHERE u.doB = :doB"),
    @NamedQuery(name = "Users.findByRole", query = "SELECT u FROM Users u WHERE u.role = :role"),
    @NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
    @NamedQuery(name = "Users.findByAvatarImage", query = "SELECT u FROM Users u WHERE u.avatarImage = :avatarImage"),
    @NamedQuery(name = "Users.findByHash", query = "SELECT u FROM Users u WHERE u.hash = :hash"),
    @NamedQuery(name = "Users.findByIsActivated", query = "SELECT u FROM Users u WHERE u.isActivated = :isActivated"),
    @NamedQuery(name = "Users.findByCreationDate", query = "SELECT u FROM Users u WHERE u.creationDate = :creationDate"),
    @NamedQuery(name = "Users.findByIsDisabled", query = "SELECT u FROM Users u WHERE u.isDisabled = :isDisabled"),
    @NamedQuery(name = "Users.findByPasswordToken", query = "SELECT u FROM Users u WHERE u.passwordToken = :passwordToken")})
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Username")
    private String username;
    @Basic(optional = false)
    @Column(name = "Password")
    private String password;
    @Column(name = "Fullname")
    private String fullname;
    @Column(name = "DoB")
    @Temporal(TemporalType.DATE)
    private Date doB;
    @Basic(optional = false)
    @Column(name = "Role")
    private String role;
    @Column(name = "Email")
    private String email;
    @Column(name = "AvatarImage")
    private String avatarImage;
    @Column(name = "Hash")
    private String hash;
    @Basic(optional = false)
    @Column(name = "isActivated")
    private boolean isActivated;
    @Column(name = "CreationDate")
    @Temporal(TemporalType.DATE)
    private Date creationDate;
    @Column(name = "isDisabled")
    private Boolean isDisabled;
    @Column(name = "PasswordToken")
    private String passwordToken;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "username")
    private List<EquipmentsUsingByUsers> equipmentsUsingByUsersList;
    @OneToMany(mappedBy = "usernameResponse")
    private List<EquipmentsUsingByUsers> equipmentsUsingByUsersList1;
    @OneToMany(mappedBy = "usernameChange")
    private List<EquipmentsLocationHistory> equipmentsLocationHistoryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usernameRequest")
    private List<EquipmentsReq> equipmentsReqList;
    @OneToMany(mappedBy = "usernameResponse")
    private List<EquipmentsReq> equipmentsReqList1;

    public Users() {
    }

    public Users(String username) {
        this.username = username;
    }

    public Users(String username, String password, String role, boolean isActivated) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.isActivated = isActivated;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getDoB() {
        return doB;
    }

    public void setDoB(Date doB) {
        this.doB = doB;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatarImage() {
        return avatarImage;
    }

    public void setAvatarImage(String avatarImage) {
        this.avatarImage = avatarImage;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public boolean getIsActivated() {
        return isActivated;
    }

    public void setIsActivated(boolean isActivated) {
        this.isActivated = isActivated;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

    public String getPasswordToken() {
        return passwordToken;
    }

    public void setPasswordToken(String passwordToken) {
        this.passwordToken = passwordToken;
    }

    @XmlTransient
    public List<EquipmentsUsingByUsers> getEquipmentsUsingByUsersList() {
        return equipmentsUsingByUsersList;
    }

    public void setEquipmentsUsingByUsersList(List<EquipmentsUsingByUsers> equipmentsUsingByUsersList) {
        this.equipmentsUsingByUsersList = equipmentsUsingByUsersList;
    }

    @XmlTransient
    public List<EquipmentsUsingByUsers> getEquipmentsUsingByUsersList1() {
        return equipmentsUsingByUsersList1;
    }

    public void setEquipmentsUsingByUsersList1(List<EquipmentsUsingByUsers> equipmentsUsingByUsersList1) {
        this.equipmentsUsingByUsersList1 = equipmentsUsingByUsersList1;
    }

    @XmlTransient
    public List<EquipmentsLocationHistory> getEquipmentsLocationHistoryList() {
        return equipmentsLocationHistoryList;
    }

    public void setEquipmentsLocationHistoryList(List<EquipmentsLocationHistory> equipmentsLocationHistoryList) {
        this.equipmentsLocationHistoryList = equipmentsLocationHistoryList;
    }

    @XmlTransient
    public List<EquipmentsReq> getEquipmentsReqList() {
        return equipmentsReqList;
    }

    public void setEquipmentsReqList(List<EquipmentsReq> equipmentsReqList) {
        this.equipmentsReqList = equipmentsReqList;
    }

    @XmlTransient
    public List<EquipmentsReq> getEquipmentsReqList1() {
        return equipmentsReqList1;
    }

    public void setEquipmentsReqList1(List<EquipmentsReq> equipmentsReqList1) {
        this.equipmentsReqList1 = equipmentsReqList1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (username != null ? username.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bangmaple.dtos.Users[ username=" + username + " ]";
    }
    
}
