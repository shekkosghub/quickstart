package quickstart.service;

import quickstart.model.State;

public class StateService extends GenericService<State, Integer> {

	public StateService(){
		super(State.class);
	}
}
