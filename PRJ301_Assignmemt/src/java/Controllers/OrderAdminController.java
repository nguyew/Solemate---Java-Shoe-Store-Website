/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.OrderDTO;
import DAO.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author THIS PC
 */
@WebServlet(name = "OrderAdminController", urlPatterns = {"/OrderAdminController"})
public class OrderAdminController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderDTO> orders = orderDAO.getAllOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("adminOrder.jsp").forward(request, response);
    }

  @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
     request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    String action = request.getParameter("action");
    if ("delete".equals(action)) {
        int orderId = Integer.parseInt(request.getParameter("order_id"));
        orderDAO.deleteOrder(orderId);
        response.sendRedirect("OrderAdminController");
    } else if ("update".equals(action)) {
        OrderDTO orderUpd = new OrderDTO();
        orderUpd.setOrder_id(Integer.parseInt(request.getParameter("order_id")));
        orderUpd.setUser_id(Integer.parseInt(request.getParameter("user_id")));
        orderUpd.setOrder_date(Date.valueOf(request.getParameter("order_date")));
        orderUpd.setStatus(request.getParameter("status"));
        orderUpd.setRecipient_name(request.getParameter("recipient_name"));
        orderUpd.setAddress(request.getParameter("address"));
        orderUpd.setPhone(request.getParameter("phone"));
        orderUpd.setShipping_date(Date.valueOf(request.getParameter("shipping_date")));
        orderUpd.setDelivery_status(request.getParameter("delivery_status"));
        orderUpd.setPayment_method(request.getParameter("payment_method"));
        orderUpd.setPayment_date(Date.valueOf(request.getParameter("payment_date")));
        orderUpd.setPayment_status(request.getParameter("payment_status"));

        orderDAO.updateOrder(orderUpd);
        response.sendRedirect("OrderAdminController");
    } else if ("search".equals(action)) {
        String keyword = request.getParameter("keyword");
        List<OrderDTO> orders = orderDAO.searchOrders(keyword);
         if (orders.isEmpty()) {
            System.out.println("No orders found for keyword: " + keyword);
        } else {
            for (OrderDTO order : orders) {
                System.out.println(order.toString()); // in ra order
            }
        }
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("adminOrder.jsp").forward(request, response);
    }
}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
