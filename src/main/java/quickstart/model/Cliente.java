package quickstart.model;

import java.sql.Time;
import java.text.ParseException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import quickstart.util.DateUtil;

@Entity
@NamedQueries({
	@NamedQuery(name="getClientePorCorreo",query="from Cliente where correo = :correo and contrasenia = :contrasenia")
	})
@Table(name="cliente")
public class Cliente extends GenericEntity {

	@Id
	@GeneratedValue(strategy=javax.persistence.GenerationType.AUTO)
	private Integer id;
	
	@Column(nullable=false)
	private String nombre;
	
	@Column(name="apellido_paterno")
	private String apellidoPaterno;
	
	@Column(name="apellido_materno")
	private String apellidoMaterno;
	
	@Column(nullable=false,unique=true)
	private String correo;
	
	@Column(name="contrasenia")
	private String contrasenia;

	@OneToOne
	@JoinColumn(name="estatus")
	private ClienteEstatus estatus;
	
	@Column(name="fecha_activacion")
	@Temporal(TemporalType.DATE)
	private Date fechaActivacion;
	
	//@Column(name="hora_activacion")
	@Transient
	private Time horaDeActivacion;
	
		
	@OneToMany(fetch=FetchType.LAZY,mappedBy="cliente",cascade = {CascadeType.PERSIST,CascadeType.MERGE })
	private Set<Evento>Eventos = new HashSet<Evento>();
	
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name="person_type")
	private PersonType personType;
	
	
	@Column(name="birth_date")
	@Temporal(TemporalType.DATE)
	private Date birthDate;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="client",cascade = {CascadeType.PERSIST,CascadeType.MERGE })
	private Set<Address> address = new HashSet<Address>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public ClienteEstatus getEstatus() {
		return estatus;
	}

	public void setEstatus(ClienteEstatus estatus) {
		this.estatus = estatus;
	}

	public Date getFechaActivacion() {
		return fechaActivacion;
	}

	public void setFechaActivacion(Date fechaActivacion) {
		this.fechaActivacion = fechaActivacion;
	}

	public Time getHoraDeActivacion() {
		return horaDeActivacion;
	}

	public void setHoraDeActivacion(Time horaDeActivacion) {
		this.horaDeActivacion = horaDeActivacion;
	}

	public Set<Evento> getEventos() {
		return Eventos;
	}

	public void setEventos(Set<Evento> eventos) {
		Eventos = eventos;
	}

	public PersonType getPersonType() {
		return personType;
	}

	public void setPersonType(PersonType personType) {
		this.personType = personType;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}



	public Set<Address> getAddress() {
		return address;
	}

	public void setAddress(Set<Address> address) {
		this.address = address;
	}

	public void setBirthDate(String birthDate) {
		try {
			this.birthDate = DateUtil.stringToDate(birthDate, DateUtil.FORMAT_YYMMDD);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.birthDate = null;
		}
	}
	
	//todos nacen como activados
	@PrePersist
	public void onCreate(){
		this.estatus = new ClienteEstatus(ClienteEstatus.ACTIVO);
		this.setFechaCreacion(new Date());
		this.setFechaModificacion(this.getFechaCreacion());
		
	}

	
	
}
