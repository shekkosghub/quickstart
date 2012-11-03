package quickstart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="address")
public class Address extends GenericEntity {
	
	@Id
	@GeneratedValue(strategy=javax.persistence.GenerationType.AUTO)
	private Integer id;
	
	@Column(name="street_and_number")
	private String streetAndNumber;
	
	@Column(name="zip_code")
	private String zipCode;
	
	@Column(name="suburb")
	private String suburb;
	
	@ManyToOne
	@JoinColumn(name="idcity")
	private City city;
	
	@ManyToOne
	@JoinColumn(name="idaddress_type")
	private AddressType addressType;
	
	@ManyToOne
	@JoinColumn(name="idcliente")
	private Cliente client;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStreetAndNumber() {
		return streetAndNumber;
	}

	public void setStreetAndNumber(String streetAndNumber) {
		this.streetAndNumber = streetAndNumber;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getSuburb() {
		return suburb;
	}

	public void setSuburb(String suburb) {
		this.suburb = suburb;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public AddressType getAddressType() {
		return addressType;
	}

	public void setAddressType(AddressType addressType) {
		this.addressType = addressType;
	}

	public Cliente getClient() {
		return client;
	}

	public void setClient(Cliente client) {
		this.client = client;
	}
	
	
	
	

}
