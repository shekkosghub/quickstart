package quickstart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="cliente_estatus")
public class ClienteEstatus extends GenericEntity {

	public static final String CREADO = "CRDO";

	public static final String ACTIVO = "ACVO";

	@Id
	@Column(name="estatus")
	private String estatus;
	
	@Column
	private String descripcion;
	
	
	public ClienteEstatus(String estatus) {
		this.estatus = estatus;
	}
	
	public ClienteEstatus() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}



	

}
