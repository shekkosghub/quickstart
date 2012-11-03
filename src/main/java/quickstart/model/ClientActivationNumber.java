package quickstart.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="client_activation_number")
public class ClientActivationNumber extends GenericEntity {
	
	@Id
	@Column(name="activation_number")
	private Integer activationNumber;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "id")
	private Cliente client;

	public Integer getActivationNumber() {
		return activationNumber;
	}

	public void setActivationNumber(Integer activationNumber) {
		this.activationNumber = activationNumber;
	}

	public Cliente getClient() {
		return client;
	}

	public void setClient(Cliente client) {
		this.client = client;
	}
	
	

}
