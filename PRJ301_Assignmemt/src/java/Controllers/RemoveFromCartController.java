package Controllers;

import Models.CartItem;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RemoveFromCartController", urlPatterns = {"/RemoveFromCartController"})
public class RemoveFromCartController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            int index = Integer.parseInt(request.getParameter("index"));
            cart.remove(index);

            // Recalculate total
            double total = 0;
            for (CartItem item : cart) {
                total += item.getTotalPrice();
            }
            session.setAttribute("totalPrice", total);

            if (cart.isEmpty()) {
                session.setAttribute("cart", null);
                session.setAttribute("totalPrice", 0.0);
            } else {
                session.setAttribute("cart", cart);
            }
        }

        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}