<%@ page import="com.payabbhi.model.Payment"%>
<%@ page import="java.lang.Integer"%>
<%
		String herourl = (String)request.getAttribute("hero_url");
		String heroname = (String)request.getAttribute("hero_name");
  		Payment payinfo = (Payment)request.getAttribute("payment");
%>
<h1 class="cover-heading">You've got <%=heroname%> </h1>
<h3> for <%=(Integer)payinfo.get("amount")/100%> </h3>
<p class="lead"><img src="<%=herourl%>"></p>
<p class="lead">
  Order ID is ${param.merchantorderid}
</p>
<p class="lead">
  Payment ID is ${param.paymentid}
</p>
<p class="lead">
  <a href="${pageContext.request.contextPath}/step4" class="btn btn-lg btn-default">Continue shopping</a>
</p>
