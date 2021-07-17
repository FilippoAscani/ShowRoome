package logic.controller.guicontroller.hostprivateshow;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import logic.controller.appcontroller.HostPrivateShow;
import logic.engclasses.bean.LoggedBean;
import logic.engclasses.bean.RequestedShowBean;
import logic.engclasses.exceptions.DescriptionTooLongException;
import logic.engclasses.exceptions.ExceptionView;
import logic.engclasses.utils.ExceptionFactory;
import logic.engclasses.utils.Session;
import logic.engclasses.utils.TypeException;



public class GuiControllerRequestsSponsor implements Initializable{

	protected Session bsrs;
	protected LoggedBean lbrs;
	 public GuiControllerRequestsSponsor(Session bsrs){
	 	this.bsrs = bsrs;
	 	lbrs=bsrs.getLoggedBean();
	 }
	
	@FXML
    private AnchorPane rootpane5;

    @FXML
    private AnchorPane mainPane;

    @FXML
    private AnchorPane infoPane;

    @FXML
    private Label descriptionShowLabel;

    @FXML
    private Label titleLabel;

    @FXML
    private Label artistLabel;

    @FXML
    private Label pendingLabel;

    @FXML
    private Label accepptedLabel;

    @FXML
    private Label refusedLabel;

    @FXML
    private Label partnerLabel;

    @FXML
    private Label pendingLabel1;

    @FXML
    private Label accepptedLabel1;

    @FXML
    private Label refusedLabel1;

    @FXML
    private Button startButton;

    @FXML
    private Button dismissButton;

    @FXML
    void dismissButton(ActionEvent event) {
    	//to be implemented
    }

    @FXML
    void startButton(ActionEvent event) throws IOException {
    	String partner;
    	if(partnerLabel.getText().equals("no other sponsors are involved")) {
    		partner="no";
    	}
    	else {
    		partner=partnerLabel.getText();
    	}
    	HostPrivateShow rac = new HostPrivateShow();
    	try {
			rac.hostSponsoredShow(titleLabel.getText(), artistLabel.getText(), lbrs.getUsername(), lbrs.getActivity(), lbrs.getCapacity(), partner, descriptionShowLabel.getText());
		} catch (DescriptionTooLongException e) {
			ExceptionFactory ef5 = ExceptionFactory.getInstance();
			ExceptionView view5;
			view5 = ef5.createView(TypeException.TOOLONG);
			rootpane5.getChildren().setAll(view5.getRoot());
		}
    }

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		//this method sets up the graphics depending on the pendinng requests
		pendingLabel.setVisible(false);
		pendingLabel1.setVisible(false);
		accepptedLabel.setVisible(false);
		accepptedLabel1.setVisible(false);
		refusedLabel.setVisible(false);
		refusedLabel1.setVisible(false);
		startButton.setVisible(false);
		dismissButton.setVisible(false);
		//the other labels are setted by default before acknowledging if ther's any pending request
		descriptionShowLabel.setText("there are no pending requests");
		titleLabel.setVisible(false);
		artistLabel.setVisible(false);
		partnerLabel.setVisible(false);
		HostPrivateShow rss = new HostPrivateShow();
		
		RequestedShowBean rsb = rss.getPendingRequest(lbrs.getUsername());
		
		if (rsb!=null) {
			
			
			
			titleLabel.setText(rsb.getTitle());
			titleLabel.setVisible(true);
			descriptionShowLabel.setText(rsb.getDescription());
			artistLabel.setVisible(true);
			artistLabel.setText(rsb.getArtist());
			startButton.setVisible(true);
			dismissButton.setVisible(true);
			if(rsb.getPartner().equals("no")) {
				partnerLabel.setVisible(true);
				partnerLabel.setText("no other sponsors are involved");
				//if no partner is provided set the label marked with 1 back to not visible
				pendingLabel1.setVisible(false);
				accepptedLabel1.setVisible(false);
				refusedLabel1.setVisible(false);
			}
			else {
				partnerLabel.setVisible(true);
				partnerLabel.setText(rsb.getPartner());
			}
			switch(rsb.getApprovedArtist()) {
			case "yes":
				accepptedLabel.setVisible(true);
				break;
			case "no":
				pendingLabel.setVisible(true);
				break;
			case "refused":
				refusedLabel.setVisible(true);
				break;
			default:
			    //implementare eccezione forse
			    break;
			}
		}

	}
	
}
