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
            <h1 class="cover-heading">Limited Offer Sale !!</h1>
            <p class="lead">Purchase a random superhero to run your errands. Try your luck.</p>
            <p class="lead">
              <button id="submit-btn" class="btn btn-lg btn-default">Pay with Payabbhi</button>
              <script src="https://checkout.payabbhi.com/v1/checkout.js"></script>
              <form name='payabbhiform' action="${pageContext.request.contextPath}/step1/status" method="POST">
                  <input type="hidden" name="merchant_order_id" value="<%=merchantorderid%>"></input>
                  <input type="hidden" name="order_id" id="order_id">
                  <input type="hidden" name="payment_id" id="payment_id">
                  <input type="hidden" name="payment_signature"  id="payment_signature" >
              </form>
              <script>
              // Implement the Checkout workflow for Web as outlined at https://payabbhi.com/docs/checkout
              var options = {
                  "access_id": "<%=(String)request.getAttribute("access_id")%>",
                  "order_id":  "<%=(String)neworder.get("id")%>",
                  "amount": "<%=(Integer)neworder.get("amount")%>",
                  "name": "SuperHeroes Store",
                  "description": "Order #<%=merchantorderid%>",
                  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrqxgvtb3CZ9MJOKpXWxrScQEK4lwzbClXg_J7iayii4PTg-Y5",
                  "prefill": {
                      "name":    "Bruce Wayne",
                      "email":   "bruce@wayneinc.com",
                      "contact": "9999999999"
                  },
                  "notes": {
                      "merchant_order_id": "<%=merchantorderid%>"
                  },
                  "theme": {
                      "color": "#F6A821"
                  }
              };
              options.handler = function (response){
                  // Submitting the Payment response as outlined at https://payabbhi.com/docs/checkout
                  document.getElementById('order_id').value = response.order_id;
                  document.getElementById('payment_id').value = response.payment_id;
                  document.getElementById('payment_signature').value = response.payment_signature;
                  document.payabbhiform.submit();
              };

              document.getElementById('submit-btn').onclick = function(e){
                  var payabbhi = new Payabbhi(options);
                  payabbhi.open();
                  e.preventDefault();
              }
              </script>
            </p>
          </div>

          <div class="mastfoot"> <div class="inner"> </div> </div>
        </div>

      </div>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</body></html>