package quickstart.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.Action;

import quickstart.model.Cliente;
import quickstart.service.ClienteService;

public class AuthAction implements ServletResponseAware{
	private static Logger log = Logger.getLogger(AuthAction.class);
	private Cliente client;
	private ClienteService clientService;
	private HttpServletResponse response;
	
	
	public AuthAction(ClienteService clientService) {
		this.clientService = clientService;
	}
	
	public String login(){
		String res = Action.SUCCESS;
		
		this.client = clientService.findByCorreo(client.getCorreo(), client.getContrasenia());
		response.setContentType("text");
		if(this.client == null){
			log.error("No se encontro cliente");
			 
		     try {
				response.getWriter().print("<div>correo o contrase&ntilde;a incorrecta</div>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		     return null;
		}else{
			log.info("cliente id: "+this.client.getId());
			log.info("redirecionando(ajax) al panel de cliente");
			try {
				response.getWriter().print(this.client.getId());
				res = null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return res;
	}
	

	public Cliente getClient() {
		return client;
	}

	public void setClient(Cliente client) {
		this.client = client;
	}

	public ClienteService getClientService() {
		return clientService;
	}

	public void setClientService(ClienteService clientService) {
		this.clientService = clientService;
	}

	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
		
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	
	
	

}
