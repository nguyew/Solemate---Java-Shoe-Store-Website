package Controllers;

import Models.UserDTO;
import DAO.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("loginName");
        String password = request.getParameter("loginPass");
        String remember = request.getParameter("remember");
        
        UserDAO userDAO = new UserDAO();
        UserDTO user = null;
        
        try {
            user = userDAO.login(username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            
            // Remember user (save username in cookies)
            if ("on".equals(remember)) {
                javax.servlet.http.Cookie userCookie = new javax.servlet.http.Cookie("rememberUser", username);
                userCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                response.addCookie(userCookie);
            } else {
                javax.servlet.http.Cookie userCookie = new javax.servlet.http.Cookie("rememberUser", "");
                userCookie.setMaxAge(0); // Delete cookie
                response.addCookie(userCookie);
            }
            
            // Redirect to the appropriate page
            if (user.isIsAdmin()) {
                response.sendRedirect("ProductAdminController"); // Admin page
            } else {
                response.sendRedirect("index.jsp"); // Customer page
            }
            return;
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/login.jsp").forward(request, response); // Return to login page with error
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Controller";
    }
}
