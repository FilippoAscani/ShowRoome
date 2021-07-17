<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "logic.controller.appcontroller.ReviewAnArtist"  %>
    <%@page import = "logic.engclasses.bean.ReviewBean"%>
    <%@ page import = "java.util.List" %>
    <%@page import = " logic.engclasses.utils.Session" %>
    <%@page import = " logic.engclasses.bean.LoggedBean" %>
    <%@page import = " logic.engclasses.exceptions.ArtistNotFoundException" %>
    
    <%

    String strParam = (String)session.getAttribute("artist2");
    ReviewAnArtist rc = new ReviewAnArtist();
    List<ReviewBean> lrb = null; //lrb contains every review for a specified artist
    try{
    	lrb = rc.getReviews(strParam);
    } catch(ArtistNotFoundException e){
    	e.printStackTrace();
    }
    String review1 = "";
    String review2 = "";
    String review3= "";
    Session ch = (Session)session.getAttribute("session");
    LoggedBean lbch = ch.getLoggedBean();
    String username = lbch.getUsername();
    %>
<!DOCTYPE html>
<html  lang="it">
  <head>
    <title>ShoowRome</title>
  </head>
  <body style=" height: 512px; background-color: white;"><img src="https://github.com/Brauzi35/ShowRoome-ISPW2021/blob/main/Immagini/26362.png?raw=true"

      alt="" style="width: 93px; height: 73px; margin-left: -2px;"><br>
    <h1 style="margin-top: -45.5667px; margin-left: 115px;"> ShowRoome </h1>
     
    <h1 style="margin-top:84px;margin-left:3px;">
     
      <form action="TastoChart" method="post">
        <p style="margin-top:-74px;margin-left:170px;"><input id="Submit" name="Chart" type="submit" value="Chart" " style="height: 35px ; width: 95px; margin-top: -48px; margin-left: 400px;color:white;background-color: #4D4D4D;"></input>
        </p>
      </form>
      <form action="TastoMap" method="post">
        <p style="margin-top:-74px;margin-left:-170px;"><input id="Submit" name="Map" type="submit" value="Homepage"  style="height: 35px ; width: 95px; margin-top: -48px; margin-left: 175px; background-color: #4D4D4D;"></input>
        </p>
      </form>
      
      </form>
      <form action="HostShowWebController" method="get">
        <p style="margin-top:-74px;margin-left:937px;"><input disabled="true" id="Submit" type="submit" name="Setting" value="Sponsored" style="height: 35px ; width: 95px; margin-top: -48px; margin-left: 210px;background-color: #4D4D4D;"></input></p>
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
    
    <!-- Primo artista  -->
   
       <p style="margin-top: 280px; margin-left: 5px;"> <img alt="" src="https://www.focusjunior.it/content/uploads/2018/10/Michelangelo-Buonarroti.jpg"

        style="width: 235px; height: 155px; margin-left: -4px; margin-top: -357px;">
    </p>
  <li style="list-style: none"> <h3 style=" margin-top: -135px;margin-left: 300px;"><ul>
    <% 
    //intuizione assoluta
    try{
      review1 = lrb.get(0).getReview();
     } catch (Exception e){
    	 review1 = "no review found";
     }
     

    try{
      review2 = lrb.get(1).getReview();
     } catch (Exception e){
    	 review2 = "no review found";
     }
    
    
    try{
        review3 = lrb.get(2).getReview();
       } catch (Exception e){
      	 review3 = "no review found";
       }
    	 
    	 %>
     <textarea readonly="readonly"   style="width: 400px; height: 60px; resize: none;"  form="Descrizione artista"><%= review1 %></textarea > </ul>
     <ul><textarea readonly="readonly"   style="width: 400px; height: 60px; resize: none;" form="Descrizione artista"><%=review2 %></textarea></ul>
     <ul><textarea readonly="readonly"   style="width: 400px; height: 60px; resize: none;" form="Descrizione artista"><%=review3 %></textarea></ul></h3></li>
  <form action="SubmitReview" method="post" style=" margin-top: -150px;""> <textarea id="story" name="story" style=" margin-left: 950px;resize: none ;"rows="5" cols="33">
It was a dark and stormy night...
</textarea> <button name="Dona" style="height: 35px; width: 90px; margin-top: -150px; margin-left: 1030px; background-color: #4d4d4d;">Recensisci</button> </form>
  <form action="test" method="post">   <button  disabled="true" name="Informazioni" style="height: 35px; width: 90px; margin-top: 20px; margin-left: 480px; background-color: #4d4d4d;">Vedi altre</button></form>

    
      </form>
  
  </body>
</html>

