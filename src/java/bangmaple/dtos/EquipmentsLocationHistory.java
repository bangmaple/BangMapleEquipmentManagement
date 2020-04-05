/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.dtos;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author bangmaple
 */
@Entity
@Table(name = "EquipmentsLocationHistory")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EquipmentsLocationHistory.findAll", query = "SELECT e FROM EquipmentsLocationHistory e"),
    @NamedQuery(name = "EquipmentsLocationHistory.findByEquipLocHistoryID", query = "SELECT e FROM EquipmentsLocationHistory e WHERE e.equipLocHistoryID = :equipLocHistoryID"),
    @NamedQuery(name = "EquipmentsLocationHistory.findByDateChange", query = "SELECT e FROM EquipmentsLocationHistory e WHERE e.dateChange = :dateChange"),
    @NamedQuery(name = "EquipmentsLocationHistory.findByChangeLocationDescription", query = "SELECT e FROM EquipmentsLocationHistory e WHERE e.changeLocationDescription = :changeLocationDescription")})
public class EquipmentsLocationHistory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "EquipLocHistoryID")
    private Integer equipLocHistoryID;
    @Column(name = "DateChange")
    @Temporal(TemporalType.DATE)
    private Date dateChange;
    @Column(name = "ChangeLocationDescription")
    private String changeLocationDescription;
    @JoinColumn(name = "EquipByUserID", referencedColumnName = "EquipByUserID")
    @ManyToOne
    private EquipmentsUsingByUsers equipByUserID;
    @JoinColumn(name = "RoomID", referencedColumnName = "RoomID")
    @ManyToOne
    private Rooms roomID;
    @JoinColumn(name = "UsernameChange", referencedColumnName = "Username")
    @ManyToOne
    private Users usernameChange;

    public EquipmentsLocationHistory() {
    }

    public EquipmentsLocationHistory(Integer equipLocHistoryID) {
        this.equipLocHistoryID = equipLocHistoryID;
    }

    public Integer getEquipLocHistoryID() {
        return equipLocHistoryID;
    }

    public void setEquipLocHistoryID(Integer equipLocHistoryID) {
        this.equipLocHistoryID = equipLocHistoryID;
    }

    public Date getDateChange() {
        return dateChange;
    }

    public void setDateChange(Date dateChange) {
        this.dateChange = dateChange;
    }

    public String getChangeLocationDescription() {
        return changeLocationDescription;
    }

    public void setChangeLocationDescription(String changeLocationDescription) {
        this.changeLocationDescription = changeLocationDescription;
    }

    public EquipmentsUsingByUsers getEquipByUserID() {
        return equipByUserID;
    }

    public void setEquipByUserID(EquipmentsUsingByUsers equipByUserID) {
        this.equipByUserID = equipByUserID;
    }

    public Rooms getRoomID() {
        return roomID;
    }

    public void setRoomID(Rooms roomID) {
        this.roomID = roomID;
    }

    public Users getUsernameChange() {
        return usernameChange;
    }

    public void setUsernameChange(Users usernameChange) {
        this.usernameChange = usernameChange;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (equipLocHistoryID != null ? equipLocHistoryID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EquipmentsLocationHistory)) {
            return false;
        }
        EquipmentsLocationHistory other = (EquipmentsLocationHistory) object;
        if ((this.equipLocHistoryID == null && other.equipLocHistoryID != null) || (this.equipLocHistoryID != null && !this.equipLocHistoryID.equals(other.equipLocHistoryID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bangmaple.dtos.EquipmentsLocationHistory[ equipLocHistoryID=" + equipLocHistoryID + " ]";
    }
    
}
