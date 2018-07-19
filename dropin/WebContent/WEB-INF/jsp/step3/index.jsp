<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="com.payabbhi.model.Order"%>
<%@ page import="java.lang.Integer"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
  </head>

  <body>
  
  	<%
       	Order neworder = (Order)request.getAttribute("order");
  		String merchantorderid = (String)request.getAttribute("merchant_order_id");
  		Exception e = (Exception)request.getAttribute("exception");
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

          <div class="inner cover">
          
          <% if (e == null) { %>
          
            <h1 class="cover-heading">Limited Offer Sale !!</h1>
            <p class="lead">Purchase a random superhero to run your errands. Try your luck.</p>
            <form action="${pageContext.request.contextPath}/step3/status" method="POST">
            <script
                src="https://checkout.payabbhi.com/v1/checkout.js"
                data-access-id="<%=(String)request.getAttribute("access_id")%>"
                data-order-id="<%=(String)neworder.get("id")%>"
                data-amount="<%=(Integer)neworder.get("amount")%>"
                data-image="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrqxgvtb3CZ9MJOKpXWxrScQEK4lwzbClXg_J7iayii4PTg-Y5"
                data-name="SuperHeroes Store"
                data-description="Order # <%=merchantorderid%>"
                data-prefill.name="Bruce Wayne"
                data-prefill.email="bruce@wayneinc.com"
                data-prefill.contact="9999999999"
                data-theme.color="#F6A821"
                data-notes.merchant_order_id="<%=merchantorderid%>"
            >
            </script>
            <input type="hidden" name="merchant_order_id" value="<%=merchantorderid%>" ></input>
            </form>
          
          <% } else { %>
          
          		<div class="inner cover">
                  <h1 class="cover-heading">Hard Luck !! Your attempt to buy a superhero was in vain </h1>
                  <p class="lead">
                    Oops!! Could not complete the order for Order ID  <%=merchantorderid%>
                  </p>
                  <p class="lead">
                    <a href="${pageContext.request.contextPath}/step3" class="btn btn-lg btn-default">Try Again</a>
                  </p>
                </div>
                
          <% } %>
           
          </div>

          <div class="mastfoot"> <div class="inner"> </div> </div>
        </div>

      </div>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</body></html>