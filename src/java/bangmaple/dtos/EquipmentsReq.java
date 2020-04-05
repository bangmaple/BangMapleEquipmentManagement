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
@Table(name = "EquipmentsReq")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EquipmentsReq.findAll", query = "SELECT e FROM EquipmentsReq e"),
    @NamedQuery(name = "EquipmentsReq.findByEquipReqID", query = "SELECT e FROM EquipmentsReq e WHERE e.equipReqID = :equipReqID"),
    @NamedQuery(name = "EquipmentsReq.findByRepairRequestDescription", query = "SELECT e FROM EquipmentsReq e WHERE e.repairRequestDescription = :repairRequestDescription"),
    @NamedQuery(name = "EquipmentsReq.findByRepairRequestDate", query = "SELECT e FROM EquipmentsReq e WHERE e.repairRequestDate = :repairRequestDate"),
    @NamedQuery(name = "EquipmentsReq.findByRepairResponseDescription", query = "SELECT e FROM EquipmentsReq e WHERE e.repairResponseDescription = :repairResponseDescription"),
    @NamedQuery(name = "EquipmentsReq.findByRepairStartDate", query = "SELECT e FROM EquipmentsReq e WHERE e.repairStartDate = :repairStartDate"),
    @NamedQuery(name = "EquipmentsReq.findByRepairEndDate", query = "SELECT e FROM EquipmentsReq e WHERE e.repairEndDate = :repairEndDate"),
    @NamedQuery(name = "EquipmentsReq.findByRepairResult", query = "SELECT e FROM EquipmentsReq e WHERE e.repairResult = :repairResult")})
public class EquipmentsReq implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "EquipReqID")
    private Integer equipReqID;
    @Column(name = "RepairRequestDescription")
    private String repairRequestDescription;
    @Basic(optional = false)
    @Column(name = "RepairRequestDate")
    @Temporal(TemporalType.DATE)
    private Date repairRequestDate;
    @Column(name = "RepairResponseDescription")
    private String repairResponseDescription;
    @Column(name = "RepairStartDate")
    @Temporal(TemporalType.DATE)
    private Date repairStartDate;
    @Column(name = "RepairEndDate")
    @Temporal(TemporalType.DATE)
    private Date repairEndDate;
    @Column(name = "RepairResult")
    private String repairResult;
    @JoinColumn(name = "EquipByUserID", referencedColumnName = "EquipByUserID")
    @ManyToOne(optional = false)
    private EquipmentsUsingByUsers equipByUserID;
    @JoinColumn(name = "UsernameRequest", referencedColumnName = "Username")
    @ManyToOne(optional = false)
    private Users usernameRequest;
    @JoinColumn(name = "UsernameResponse", referencedColumnName = "Username")
    @ManyToOne
    private Users usernameResponse;

    public EquipmentsReq() {
    }

    public EquipmentsReq(Integer equipReqID) {
        this.equipReqID = equipReqID;
    }

    public EquipmentsReq(Integer equipReqID, Date repairRequestDate) {
        this.equipReqID = equipReqID;
        this.repairRequestDate = repairRequestDate;
    }

    public Integer getEquipReqID() {
        return equipReqID;
    }

    public void setEquipReqID(Integer equipReqID) {
        this.equipReqID = equipReqID;
    }

    public String getRepairRequestDescription() {
        return repairRequestDescription;
    }

    public void setRepairRequestDescription(String repairRequestDescription) {
        this.repairRequestDescription = repairRequestDescription;
    }

    public Date getRepairRequestDate() {
        return repairRequestDate;
    }

    public void setRepairRequestDate(Date repairRequestDate) {
        this.repairRequestDate = repairRequestDate;
    }

    public String getRepairResponseDescription() {
        return repairResponseDescription;
    }

    public void setRepairResponseDescription(String repairResponseDescription) {
        this.repairResponseDescription = repairResponseDescription;
    }

    public Date getRepairStartDate() {
        return repairStartDate;
    }

    public void setRepairStartDate(Date repairStartDate) {
        this.repairStartDate = repairStartDate;
    }

    public Date getRepairEndDate() {
        return repairEndDate;
    }

    public void setRepairEndDate(Date repairEndDate) {
        this.repairEndDate = repairEndDate;
    }

    public String getRepairResult() {
        return repairResult;
    }

    public void setRepairResult(String repairResult) {
        this.repairResult = repairResult;
    }

    public EquipmentsUsingByUsers getEquipByUserID() {
        return equipByUserID;
    }

    public void setEquipByUserID(EquipmentsUsingByUsers equipByUserID) {
        this.equipByUserID = equipByUserID;
    }

    public Users getUsernameRequest() {
        return usernameRequest;
    }

    public void setUsernameRequest(Users usernameRequest) {
        this.usernameRequest = usernameRequest;
    }

    public Users getUsernameResponse() {
        return usernameResponse;
    }

    public void setUsernameResponse(Users usernameResponse) {
        this.usernameResponse = usernameResponse;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (equipReqID != null ? equipReqID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EquipmentsReq)) {
            return false;
        }
        EquipmentsReq other = (EquipmentsReq) object;
        if ((this.equipReqID == null && other.equipReqID != null) || (this.equipReqID != null && !this.equipReqID.equals(other.equipReqID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bangmaple.dtos.EquipmentsReq[ equipReqID=" + equipReqID + " ]";
    }
    
}
