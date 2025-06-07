package DAO;

import Models.OrderDTO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> orders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT order_id, user_id, order_date, status, recipient_name, address, phone, shipping_date, delivery_status, payment_method, payment_date, payment_status FROM Orders";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int user_id = rs.getInt("user_id");
                Date order_date = rs.getDate("order_date");
                String status = rs.getString("status");
                String recipient_name = rs.getString("recipient_name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                Date shipping_date = rs.getDate("shipping_date");
                String delivery_status = rs.getString("delivery_status");
                String payment_method = rs.getString("payment_method");
                Date payment_date = rs.getDate("payment_date");
                String payment_status = rs.getString("payment_status");
                orders.add(new OrderDTO(order_id, user_id, order_date, status, recipient_name, address, phone, shipping_date, delivery_status, payment_method, payment_date, payment_status));
            }
        } catch (Exception e) {
            System.out.println("Get all orders error: " + e.getMessage());
        }
        return orders;
    }
    
    public void deleteOrder(int id) {
        String sqlPreq= "DELETE FROM OrderDetails WHERE order_id=?";
        String sql= "DELETE FROM Orders WHERE order_id=?";
        try {
            Connection conn= DBUtils.getConnection();
            PreparedStatement stmt1= conn.prepareStatement(sqlPreq);
            PreparedStatement stmt2= conn.prepareStatement(sql);
            stmt1.setInt(1, id);
            stmt2.setInt(1, id);
            
            stmt1.executeUpdate();
            stmt2.executeUpdate();
        } catch (Exception e) {
            System.out.println("Order delete error: "+e.getMessage());
        }
    }
    
    public void updateOrder(OrderDTO order) {
        String sql= "UPDATE Orders SET user_id=?, order_date=?, status=?, recipient_name=?, address=?, phone=?, shipping_date=?, delivery_status=?, payment_method=?, payment_date=?, payment_status=? WHERE order_id=?";
        try {
            Connection conn= DBUtils.getConnection();
            PreparedStatement stmt= conn.prepareStatement(sql);
            
            stmt.setInt(1, order.getUser_id());
            stmt.setDate(2, order.getOrder_date());
            stmt.setString(3, order.getStatus());
            stmt.setString(4, order.getRecipient_name());
            stmt.setString(5, order.getAddress());
            stmt.setString(6, order.getPhone());
            stmt.setDate(7, order.getShipping_date());
            stmt.setString(8, order.getDelivery_status());
            stmt.setString(9, order.getPayment_method());
            stmt.setDate(10, order.getPayment_date());
            stmt.setString(11, order.getPayment_status());
            stmt.setInt(12, order.getOrder_id());
            
            stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update order error: "+e.getMessage());
        }
    }
    
    public List<OrderDTO> searchOrders(String keyword) {
    List<OrderDTO> orders = new ArrayList<>();
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = DBUtils.getConnection();
        String sql = "SELECT order_id, user_id, order_date, status, recipient_name, address, phone, shipping_date, delivery_status, payment_method, payment_date, payment_status FROM Orders WHERE recipient_name LIKE ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, "%" + keyword + "%");
        rs = stmt.executeQuery();

        while (rs.next()) {
            int order_id = rs.getInt("order_id");
            int user_id = rs.getInt("user_id");
            Date order_date = rs.getDate("order_date");
            String status = rs.getString("status");
            String recipient_name = rs.getString("recipient_name");
            String address = rs.getString("address");
            String phone = rs.getString("phone");
            Date shipping_date = rs.getDate("shipping_date");
            String delivery_status = rs.getString("delivery_status");
            String payment_method = rs.getString("payment_method");
            Date payment_date = rs.getDate("payment_date");
            String payment_status = rs.getString("payment_status");

            orders.add(new OrderDTO(order_id, user_id, order_date, status, recipient_name, address, phone, shipping_date, delivery_status, payment_method, payment_date, payment_status));
        }
    } catch (Exception e) {
        System.out.println("Search orders error: " + e.getMessage());
    }
    return orders;
}
      public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();

        // Giả sử bạn muốn tìm kiếm các đơn hàng có tên người nhận chứa "John"
        String keyword = "Phạm Thị Hồng";

        List<OrderDTO> orders = dao.searchOrders(keyword);

        if (orders.isEmpty()) {
            System.out.println("No orders found for keyword: " + keyword);
        } else {
            for (OrderDTO order : orders) {
                System.out.println(order.toString()); // in ra order
            }
        }
    }

}
