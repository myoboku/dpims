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
@Table(name = "problems", catalog = "coa", schema = "")
@NamedQueries({
    @NamedQuery(name = "Problems.findAll", query = "SELECT p FROM Problems p"),
    @NamedQuery(name = "Problems.findById", query = "SELECT p FROM Problems p WHERE p.id = :id"),
    @NamedQuery(name = "Problems.findByTableName", query = "SELECT p FROM Problems p WHERE p.tableName = :tableName")})
public class Problems implements Serializable {
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Column(name = "TableName")
    private String tableName;

    public Problems() {
    }

    public Problems(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        String oldId = this.id;
        this.id = id;
        changeSupport.firePropertyChange("id", oldId, id);
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        String oldTableName = this.tableName;
        this.tableName = tableName;
        changeSupport.firePropertyChange("tableName", oldTableName, tableName);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Problems)) {
            return false;
        }
        Problems other = (Problems) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "smstest_gui.Problems[ id=" + id + " ]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }
    
}
