package superheroes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.io.IOException;
import com.payabbhi.Payabbhi;
import com.payabbhi.model.Order;
import com.payabbhi.model.Payment;


@WebServlet(name = "SuperheroServletStep3", urlPatterns = {"/step3", "/step3/status"})
public class SuperheroServletStep3 extends HttpServlet {
		
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Payabbhi.accessId = UserDetails.Access_ID;
    	Payabbhi.secretKey = UserDetails.Secret_key;
    	String morderid = "JAVASDK-Custom-Step3-Order-" + (int)(Math.random()*10000);
    	HashMap<String, Object> params = new HashMap<String, Object>();
    	params.put("merchant_order_id",(String)morderid);
    	params.put("amount", (int)100);
    	params.put("currency",(String)"INR");
        request.setAttribute("access_id", Payabbhi.accessId);
    	request.setAttribute("merchant_order_id", morderid);
    	try {
        	Order neworder = Order.create(params);
        	request.setAttribute("order", neworder);
    	}
    	catch(Exception e)
    	{
        	request.setAttribute("exception", e);
    	}
    	
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/step3/index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HashMap<String, String> hmap = new HashMap<String, String>();
	    hmap.put("Batman","https://upload.wikimedia.org/wikipedia/en/thumb/2/22/Batman-DC-Comics.jpg/250px-Batman-DC-Comics.jpg");
	    hmap.put("Superman","https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/SupermanRoss.png/250px-SupermanRoss.png");
	    hmap.put("Aquaman","https://upload.wikimedia.org/wikipedia/en/thumb/0/0a/Aquaman_issue_1%2C_the_new_52.jpg/220px-Aquaman_issue_1%2C_the_new_52.jpg");
	    hmap.put("Spiderman","https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Spiderman50.jpg/250px-Spiderman50.jpg");
	    hmap.put("Wonder Woman","https://upload.wikimedia.org/wikipedia/en/0/03/Wonder_Woman_%28DC_Rebirth%29.jpg");
    	hmap.put("Iron Man","https://i.annihil.us/u/prod/marvel//universe3zx/images/f/f5/IronMan_Head.jpg");
    	hmap.put("Hulk","https://upload.wikimedia.org/wikipedia/en/5/59/Hulk_%28comics_character%29.png");
    	hmap.put("Captain America","https://upload.wikimedia.org/wikipedia/en/thumb/9/91/CaptainAmerica109.jpg/250px-CaptainAmerica109.jpg");
    	hmap.put("Falcon","https://upload.wikimedia.org/wikipedia/en/thumb/2/2e/TheFalcon.jpg/250px-TheFalcon.jpg");
    	hmap.put("Wasp","https://upload.wikimedia.org/wikipedia/en/thumb/c/c0/AVEN071.jpg/250px-AVEN071.jpg");
    	hmap.put("Quicksilver","https://upload.wikimedia.org/wikipedia/en/thumb/6/6e/Quicksilver%21.jpg/250px-Quicksilver%21.jpg");
    	hmap.put("Doctor Strange","https://upload.wikimedia.org/wikipedia/en/thumb/4/4f/Doctor_Strange_Vol_4_2_Ross_Variant_Textless.jpg/250px-Doctor_Strange_Vol_4_2_Ross_Variant_Textless.jpg");
    	hmap.put("Hawkeye","https://upload.wikimedia.org/wikipedia/en/thumb/9/99/Hawkeye_%28Clinton_Barton%29.png/220px-Hawkeye_%28Clinton_Barton%29.png");
    	hmap.put("Wolverine","https://upload.wikimedia.org/wikipedia/en/c/c8/Marvelwolverine.jpg");
    	hmap.put("Black Widow","https://i.annihil.us/u/prod/marvel//universe3zx/images/f/f9/BlackWidow.jpg");
    	
    	List<String> keys = new ArrayList<String>(hmap.keySet());
    	List<String> values = new ArrayList<String>(hmap.values());
    	int index = (int)(Math.random()*(hmap.size()));
    	String heroname = (String)keys.get(index);
    	String herourl = (String)values.get(index);

		request.setAttribute("hero_url", herourl);
	    request.setAttribute("hero_name", heroname);

    	try
    	{
    		HashMap<String, String> params = new HashMap<String, String>();
    		params.put("order_id", request.getParameter("order_id"));
    		params.put("payment_id", request.getParameter("payment_id"));
    		params.put("payment_signature", request.getParameter("payment_signature"));
    		boolean result = Payabbhi.verifyPaymentSignature(params);    		
    		if (!result)
    		{
    			throw new Exception("Invalid Payment Signature.");
    		}
    		
    		Payment payinfo = Payment.retrieve(request.getParameter("payment_id"));
    		
    		request.setAttribute("payment", payinfo);
    	}
    	catch(Exception e)
    	{
    		System.out.println("Error : "+e.getMessage());
        	request.setAttribute("exception", e);
    	}

    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/step3/status.jsp");
	    dispatcher.forward(request, response);
 
	}
}