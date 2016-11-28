/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package smstest_gui;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Devil
 */
@Entity
@Table(name = "crops", catalog = "coa", schema = "")
@NamedQueries({
    @NamedQuery(name = "Crops_1.findAll", query = "SELECT c FROM Crops_1 c"),
    @NamedQuery(name = "Crops_1.findByCropID", query = "SELECT c FROM Crops_1 c WHERE c.cropID = :cropID"),
    @NamedQuery(name = "Crops_1.findByName", query = "SELECT c FROM Crops_1 c WHERE c.name = :name"),
    @NamedQuery(name = "Crops_1.findByDataTableName", query = "SELECT c FROM Crops_1 c WHERE c.dataTableName = :dataTableName")})
public class Crops_1 implements Serializable {
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "CropID")
    private String cropID;
    @Column(name = "Name")
    private String name;
    @Column(name = "DataTableName")
    private String dataTableName;

    public Crops_1() {
    }

    public Crops_1(String cropID) {
        this.cropID = cropID;
    }

    public String getCropID() {
        return cropID;
    }

    public void setCropID(String cropID) {
        String oldCropID = this.cropID;
        this.cropID = cropID;
        changeSupport.firePropertyChange("cropID", oldCropID, cropID);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        String oldName = this.name;
        this.name = name;
        changeSupport.firePropertyChange("name", oldName, name);
    }

    public String getDataTableName() {
        return dataTableName;
    }

    public void setDataTableName(String dataTableName) {
        String oldDataTableName = this.dataTableName;
        this.dataTableName = dataTableName;
        changeSupport.firePropertyChange("dataTableName", oldDataTableName, dataTableName);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cropID != null ? cropID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Crops_1)) {
            return false;
        }
        Crops_1 other = (Crops_1) object;
        if ((this.cropID == null && other.cropID != null) || (this.cropID != null && !this.cropID.equals(other.cropID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "smstest_gui.Crops_1[ cropID=" + cropID + " ]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }
    
}
