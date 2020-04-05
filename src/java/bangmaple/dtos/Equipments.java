/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.dtos;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author bangmaple
 */
@Entity
@Table(name = "Equipments")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Equipments.findAll", query = "SELECT e FROM Equipments e"),
    @NamedQuery(name = "Equipments.findByEquipID", query = "SELECT e FROM Equipments e WHERE e.equipID = :equipID"),
    @NamedQuery(name = "Equipments.findByEquipName", query = "SELECT e FROM Equipments e WHERE e.equipName = :equipName"),
    @NamedQuery(name = "Equipments.findByEquipDescription", query = "SELECT e FROM Equipments e WHERE e.equipDescription = :equipDescription"),
    @NamedQuery(name = "Equipments.findByEquipImage", query = "SELECT e FROM Equipments e WHERE e.equipImage = :equipImage"),
    @NamedQuery(name = "Equipments.findByIsDisabled", query = "SELECT e FROM Equipments e WHERE e.isDisabled = :isDisabled"),
    @NamedQuery(name = "Equipments.findByEquipType", query = "SELECT e FROM Equipments e WHERE e.equipType = :equipType")})
public class Equipments implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "EquipID")
    private Integer equipID;
    @Basic(optional = false)
    @Column(name = "EquipName")
    private String equipName;
    @Column(name = "EquipDescription")
    private String equipDescription;
    @Column(name = "EquipImage")
    private String equipImage;
    @Column(name = "isDisabled")
    private Boolean isDisabled;
    @Column(name = "EquipType")
    private String equipType;
    @OneToMany(mappedBy = "equipID")
    private List<EquipmentsUsingByUsers> equipmentsUsingByUsersList;

    public Equipments() {
    }

    public Equipments(Integer equipID) {
        this.equipID = equipID;
    }

    public Equipments(Integer equipID, String equipName) {
        this.equipID = equipID;
        this.equipName = equipName;
    }

    public Integer getEquipID() {
        return equipID;
    }

    public void setEquipID(Integer equipID) {
        this.equipID = equipID;
    }

    public String getEquipName() {
        return equipName;
    }

    public void setEquipName(String equipName) {
        this.equipName = equipName;
    }

    public String getEquipDescription() {
        return equipDescription;
    }

    public void setEquipDescription(String equipDescription) {
        this.equipDescription = equipDescription;
    }

    public String getEquipImage() {
        return equipImage;
    }

    public void setEquipImage(String equipImage) {
        this.equipImage = equipImage;
    }

    public Boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

    public String getEquipType() {
        return equipType;
    }

    public void setEquipType(String equipType) {
        this.equipType = equipType;
    }

    @XmlTransient
    public List<EquipmentsUsingByUsers> getEquipmentsUsingByUsersList() {
        return equipmentsUsingByUsersList;
    }

    public void setEquipmentsUsingByUsersList(List<EquipmentsUsingByUsers> equipmentsUsingByUsersList) {
        this.equipmentsUsingByUsersList = equipmentsUsingByUsersList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (equipID != null ? equipID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Equipments)) {
            return false;
        }
        Equipments other = (Equipments) object;
        if ((this.equipID == null && other.equipID != null) || (this.equipID != null && !this.equipID.equals(other.equipID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bangmaple.dtos.Equipments[ equipID=" + equipID + " ]";
    }
    
}
