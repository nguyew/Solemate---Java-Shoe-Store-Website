
package Models;

import java.io.Serializable;

    public class CartItem implements Serializable{
    private static final long serialVersionUID = 1L;
    private String productName;
    private String productSize;
    private double price;
    private int quantity;
    private String productImage;

    public CartItem(String productName, String productSize, double price, int quantity, String productImage) {
        this.productName = productName;
        this.productSize = productSize;
        this.price = price;
        this.quantity = quantity;
        this.productImage = productImage;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
    
    

    // Tính tổng giá trị của sản phẩm
    public double getTotalPrice() {
        return price * quantity;
    }
}
    

