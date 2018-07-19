<%@ page import="com.payabbhi.model.Order"%>
<%@ page import="java.lang.Integer"%>

<h1 class="cover-heading">Limited Offer Sale !!</h1>
<p class="lead">Purchase a random superhero to run your errands. Try your luck.</p>

<%
	Order neworder = (Order)request.getAttribute("order");
%>

 <form action="${pageContext.request.contextPath}/step4/status" method="POST">
 <script
     src="https://checkout.payabbhi.com/v1/checkout.js"
     data-access-id="<%=(String)request.getAttribute("access_id")%>"
     data-order-id="<%=(String)neworder.get("id")%>"
     data-amount="<%=(Integer)neworder.get("amount")%>"
     data-image="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrqxgvtb3CZ9MJOKpXWxrScQEK4lwzbClXg_J7iayii4PTg-Y5"
     data-name="SuperHeroes Store"
     data-description="Order # ${param.merchantorderid}"
     data-prefill.name="Bruce Wayne"
     data-prefill.email="bruce@wayneinc.com"
     data-prefill.contact="9999999999"
     data-theme.color="#F6A821"
     data-notes.merchant_order_id="${param.merchantorderid}"
 >
 </script>
 <input type="hidden" name="merchant_order_id" value="${param.merchantorderid}" ></input>
 </form>