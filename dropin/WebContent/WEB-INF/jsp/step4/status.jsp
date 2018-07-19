<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <jsp:include page="header.jsp" />
  </head>
  <body>
  <%
	  Exception e = (Exception)request.getAttribute("exception");
	  String paymentid = (String)request.getParameter("payment_id");
	  String merchantorderid = (String)request.getParameter("merchant_order_id");
  %>
    <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">
 	    <jsp:include page="navbar.jsp" />
          <div class="inner cover">
            <% if (e == null && paymentid != null) { %>
            	<jsp:include page="success.jsp">  
					<jsp:param name="merchantorderid" value="<%=merchantorderid%>" />  
					<jsp:param name="paymentid" value="<%=paymentid%>" />  
				</jsp:include>
            <% } else { %>
	          <jsp:include page="failure.jsp">
		          <jsp:param name="merchantorderid" value="<%=merchantorderid%>" /> 
			  </jsp:include>		 	    
            <% } %>
          </div>
        </div>
      </div>
    </div>
	<jsp:include page="footer.jsp" />
  </body>
</html>
