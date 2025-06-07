package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LogoutController", urlPatterns = {"/LogoutController"})
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy session hiện tại
        HttpSession session = request.getSession();
        
        // Hủy session nếu có
        session.invalidate();
        
        // Điều hướng người dùng về trang đăng nhập hoặc trang chủ
        response.sendRedirect("login.jsp"); // Hoặc "index.jsp" nếu bạn muốn về trang chủ
    }

    @Override
    public String getServletInfo() {
        return "Handles user logout functionality";
    }
}
