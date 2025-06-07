package DAO;

import Models.UserDTO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public List<UserDTO> getAllUsers() {
        List<UserDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setPassword(rs.getString("password"));
                user.setIsAdmin(rs.getBoolean("is_admin"));
                result.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean registerUser(UserDTO user) {
        String sql = "INSERT INTO Users (full_name, username, email, phone_number, password, is_admin) VALUES (?, ?, ?, ?, ?, 0)";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setString(5, user.getPassword());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public UserDTO login(String username, String password) {
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    UserDTO user = new UserDTO();
                    user.setUserId(rs.getInt("user_id"));
                    user.setFullName(rs.getString("full_name"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPhoneNumber(rs.getString("phone_number"));
                    user.setIsAdmin(rs.getBoolean("is_admin"));
                    return user;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void banUser(int id) {
        String deleteOrders = "DELETE FROM Orders WHERE user_id=?";
        String deleteReviews = "DELETE FROM Reviews WHERE user_id=?";
        String deleteUser = "DELETE FROM Users WHERE user_id=?";

        try (Connection conn = DBUtils.getConnection()) {
            if (conn != null) {
                try (PreparedStatement stmt1 = conn.prepareStatement(deleteOrders);
                     PreparedStatement stmt2 = conn.prepareStatement(deleteReviews);
                     PreparedStatement stmt3 = conn.prepareStatement(deleteUser)) {

                    stmt1.setInt(1, id);
                    stmt2.setInt(1, id);
                    stmt3.setInt(1, id);

                    stmt1.executeUpdate();
                    stmt2.executeUpdate();
                    stmt3.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateUser(UserDTO user) {
        String sql = "UPDATE Users SET full_name=?, username=?, email=?, phone_number=?, password=?, is_admin=? WHERE user_id=?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setString(5, user.getPassword());
            stmt.setBoolean(6, user.isIsAdmin());
            stmt.setInt(7, user.getUserId());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<UserDTO> searchUsers(String keyword) {
        List<UserDTO> users = new ArrayList<>();
        String sql = "SELECT user_id, full_name, username, email, phone_number, is_admin FROM Users WHERE full_name LIKE ? OR username LIKE ?";

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String likeKeyword = "%" + keyword + "%";
            stmt.setString(1, likeKeyword);
            stmt.setString(2, likeKeyword);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    UserDTO user = new UserDTO();
                    user.setUserId(rs.getInt("user_id"));
                    user.setFullName(rs.getString("full_name"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPhoneNumber(rs.getString("phone_number"));
                    user.setIsAdmin(rs.getBoolean("is_admin"));
                    users.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        String keyword = "admin"; // đổi từ khóa test

        List<UserDTO> searchResult = userDAO.searchUsers(keyword);

        if (searchResult.isEmpty()) {
            System.out.println("Không tìm thấy người dùng nào với từ khóa: " + keyword);
        } else {
            System.out.println("Tìm thấy " + searchResult.size() + " người dùng:");
            for (UserDTO user : searchResult) {
                System.out.println("ID: " + user.getUserId()
                        + ", Full Name: " + user.getFullName()
                        + ", Username: " + user.getUsername()
                        + ", Email: " + user.getEmail()
                        + ", Phone: " + user.getPhoneNumber()
                        + ", Is Admin: " + user.isIsAdmin());
            }
        }
    }
}
