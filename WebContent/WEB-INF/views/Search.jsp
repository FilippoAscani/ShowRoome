<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import = " logic.engclasses.utils.Session" %>
        <%@page import = " logic.engclasses.bean.LoggedBean" %>
  <%
  Session sh = (Session)session.getAttribute("session");
  LoggedBean lbsh = sh.getLoggedBean();
  String username = lbsh.getUsername();
  
  
  %>
    
<!DOCTYPE html>
<html  lang="it">
  <head>
    <title>Prova</title>
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
        <p style="margin-top:-74px;margin-left:-170px;"><input id="Submit" name="Map" type="submit" value="Homepage"  style="height: 35px ; width: 95px; margin-top: -48px; margin-left: 220px; background-color: #4D4D4D;"></input>
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
      
     <h1 style="margin-top:200px; margin-left: 450px;"><form action="TastoChart" method="get"> 
     <input name="artist" value="cercaArtista" id="artist" tyle="height:30px;width:300px;"></input>
     <input value="Search artist"size="35" maxlength="40" ;style="height:70px;width:120px;     ;background-color:" #993300="" type="submit"></form> </h1>

 

   
     
</html>