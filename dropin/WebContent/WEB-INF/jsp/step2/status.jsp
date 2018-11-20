<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Superheroes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

  </head>

  <body>
	<%
  		String herourl = (String)request.getAttribute("hero_url");
  		String heroname = (String)request.getAttribute("hero_name");
  		String paymentid = (String)request.getParameter("payment_id");
  		String merchantorderid = (String)request.getParameter("merchant_order_id");
    %>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">Superheroes</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="http://github.com/payabbhi/superheroes" style="font-size: xx-large;"><i class="fa fa-github" aria-hidden="true"></i></a></li>
                </ul>
              </nav>
            </div>
          </div>
          
      <% if (paymentid != null) { %>
         <div class="inner cover">
              <h1 class="cover-heading">You've got <%=heroname%> </h1>
              <p class="lead"><img src="<%=herourl%>"></p>
              <p class="lead">
                Order ID is <%=merchantorderid%>
              </p>
              <p class="lead">
                Payment ID is <%=paymentid%>
              </p>
              <p class="lead">
                <a href="${pageContext.request.contextPath}/step2" class="btn btn-lg btn-default">Continue shopping</a>
              </p>
         </div>
                   
       <% } else { %>
       
         	<div class="inner cover">
              <h1 class="cover-heading">Hard Luck !! Your attempt to buy a superhero was in vain </h1>
              <p class="lead">
                Oops!! Could not complete the order for Order ID <%=merchantorderid%>
              </p>
              <p class="lead">
                <a href="${pageContext.request.contextPath}/step2" class="btn btn-lg btn-default">Try Again</a>
              </p>
            </div>
            
        <% } %>
            
          <div class="mastfoot"> <div class="inner"> </div> </div>
        </div>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body></html>
