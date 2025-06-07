/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.CartItem;
import Models.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        UserDTO user = (UserDTO) request.getSession().getAttribute("currentUser");
        
        // Kiểm tra nếu người dùng đã đăng nhập, nếu có thì truyền vào request
        if (user != null) {
    request.getSession().setAttribute("currentUser", user);
}
        String productName = request.getParameter("product-title");
        String productSize = request.getParameter("product-size");
        String quantityStr = request.getParameter("product-quantity");
        String productImage = request.getParameter("product-image");  // Thêm thông tin hình ảnh

        System.out.println("Product Name: " + productName);
        System.out.println("Product Size: " + productSize);
        System.out.println("Product Quantity: " + quantityStr);
        System.out.println("Product Image: " + productImage);

        int quantity = 1; // Giá trị mặc định nếu không có quantity hợp lệ
        if (quantityStr != null && !quantityStr.isEmpty()) {
            try {
                quantity = Integer.parseInt(quantityStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid quantity value, using default value: " + e.getMessage());
            }
        }

        double price = Double.parseDouble(request.getParameter("product-price"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;
        for (CartItem item : cart) {
            if (item.getProductName().equals(productName) && item.getProductSize().equals(productSize)) {
                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }

        if (!found) {
            CartItem newItem = new CartItem(productName, productSize, price, quantity, productImage);
            cart.add(newItem);
        }

// 🛠 Set session lại sau khi cập nhật giỏ hàng
        session.setAttribute("cart", cart);

// Tính tổng tiền giỏ hàng
        double total = 0;
        for (CartItem item : cart) {
            total += item.getTotalPrice();
        }
        session.setAttribute("totalPrice", total);

// Redirect
        response.sendRedirect("cart.jsp");
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
