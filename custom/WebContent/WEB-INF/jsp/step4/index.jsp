<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <jsp:include page="header.jsp" />
  </head>
  <body>
	<%
  		String merchantorderid = (String)request.getAttribute("merchant_order_id");
  		Exception e = (Exception)request.getAttribute("exception");
    %>
    <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">
 	    <jsp:include page="navbar.jsp" />
          <div class="inner cover">
            <% if (e == null) { %>
            	<jsp:include page="payment.jsp">  
					<jsp:param name="merchantorderid" value="<%=merchantorderid%>" />  
				</jsp:include>
            <% } else { %>
	          <jsp:include page="failure.jsp">
		          <jsp:param name="merchantorderid" value="<%=merchantorderid%>" /> 
			  </jsp:include>		 	    
            <% } %>
          </div>
          <div class="mastfoot"> <div class="inner"> </div> </div>
        </div>
      </div>
    </div>
	<jsp:include page="footer.jsp" />
  </body>
</html>
