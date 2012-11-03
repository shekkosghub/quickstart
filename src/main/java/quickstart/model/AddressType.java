package quickstart.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="address_type")
public class AddressType extends GenericEntity {
	
	@Id
	@GeneratedValue(strategy=javax.persistence.GenerationType.AUTO)
	private Integer id;
	
	
	private String name;
	
	@OneToMany(mappedBy="addressType")
	private Set<Address> address = new HashSet<Address>();


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Set<Address> getAddress() {
		return address;
	}


	public void setAddress(Set<Address> address) {
		this.address = address;
	}
	
	

}
