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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "EquipmentsUsingByUsers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EquipmentsUsingByUsers.findAll", query = "SELECT e FROM EquipmentsUsingByUsers e"),
    @NamedQuery(name = "EquipmentsUsingByUsers.findByEquipByUserID", query = "SELECT e FROM EquipmentsUsingByUsers e WHERE e.equipByUserID = :equipByUserID"),
    @NamedQuery(name = "EquipmentsUsingByUsers.findByEquipDateBought", query = "SELECT e FROM EquipmentsUsingByUsers e WHERE e.equipDateBought = :equipDateBought"),
    @NamedQuery(name = "EquipmentsUsingByUsers.findByEquipDateWarranty", query = "SELECT e FROM EquipmentsUsingByUsers e WHERE e.equipDateWarranty = :equipDateWarranty"),
    @NamedQuery(name = "EquipmentsUsingByUsers.findByEquipStatus", query = "SELECT e FROM EquipmentsUsingByUsers e WHERE e.equipStatus = :equipStatus"),
    @NamedQuery(name = "EquipmentsUsingByUsers.findByNumOfRepair", query = "SELECT e FROM EquipmentsUsingByUsers e WHERE e.numOfRepair = :numOfRepair"),
    @NamedQuery(name = "EquipmentsUsingByUsers.findByEquipReqID", query = "SELECT e FROM EquipmentsUsingByUsers e WHERE e.equipReqID = :equipReqID")})
public class EquipmentsUsingByUsers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "EquipByUserID")
    private Integer equipByUserID;
    @Column(name = "EquipDateBought")
    @Temporal(TemporalType.DATE)
    private Date equipDateBought;
    @Column(name = "EquipDateWarranty")
    @Temporal(TemporalType.DATE)
    private Date equipDateWarranty;
    @Column(name = "EquipStatus")
    private String equipStatus;
    @Column(name = "NumOfRepair")
    private Integer numOfRepair;
    @Column(name = "EquipReqID")
    private Integer equipReqID;
    @JoinColumn(name = "EquipID", referencedColumnName = "EquipID")
    @ManyToOne
    private Equipments equipID;
    @JoinColumn(name = "RoomID", referencedColumnName = "RoomID")
    @ManyToOne
    private Rooms roomID;
    @JoinColumn(name = "Username", referencedColumnName = "Username")
    @ManyToOne(optional = false)
    private Users username;
    @JoinColumn(name = "UsernameResponse", referencedColumnName = "Username")
    @ManyToOne
    private Users usernameResponse;
    @OneToMany(mappedBy = "equipByUserID")
    private List<EquipmentsLocationHistory> equipmentsLocationHistoryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "equipByUserID")
    private List<EquipmentsReq> equipmentsReqList;

    public EquipmentsUsingByUsers() {
    }

    public EquipmentsUsingByUsers(Integer equipByUserID) {
        this.equipByUserID = equipByUserID;
    }

    public Integer getEquipByUserID() {
        return equipByUserID;
    }

    public void setEquipByUserID(Integer equipByUserID) {
        this.equipByUserID = equipByUserID;
    }

    public Date getEquipDateBought() {
        return equipDateBought;
    }

    public void setEquipDateBought(Date equipDateBought) {
        this.equipDateBought = equipDateBought;
    }

    public Date getEquipDateWarranty() {
        return equipDateWarranty;
    }

    public void setEquipDateWarranty(Date equipDateWarranty) {
        this.equipDateWarranty = equipDateWarranty;
    }

    public String getEquipStatus() {
        return equipStatus;
    }

    public void setEquipStatus(String equipStatus) {
        this.equipStatus = equipStatus;
    }

    public Integer getNumOfRepair() {
        return numOfRepair;
    }

    public void setNumOfRepair(Integer numOfRepair) {
        this.numOfRepair = numOfRepair;
    }

    public Integer getEquipReqID() {
        return equipReqID;
    }

    public void setEquipReqID(Integer equipReqID) {
        this.equipReqID = equipReqID;
    }

    public Equipments getEquipID() {
        return equipID;
    }

    public void setEquipID(Equipments equipID) {
        this.equipID = equipID;
    }

    public Rooms getRoomID() {
        return roomID;
    }

    public void setRoomID(Rooms roomID) {
        this.roomID = roomID;
    }

    public Users getUsername() {
        return username;
    }

    public void setUsername(Users username) {
        this.username = username;
    }

    public Users getUsernameResponse() {
        return usernameResponse;
    }

    public void setUsernameResponse(Users usernameResponse) {
        this.usernameResponse = usernameResponse;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (equipByUserID != null ? equipByUserID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EquipmentsUsingByUsers)) {
            return false;
        }
        EquipmentsUsingByUsers other = (EquipmentsUsingByUsers) object;
        if ((this.equipByUserID == null && other.equipByUserID != null) || (this.equipByUserID != null && !this.equipByUserID.equals(other.equipByUserID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bangmaple.dtos.EquipmentsUsingByUsers[ equipByUserID=" + equipByUserID + " ]";
    }
    
}
