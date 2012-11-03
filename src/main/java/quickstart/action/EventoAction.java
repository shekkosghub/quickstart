package quickstart.action;

import quickstart.model.Evento;
import quickstart.service.EventoService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class EventoAction implements Preparable{
	
	private Integer id;
	private Evento evento;
	private EventoService service;
	
	
	public EventoAction(EventoService service) {
		this.service = service;
	}


	public Evento getEvento() {
		return evento;
	}


	public void setEvento(Evento evento) {
		this.evento = evento;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public void prepare() throws Exception {
		if(id != null){
			evento = service.findById(id);
		}
		
	}
	
	public String index(){
		return Action.SUCCESS;
	}
	
	public String save(){
		String res = Action.SUCCESS;
		System.out.println(evento.getTitulo());
		System.out.println(evento.getDescripcion());
		try{
			service.persist(evento);
			System.out.println(evento.getId());
		}catch(Exception e){
			e.printStackTrace();
			res = Action.ERROR;
		}
		return res;
	}

}
