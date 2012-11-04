package quickstart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import quickstart.model.Cliente;

public class ClienteService extends GenericService<Cliente, Integer> {

	public ClienteService() {
		super(Cliente.class);
	}

	public Cliente findByCorreo(String correo,String contrasenia) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("correo", correo);
		map.put("contrasenia", contrasenia);
		System.out.println("buscando cliente con <correo,contrsenia>: <"+correo+","+contrasenia+">");
		List <Cliente> clientes = (ArrayList)this.getJpaTemplate().findByNamedQueryAndNamedParams("getClientePorCorreo", map);
		if(clientes.size() == 0){
			return null;
		}
		return clientes.get(0);
	}

	
}
