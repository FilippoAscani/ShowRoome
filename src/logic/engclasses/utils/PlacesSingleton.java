package logic.engclasses.utils;

import java.util.ArrayList;
import java.util.List;

public class PlacesSingleton {

private static PlacesSingleton instance = null;

private int dim; //dimensione array places
private List<String> places = new ArrayList<>();

protected PlacesSingleton(int dim) {
	this.dim = dim;
	this.places.add(0, "Villa");
	this.places.add(1, "Pigneto");
	this.places.add(2, "Eur");
	this.places.add(3, "Statuario");
}



public String getPlace(int index) {
	return instance.places.get(index);
}

public int getDim() {
	return instance.dim;
}

public static synchronized PlacesSingleton getSingletonInstance() {
	if (PlacesSingleton.instance == null)
		PlacesSingleton.instance = new PlacesSingleton(4);		
	return instance;
}
	
}
