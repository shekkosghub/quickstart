package quickstart.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@NamedQueries({
	@NamedQuery(name="getCitiesByStateId",query="from City where idstate = :idstate"),
	@NamedQuery(name="getCityById",query="from City where id = :id")
	})
@Table(name="city")
public class City extends GenericEntity {
	
	@Id
	private String id;
	
	private String name;
	
	@OneToMany(mappedBy="city")
    private Set<Address> addresses = new HashSet<Address>();
	
	@ManyToOne
	@JoinColumn(name="idstate")
	private State state;
	
	

	public City() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public City(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}
	
	

}
