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
@Table(name = "Rooms")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Rooms.findAll", query = "SELECT r FROM Rooms r"),
    @NamedQuery(name = "Rooms.findByRoomID", query = "SELECT r FROM Rooms r WHERE r.roomID = :roomID"),
    @NamedQuery(name = "Rooms.findByRoomDescription", query = "SELECT r FROM Rooms r WHERE r.roomDescription = :roomDescription"),
    @NamedQuery(name = "Rooms.findByIsDisabled", query = "SELECT r FROM Rooms r WHERE r.isDisabled = :isDisabled"),
    @NamedQuery(name = "Rooms.findByCreationDate", query = "SELECT r FROM Rooms r WHERE r.creationDate = :creationDate")})
public class Rooms implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "RoomID")
    private Integer roomID;
    @Column(name = "RoomDescription")
    private String roomDescription;
    @Basic(optional = false)
    @Column(name = "isDisabled")
    private boolean isDisabled;
    @Basic(optional = false)
    @Column(name = "CreationDate")
    @Temporal(TemporalType.DATE)
    private Date creationDate;
    @OneToMany(mappedBy = "roomID")
    private List<EquipmentsUsingByUsers> equipmentsUsingByUsersList;
    @OneToMany(mappedBy = "roomID")
    private List<EquipmentsLocationHistory> equipmentsLocationHistoryList;

    public Rooms() {
    }

    public Rooms(Integer roomID) {
        this.roomID = roomID;
    }

    public Rooms(Integer roomID, boolean isDisabled, Date creationDate) {
        this.roomID = roomID;
        this.isDisabled = isDisabled;
        this.creationDate = creationDate;
    }

    public Integer getRoomID() {
        return roomID;
    }

    public void setRoomID(Integer roomID) {
        this.roomID = roomID;
    }

    public String getRoomDescription() {
        return roomDescription;
    }

    public void setRoomDescription(String roomDescription) {
        this.roomDescription = roomDescription;
    }

    public boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @XmlTransient
    public List<EquipmentsUsingByUsers> getEquipmentsUsingByUsersList() {
        return equipmentsUsingByUsersList;
    }

    public void setEquipmentsUsingByUsersList(List<EquipmentsUsingByUsers> equipmentsUsingByUsersList) {
        this.equipmentsUsingByUsersList = equipmentsUsingByUsersList;
    }

    @XmlTransient
    public List<EquipmentsLocationHistory> getEquipmentsLocationHistoryList() {
        return equipmentsLocationHistoryList;
    }

    public void setEquipmentsLocationHistoryList(List<EquipmentsLocationHistory> equipmentsLocationHistoryList) {
        this.equipmentsLocationHistoryList = equipmentsLocationHistoryList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roomID != null ? roomID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rooms)) {
            return false;
        }
        Rooms other = (Rooms) object;
        if ((this.roomID == null && other.roomID != null) || (this.roomID != null && !this.roomID.equals(other.roomID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bangmaple.dtos.Rooms[ roomID=" + roomID + " ]";
    }
    
}
