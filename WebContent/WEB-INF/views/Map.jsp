<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import = " logic.engclasses.utils.Session" %>
        <%@page import = " logic.engclasses.utils.PlacesSingleton" %>
        <%@page import = " logic.engclasses.bean.LoggedBean" %>
    
    <%
    PlacesSingleton psm = PlacesSingleton.getSingletonInstance();
    String place = (String)session.getAttribute("mapPlace");
    String artist = (String)session.getAttribute("mapArtist");
    String description = (String)session.getAttribute("mapDescription");
    Session sm = (Session)session.getAttribute("session");
    LoggedBean lbm = sm.getLoggedBean();
    String username = lbm.getUsername();
    %>
    
<!DOCTYPE html>
<html  lang="it">
  <body style="height: 512px; background-color: white;"><img

      src="https://github.com/Brauzi35/ShowRoome-ISPW2021/blob/main/Immagini/26362.png?raw=true" alt="" style="width: 93px; height: 73px; margin-left: -2px;"><br>
    <h1 style="margin-top: -45.5667px; margin-left: 115px;"> ShowRoome </h1>
    <h1 style="margin-top:84px;margin-left:3px;">
     
      <form action="TastoChart" method="post">
        <p style="margin-top:-74px;margin-left:170px;"><input id="Submit" name="Chart" type="submit" value="Chart" " style="height: 35px ; width: 95px; margin-top: -48px; margin-left: 400px;background-color: #4D4D4D;"></input>
        </p>
      </form>
      <form action="TastoMap" method="post">
        <p style="margin-top:-74px;margin-left:-170px;"><input id="Submit" name="Map" type="submit" value="Homepage"  style="height: 35px ; width: 95px; margin-top: -48px; margin-left: 220px;color:white; background-color: #4D4D4D;"></input>
        </p>
      </form>
      
      </form>
      <form action="HostShowWebController" method="get">
        <p style="margin-top:-74px;margin-left:937px;"><input disabled="true" id="Submit" type="submit" name="Setting" value="Sponsored" style="height: 35px ; width: 95px; margin-top: -48px; margin-left: 175px;background-color: #4D4D4D;"></input></p>
      </form>
    </h1>
    <h1 style="margin-top: -74px;margin-left:px ;background-color: white;">
      <style>
      
#rectangle {
    width: 1250px;
    height: 50px;
    background: #10030F;
}
</style> <div id="rectangle"></div>
    </h1>
    <h1 style="margin-top: -159px; margin-left: 1100px;"> <input value=<%=username %> size="65" maxlength="40" ;style="background-color:" #10030f="" type="submit"> </h1> 
             <form action="Logout" method="post">          <h1 style="margin-left: 1190px;margin-top: -57px;" > <input value="logout" size="65" maxlength="40" ;style="background-color:" #10030f="" type="submit"> </h1></form> 
    
    
 
 <div id="container2"  style="display:">
  <h1> <label  style="width: 300x; height: 40px;position:absolute;margin-top: 30px;z-index:0;margin-left:1000px"></label>    </h1> 
<textarea name="text1" id="text1" readonly="readonly";  style="resize: none; width: 300x; height: 40px;position:absolute;margin-top: 100px;z-index:0;margin-left:1000px"><%= place %></textarea>
<textarea name="text2" id="text2" readonly="readonly";  style="resize: none; width: 300x; height: 40px;position:absolute;margin-top: 180px;z-index:0;margin-left:1000px"><%= artist %></textarea>
<textarea name="text3" id="text3" readonly="readonly";  style="resize: none; width: 300x; height: 40px;position:absolute;margin-top: 260px;z-index:0;margin-left:1000px"><%= description %></textarea>

 

</div>
 
 <form action ="TastoMap" method = "get">
 <div class="container"   style="   margin-left: -2px; margin-top: 80px;">
	 <img alt="" src="https://www.researchgate.net/profile/Francesco-Mensa/publication/330994606/figure/fig1/AS:724708081283073@1549795279179/Figura-125-Mappa-della-citta-di-Roma-I-punti-colorati-indicano-i-luoghi-visitati.png" alt="" style="width: 976x; height: 976px; margin-left: -2px; margin-top:50px; overflow:hidden; z-index:-1">
 	
<button id="amo" type="submit" name="action" value=<%= psm.getPlace(2) %> onclick="myFunction(amo,yellow)" style="width: 60x; height: 60px; background-color: Transparent;border:none; margin-top: 750px; position:absolute; margin-left:-600px; float:left;"><img src="https://image.flaticon.com/icons/png/512/48/48703.png" style="width: 55x; height: 55px;" /></button>
<button  id="amo2"  type="submit" name="action" value=<%= psm.getPlace(0) %> onclick="myFunction(amo2,pink)" style="width: 60x; height: 60px; background-color: Transparent; border: none; margin-top: 470px; position:absolute; margin-left:-650px; float:left;"><img src="https://image.flaticon.com/icons/png/512/48/48703.png" style="width: 55x; height: 55px;" /></button>
<button  id="amo3" type="submit" name="action" value=<%= psm.getPlace(1) %> onclick="myFunction(green)" style="width: 60x; height: 60px; background-color: Transparent; border: none; margin-top: 470px; position:absolute; margin-left:-350px; float:left;"><img src="https://image.flaticon.com/icons/png/512/48/48703.png" style="width: 55x; height: 55px;" /></button>
<button  id="amo4" type="submit" name="action" value=<%= psm.getPlace(3) %> onclick="myFunction()" style="width: 60x; height: 60px; background-color: Transparent; border: none; margin-top: 700px; position:absolute; margin-left:-270px; float:left;"><img src="https://image.flaticon.com/icons/png/512/48/48703.png" style="width: 55x; height: 55px;" /></button>
</div>
</form>
                                                                                 
<script>
function myFunction(element_id, value) {
	document.getElementById(element_id).style.border.color = value;
}
</script>
 
    
<div id="risultato"></div>
 

</html>