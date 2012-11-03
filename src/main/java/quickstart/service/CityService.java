package quickstart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import quickstart.model.City;

public class CityService extends GenericService<City, Integer> {

	public CityService(){
		super(City.class);
	}
	
	
	
	@Transactional(readOnly = true)
	public City findById(String id) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		return (City) (this.getJpaTemplate().findByNamedQueryAndNamedParams("getCityById", map)).get(0);
	}



	public ArrayList<City> getCitiesByState(Integer id){
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("idstate", id);
		return (ArrayList<City>) this.getJpaTemplate().findByNamedQueryAndNamedParams("getCitiesByStateId", map);
	}
}
