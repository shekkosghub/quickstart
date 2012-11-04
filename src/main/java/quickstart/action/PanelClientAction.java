package quickstart.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.Action;

import quickstart.model.Cliente;
import quickstart.service.ClienteService;

public class PanelClientAction {

	private static final Logger log = Logger.getLogger(PanelClientAction.class);
	
	private Cliente client;
	private ClienteService clientService;
	private String idclient;

	public PanelClientAction(ClienteService clientService) {
		this.clientService = clientService;
	}
	
	public PanelClientAction(ClienteService clientService,Cliente client) {
		this.clientService = clientService;
		this.client = client;
	}
	
	public String execute(){
		String res = Action.SUCCESS;
		log.info("*********************");
		log.info("*********************");
		log.info("*********************");
		log.info("**"+this.idclient+"**");
		log.info("*********************");
		log.info("*********************");
		log.info("*********************");
		
		this.client = this.clientService.findById(Integer.valueOf(idclient));
			log.info("logeado con cliente id: "+this.idclient);
		return res;
	}

	public Cliente getClient() {
		return client;
	}

	public void setClient(Cliente client) {
		this.client = client;
	}

	public String getIdclient() {
		return idclient;
	}

	public void setIdclient(String idclient) {
		this.idclient = idclient;
	}

	
	
}
