/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package smstest_gui;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "pestremedy", catalog = "coa", schema = "")
@NamedQueries({
    @NamedQuery(name = "Pestremedy.findAll", query = "SELECT p FROM Pestremedy p"),
    @NamedQuery(name = "Pestremedy.findBySno", query = "SELECT p FROM Pestremedy p WHERE p.sno = :sno"),
    @NamedQuery(name = "Pestremedy.findByPestID", query = "SELECT p FROM Pestremedy p WHERE p.pestID = :pestID"),
    @NamedQuery(name = "Pestremedy.findBySeverityLowerBound", query = "SELECT p FROM Pestremedy p WHERE p.severityLowerBound = :severityLowerBound"),
    @NamedQuery(name = "Pestremedy.findBySeverityUpperBound", query = "SELECT p FROM Pestremedy p WHERE p.severityUpperBound = :severityUpperBound"),
    @NamedQuery(name = "Pestremedy.findByChemical", query = "SELECT p FROM Pestremedy p WHERE p.chemical = :chemical"),
    @NamedQuery(name = "Pestremedy.findByDose", query = "SELECT p FROM Pestremedy p WHERE p.dose = :dose"),
    @NamedQuery(name = "Pestremedy.findByBiological", query = "SELECT p FROM Pestremedy p WHERE p.biological = :biological"),
    @NamedQuery(name = "Pestremedy.findByAgronomical", query = "SELECT p FROM Pestremedy p WHERE p.agronomical = :agronomical")})
public class Pestremedy implements Serializable {
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sno")
    private Integer sno;
    @Basic(optional = false)
    @Column(name = "PestID")
    private int pestID;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "SeverityLowerBound")
    private BigDecimal severityLowerBound;
    @Basic(optional = false)
    @Column(name = "SeverityUpperBound")
    private BigDecimal severityUpperBound;
    @Column(name = "Chemical")
    private String chemical;
    @Basic(optional = false)
    @Column(name = "Dose")
    private BigDecimal dose;
    @Column(name = "Biological")
    private String biological;
    @Column(name = "Agronomical")
    private String agronomical;

    public Pestremedy() {
    }

    public Pestremedy(Integer sno) {
        this.sno = sno;
    }

    public Pestremedy(Integer sno, int pestID, BigDecimal severityLowerBound, BigDecimal severityUpperBound, BigDecimal dose) {
        this.sno = sno;
        this.pestID = pestID;
        this.severityLowerBound = severityLowerBound;
        this.severityUpperBound = severityUpperBound;
        this.dose = dose;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        Integer oldSno = this.sno;
        this.sno = sno;
        changeSupport.firePropertyChange("sno", oldSno, sno);
    }

    public int getPestID() {
        return pestID;
    }

    public void setPestID(int pestID) {
        int oldPestID = this.pestID;
        this.pestID = pestID;
        changeSupport.firePropertyChange("pestID", oldPestID, pestID);
    }

    public BigDecimal getSeverityLowerBound() {
        return severityLowerBound;
    }

    public void setSeverityLowerBound(BigDecimal severityLowerBound) {
        BigDecimal oldSeverityLowerBound = this.severityLowerBound;
        this.severityLowerBound = severityLowerBound;
        changeSupport.firePropertyChange("severityLowerBound", oldSeverityLowerBound, severityLowerBound);
    }

    public BigDecimal getSeverityUpperBound() {
        return severityUpperBound;
    }

    public void setSeverityUpperBound(BigDecimal severityUpperBound) {
        BigDecimal oldSeverityUpperBound = this.severityUpperBound;
        this.severityUpperBound = severityUpperBound;
        changeSupport.firePropertyChange("severityUpperBound", oldSeverityUpperBound, severityUpperBound);
    }

    public String getChemical() {
        return chemical;
    }

    public void setChemical(String chemical) {
        String oldChemical = this.chemical;
        this.chemical = chemical;
        changeSupport.firePropertyChange("chemical", oldChemical, chemical);
    }

    public BigDecimal getDose() {
        return dose;
    }

    public void setDose(BigDecimal dose) {
        BigDecimal oldDose = this.dose;
        this.dose = dose;
        changeSupport.firePropertyChange("dose", oldDose, dose);
    }

    public String getBiological() {
        return biological;
    }

    public void setBiological(String biological) {
        String oldBiological = this.biological;
        this.biological = biological;
        changeSupport.firePropertyChange("biological", oldBiological, biological);
    }

    public String getAgronomical() {
        return agronomical;
    }

    public void setAgronomical(String agronomical) {
        String oldAgronomical = this.agronomical;
        this.agronomical = agronomical;
        changeSupport.firePropertyChange("agronomical", oldAgronomical, agronomical);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sno != null ? sno.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pestremedy)) {
            return false;
        }
        Pestremedy other = (Pestremedy) object;
        if ((this.sno == null && other.sno != null) || (this.sno != null && !this.sno.equals(other.sno))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "smstest_gui.Pestremedy[ sno=" + sno + " ]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }
    
}
