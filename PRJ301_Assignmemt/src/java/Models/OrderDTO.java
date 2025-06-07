package Models;

import java.sql.Date;

public class OrderDTO {
    public OrderDTO() {}
    
    private int order_id;
    private int user_id;
    private Date order_date;
    private String status;
    private String recipient_name;
    private String address;
    private String phone;
    private Date shipping_date;
    private String delivery_status;
    private String payment_method;
    private Date payment_date;
    private String payment_status;

    public OrderDTO(int order_id, int user_id, Date order_date, String status, String recipient_name, String address, String phone, Date shipping_date, String delivery_status, String payment_method, Date payment_date, String payment_status) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.status = status;
        this.recipient_name = recipient_name;
        this.address = address;
        this.phone = phone;
        this.shipping_date = shipping_date;
        this.delivery_status = delivery_status;
        this.payment_method = payment_method;
        this.payment_date = payment_date;
        this.payment_status = payment_status;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date + ", status=" + status + ", recipient_name=" + recipient_name + ", address=" + address + ", phone=" + phone + ", shipping_date=" + shipping_date + ", delivery_status=" + delivery_status + ", payment_method=" + payment_method + ", payment_date=" + payment_date + ", payment_status=" + payment_status + '}';
    }

    public int getOrder_id() { return order_id; }
    public int getUser_id() { return user_id; }
    public Date getOrder_date() { return order_date; }
    public String getStatus() { return status; }
    public String getRecipient_name() { return recipient_name; }
    public String getAddress() { return address; }
    public String getPhone() { return phone; }
    public Date getShipping_date() { return shipping_date; }
    public String getDelivery_status() { return delivery_status; }
    public String getPayment_method() { return payment_method; }
    public Date getPayment_date() { return payment_date; }
    public String getPayment_status() { return payment_status; }
    
    public void setOrder_id(int order_id) { this.order_id = order_id; }
    public void setUser_id(int user_id) { this.user_id = user_id; }
    public void setOrder_date(Date order_date) { this.order_date = order_date; }
    public void setStatus(String status) { this.status = status; }
    public void setRecipient_name(String recipient_name) { this.recipient_name = recipient_name; }
    public void setAddress(String address) { this.address = address; }
    public void setPhone(String phone) { this.phone = phone; }
    public void setShipping_date(Date shipping_date) { this.shipping_date = shipping_date; }
    public void setDelivery_status(String delivery_status) { this.delivery_status = delivery_status; }
    public void setPayment_method(String payment_method) { this.payment_method = payment_method; }
    public void setPayment_date(Date payment_date) { this.payment_date = payment_date; }
    public void setPayment_status(String payment_status) { this.payment_status = payment_status; }
}