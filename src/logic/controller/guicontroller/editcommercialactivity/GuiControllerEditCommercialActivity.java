package logic.controller.guicontroller.editcommercialactivity;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import logic.controller.appcontroller.EditCommercialActivity;
import logic.controller.guicontroller.login.GuiControllerLogin;
import logic.engclasses.bean.LoggedBean;
import logic.engclasses.bean.SponsoredShowBean;
import logic.engclasses.utils.Session;



public class GuiControllerEditCommercialActivity implements Initializable{
	 	
	EditCommercialActivity eca = new EditCommercialActivity();	
	protected Session bsea;
	protected LoggedBean lbea;
	 public GuiControllerEditCommercialActivity(Session bsea){
	 	this.bsea = bsea;
	 	lbea=bsea.getLoggedBean();
	 }
		
		@FXML
	    private AnchorPane rootpaneHPS;
	    
	    @FXML
	    private Button dismissButtonHPS;

	    @FXML
	    private Label titleLabelHPS;
	    
	    @FXML
	    private Button editButtonHPS;

	    @FXML
	    private Label usernameHPS;

	    @FXML
	    private Label activity;

	    @FXML
	    private Label capacity;

	    @FXML
	    private Label description;

	    @FXML
	    private TextField usernameEditbox;

	    @FXML
	    private TextField passwordEditbox1;

	    @FXML
	    private Button saveButton;

	    @FXML
	    private TextArea descriptionTexrBar;

	    @FXML
	    private TextField capacityEditbox;

	    @FXML
	    void dismissShow(ActionEvent event) {
	    	//add dismiss show
	    	eca.delete(lbea.getUsername());
	    }

	    @FXML
	    void editClick(ActionEvent event) {
	    	if(!usernameEditbox.isVisible()) {
	    		usernameEditbox.setVisible(true);
	    		passwordEditbox1.setVisible(true);
	    		saveButton.setVisible(true);
	    		descriptionTexrBar.setVisible(true);
	    		capacityEditbox.setVisible(true);
	    	}
	    	else {
	    		usernameEditbox.setVisible(false);
	    		passwordEditbox1.setVisible(false);
	    		saveButton.setVisible(false);
	    		descriptionTexrBar.setVisible(false);
	    		capacityEditbox.setVisible(false);
	    	}
	    }

	    @FXML
	    void saveClick(ActionEvent event) throws IOException {
	    	eca.editInfo(lbea.getUsername(), passwordEditbox1.getText(), capacityEditbox.getText() ,descriptionTexrBar.getText());
	    	GuiControllerLogin gl = new GuiControllerLogin();
	    	FXMLLoader ldrg=new FXMLLoader(getClass().getResource("/logic/view/login/Login.fxml"));
			ldrg.setController(gl);
			Scene scng=new Scene(ldrg.load());
			Stage stgg = (Stage)((Node) event.getSource()).getScene().getWindow();
			stgg.setScene(scng);
			stgg.show();
	    	
	    }

		@Override
		public void initialize(URL arg0, ResourceBundle arg1) {
			//hide edit section
			usernameEditbox.setVisible(false);
			passwordEditbox1.setVisible(false);
			saveButton.setVisible(false);
			descriptionTexrBar.setVisible(false);
			capacityEditbox.setVisible(false);
			
			SponsoredShowBean ssb = eca.getLiveSShow(lbea.getUsername());
			if(ssb!=null) {
				titleLabelHPS.setText(ssb.getTitle());
			}
			usernameHPS.setText(lbea.getUsername());
			activity.setText(lbea.getActivity());
			capacity.setText(lbea.getCapacity());
			description.setText(lbea.getDescription());
		}
}
