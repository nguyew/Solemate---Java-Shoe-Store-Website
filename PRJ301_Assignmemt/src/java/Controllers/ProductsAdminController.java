/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.ProductDTO;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author THIS PC
 */
  @WebServlet(name = "ProductAdminController", urlPatterns = {"/ProductAdminController"})
public class ProductsAdminController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    // Hiển thị danh sách sản phẩm
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("search");
        List<ProductDTO> products;

        // Nếu có từ khóa tìm kiếm, gọi search
        if (keyword != null && !keyword.isEmpty()) {
            products = productDAO.searchProducts(keyword);  // Tìm kiếm theo từ khóa
        } else {
            products = productDAO.getAllProducts();  // Lấy tất cả sản phẩm nếu không có tìm kiếm
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("adminShop.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            // Xử lý tạo mới sản phẩm
            String name = request.getParameter("product_name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            String image_url = request.getParameter("image");
            String brand = request.getParameter("brand_id");
            String size = request.getParameter("size");
            String category_id = request.getParameter("category_id");

            ProductDTO newProduct = new ProductDTO(0, name, brand, category_id, price, size, description, image_url);
            productDAO.createProduct(newProduct);
            
        } else if ("update".equals(action)) {
            // Xử lý cập nhật sản phẩm
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            String name = request.getParameter("product_name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            String image_url = request.getParameter("image");
            String brand = request.getParameter("brand_id");
            String size = request.getParameter("size");
            String category_id = request.getParameter("category_id");

            ProductDTO updatedProduct = new ProductDTO(product_id, name, brand, category_id, price, size, description, image_url);
            productDAO.updateProduct(updatedProduct);
        } else if ("delete".equals(action)) {
            // Xử lý xóa sản phẩm
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            productDAO.deleteProduct(product_id);
        }
        
        response.sendRedirect("ProductAdminController");  // Refresh page after operation
    }
}
