package quickstart.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@MappedSuperclass
public class GenericEntity {
	
	@Column(name="fecha_creacion",nullable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaCreacion;
	
	@Column(name="fecha_modificacion",nullable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaModificacion;
	
	@Column(name="creado_por")
	private String creadoPor;
	
	@Column(name="modificado_por")
	private String modificadoPor;

	public String getCreadoPor() {
		return creadoPor;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public Date getFechaModificacion() {
		return fechaModificacion;
	}

	public String getModificadoPor() {
		return modificadoPor;
	}

	public void setCreadoPor(String creadoPor) {
		this.creadoPor = creadoPor;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public void setFechaModificacion(Date fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}

	public void setModificadoPor(String modificadoPor) {
		this.modificadoPor = modificadoPor;
	}
	
	@PrePersist
	protected void onCreate(){
		this.fechaCreacion = this.fechaModificacion = new Date();
		
	}
	
	@PreUpdate
	protected void onUpdate(){
		this.fechaModificacion = new Date();
	}
	

}
