package quickstart.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;

import quickstart.model.Address;
import quickstart.model.City;
import quickstart.model.Cliente;
import quickstart.model.ClienteEstatus;
import quickstart.model.PersonType;
import quickstart.model.State;
import quickstart.service.CityService;
import quickstart.service.ClienteService;
import quickstart.service.PersonTypeService;
import quickstart.service.StateService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class ClienteAction implements Preparable {

	private static Logger log = Logger.getLogger(ClienteAction.class);
	private ClienteService service;
	private PersonTypeService personTypeService;
	private StateService stateService;
	private CityService cityService;
	private Integer id;
	private Cliente cliente;
	private List<Map<String, String>> personTypes = new ArrayList<Map<String, String>>();
	private Map<String,String> personType = new HashMap<String,String>();
	private Integer idstate;
	private String idcity;
	private Map<String,String> cities = new HashMap<String,String>();
	private Map<Integer,String> states = new HashMap<Integer,String>();
	private List<City> lstCities = new ArrayList<City>();
	
	
	public ClienteAction(ClienteService service,PersonTypeService personTypeService,StateService stateService,CityService cityService) {
		this.service = service;
		this.personTypeService = personTypeService;
		this.stateService = stateService;
		this.cityService = cityService;
	}


	public void prepare() throws Exception {
		if(this.id != null){
			cliente = service.findById(id);
		}

	}
	
	
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Cliente getCliente() {
		return cliente;
	}


	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}


	public String index(){
		List<PersonType> personTypes = new ArrayList<PersonType>();
		List<State> states = new ArrayList<State>();
		
		personTypes = this.personTypeService.findAll();
		for(PersonType personType:personTypes){
			this.personType.put(personType.getId(),personType.getDefinition());
		}
		
		states = this.stateService.findAll();
		for(State state : states){
			this.states.put(state.getId(),state.getName());
			if(state.getId() == 1){
				this.idstate = 1;
				ArrayList<City> list = this.cityService.getCitiesByState(idstate);
				for(City city: list){
					this.cities.put(city.getId(), city.getName());
				}
			}
		}
		
		return Action.SUCCESS;
	}
	
	public String loadStates(){
		List<State> states = new ArrayList<State>();
		states = this.stateService.findAll();
		for(State state : states){
			this.states.put(state.getId(),state.getName());
			
		}
		this.idstate = 1;
		return Action.SUCCESS;
	}
	public String getCitiesByState(){
		System.out.println("idstate>>>>>>> "+idstate);
		ArrayList<City> list = this.cityService.getCitiesByState(idstate);
		for(City city: list){
			this.lstCities.add(new City(city.getId(),city.getName()));
			
		}
		return Action.SUCCESS;
	}
	public String save(){
		String res = Action.SUCCESS;
		try{
			log.info("Iniciando el guardado del cliente con una direccion");
			log.info("Ciudad "+this.idcity);
			Address address = new Address();
			address.setCity(this.cityService.findById(idcity));
			address.setStreetAndNumber("prueba");
			address.setClient(cliente);
			this.cliente.getAddress().add(address);
			this.service.persist(cliente);
			log.info("Cliente guardado correctamente, id:"+this.cliente.getId());
		}catch(Exception e){
			res = Action.ERROR;
			log.error("ocurrio un error al intentar guardar el cliente", e);
			}
		return res;
	}
	
	public String entrarCliente(){
		String res = Action.SUCCESS;
		
		try{
		if(cliente.getContrasenia() == null && cliente.getCorreo() == null)
			return "login";
		}catch(NullPointerException e){
			return "login";
		}
		
		this.cliente = service.findByCorreo(cliente.getCorreo().trim(),cliente.getContrasenia().trim());
		if(this.cliente == null){
			res = "no_existe";
			return res;
		}
		System.out.println("this.cliente.getEstatus(): "+this.cliente.getEstatus());
		if(this.cliente.getEstatus().getEstatus().equals(ClienteEstatus.CREADO)){
			System.out.println("necesita_ser_activado");
			return "necesita_ser_activado";
		}
		
		if(this.cliente.getEstatus().getEstatus().equals(ClienteEstatus.ACTIVO)){
			System.out.println("mostrar_paneldecontrol");
			
		}
		
		return res;
	}


	public List<Map<String, String>> getPersonTypes() {
		return personTypes;
	}


	public void setPersonTypes(List<Map<String, String>> personTypes) {
		this.personTypes = personTypes;
	}


	public Map<String, String> getPersonType() {
		return personType;
	}


	public void setPersonType(Map<String, String> personType) {
		this.personType = personType;
	}


	public Integer getIdstate() {
		return idstate;
	}


	public void setIdstate(Integer idstate) {
		this.idstate = idstate;
	}


	public String getIdcity() {
		return idcity;
	}


	public void setIdcity(String idcity) {
		this.idcity = idcity;
	}


	public Map<String, String> getCities() {
		return cities;
	}


	public void setCities(Map<String, String> cities) {
		this.cities = cities;
	}


	public Map<Integer, String> getStates() {
		return states;
	}


	public void setStates(Map<Integer, String> states) {
		this.states = states;
	}


	public List<City> getLstCities() {
		return lstCities;
	}


	public void setLstCities(List<City> lstCities) {
		this.lstCities = lstCities;
	}
	
	
	
	
}
