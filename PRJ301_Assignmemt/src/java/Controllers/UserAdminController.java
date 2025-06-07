package Controllers;

import DAO.UserDAO;
import Models.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserAdminController", urlPatterns = {"/UserAdminController"})
public class UserAdminController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String keyword = request.getParameter("keyword");
        List<UserDTO> users;
        if (keyword != null && !keyword.trim().isEmpty()) {
            users = userDAO.searchUsers(keyword); // <-- cần viết hàm searchUsers bên UserDAO
        } else {
            users = userDAO.getAllUsers();
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("adminUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("user_id"));
            userDAO.banUser(id);
        } else if ("update".equals(action)) {
            UserDTO userUpd = new UserDTO();
            userUpd.setUserId(Integer.parseInt(request.getParameter("user_id")));
            userUpd.setFullName(request.getParameter("fullName"));
            userUpd.setUsername(request.getParameter("username"));
            userUpd.setEmail(request.getParameter("email"));
            userUpd.setPhoneNumber(request.getParameter("phoneNumber"));
            userUpd.setPassword(request.getParameter("password"));
            userUpd.setIsAdmin(Boolean.parseBoolean(request.getParameter("isAdmin")));

            userDAO.updateUser(userUpd);
        }
        response.sendRedirect("UserAdminController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
