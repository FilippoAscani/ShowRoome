package logic.controller.appcontroller.login;

import logic.engclasses.dao.ArtistDao;
import logic.engclasses.dao.GeneralUserDao;
import logic.engclasses.dao.SponsorDao;
import logic.engclasses.exceptions.DuplicateUsernameException;

public class Register {

	GeneralUserDao gud = new GeneralUserDao();
	ArtistDao ad = new ArtistDao();
	SponsorDao sd = new SponsorDao();
	public void artistReg(String username, String password, String email, String description, String talent) {
		ad.registerArtist(username, password, email, description, talent);
	}
	
	public void userReg(String username, String password) throws DuplicateUsernameException {
		gud.register(this.newUserId(), username, password);
	}
	
	public void sponsorReg(String username, String password, String activity, String capacity, String description) {
		sd.registerSponsor(username, password, activity, capacity, description);
	}
	
	public int newUserId() {
		return gud.getMaxId() + 1;
	}
	
}
