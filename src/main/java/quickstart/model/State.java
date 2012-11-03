package quickstart.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="state")
public class State extends GenericEntity {
	
	@Id
	@GeneratedValue(strategy=javax.persistence.GenerationType.AUTO)
	private Integer id;
	
	private String name;
	
	@OneToMany(mappedBy="state")
	private Set<City> cities = new HashSet<City>();

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

	public Set<City> getCities() {
		return cities;
	}

	public void setCities(Set<City> cities) {
		this.cities = cities;
	}
	
	

}
