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
@Table(name = "diseaseremedy", catalog = "coa", schema = "")
@NamedQueries({
    @NamedQuery(name = "Diseaseremedy.findAll", query = "SELECT d FROM Diseaseremedy d"),
    @NamedQuery(name = "Diseaseremedy.findBySno", query = "SELECT d FROM Diseaseremedy d WHERE d.sno = :sno"),
    @NamedQuery(name = "Diseaseremedy.findByDiseaseID", query = "SELECT d FROM Diseaseremedy d WHERE d.diseaseID = :diseaseID"),
    @NamedQuery(name = "Diseaseremedy.findBySeverityLowerBound", query = "SELECT d FROM Diseaseremedy d WHERE d.severityLowerBound = :severityLowerBound"),
    @NamedQuery(name = "Diseaseremedy.findBySeverityUpperBound", query = "SELECT d FROM Diseaseremedy d WHERE d.severityUpperBound = :severityUpperBound"),
    @NamedQuery(name = "Diseaseremedy.findByChemical", query = "SELECT d FROM Diseaseremedy d WHERE d.chemical = :chemical"),
    @NamedQuery(name = "Diseaseremedy.findByDose", query = "SELECT d FROM Diseaseremedy d WHERE d.dose = :dose"),
    @NamedQuery(name = "Diseaseremedy.findByBiological", query = "SELECT d FROM Diseaseremedy d WHERE d.biological = :biological"),
    @NamedQuery(name = "Diseaseremedy.findByAgronomical", query = "SELECT d FROM Diseaseremedy d WHERE d.agronomical = :agronomical")})
public class Diseaseremedy implements Serializable {
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Sno")
    private Integer sno;
    @Basic(optional = false)
    @Column(name = "DiseaseID")
    private int diseaseID;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "SeverityLowerBound")
    private BigDecimal severityLowerBound;
    @Column(name = "SeverityUpperBound")
    private BigDecimal severityUpperBound;
    @Column(name = "Chemical")
    private String chemical;
    @Column(name = "Dose")
    private BigDecimal dose;
    @Column(name = "Biological")
    private String biological;
    @Column(name = "Agronomical")
    private String agronomical;

    public Diseaseremedy() {
    }

    public Diseaseremedy(Integer sno) {
        this.sno = sno;
    }

    public Diseaseremedy(Integer sno, int diseaseID) {
        this.sno = sno;
        this.diseaseID = diseaseID;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        Integer oldSno = this.sno;
        this.sno = sno;
        changeSupport.firePropertyChange("sno", oldSno, sno);
    }

    public int getDiseaseID() {
        return diseaseID;
    }

    public void setDiseaseID(int diseaseID) {
        int oldDiseaseID = this.diseaseID;
        this.diseaseID = diseaseID;
        changeSupport.firePropertyChange("diseaseID", oldDiseaseID, diseaseID);
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
        if (!(object instanceof Diseaseremedy)) {
            return false;
        }
        Diseaseremedy other = (Diseaseremedy) object;
        if ((this.sno == null && other.sno != null) || (this.sno != null && !this.sno.equals(other.sno))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "smstest_gui.Diseaseremedy[ sno=" + sno + " ]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }
    
}
