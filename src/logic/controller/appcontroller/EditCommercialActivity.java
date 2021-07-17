package logic.controller.appcontroller;

import java.util.List;

import logic.engclasses.bean.SponsoredShowBean;
import logic.engclasses.dao.SponsorDao;
import logic.engclasses.dao.SponsoredShowDao;
import logic.model.SponsoredShow;

public class EditCommercialActivity {

	public void delete(String host) {
		SponsoredShowDao ssd = new SponsoredShowDao();
		ssd.dismissShow(host);
	}
	
	
	public SponsoredShowBean getLiveSShow(String spns) {
		SponsoredShowDao ssd1 = new SponsoredShowDao();
		SponsoredShowBean ssb = new SponsoredShowBean();
		List<SponsoredShow> lss = ssd1.getSponsoredShows();
		SponsoredShow ss = null;
		for(int i=0; i<lss.size(); i++) {
			if(lss.get(i).getSponsor().equals(spns)) {
				ss=lss.get(i);
			}
		}
		
		if(ss!=null) {
			ssb.setTitle(ss.getTitle());
			ssb.setDescription(ss.getDescription());
		}
		
		
		return ssb;
		
	}
	
	public void editInfo(String usnm, String activity, String capacity ,String description) {
		SponsorDao sd3 = new SponsorDao();
		sd3.updateSponsor(usnm, activity, capacity, description);
	}
}
