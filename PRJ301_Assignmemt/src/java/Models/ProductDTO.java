package Models;


public class ProductDTO {
    private int product_id;
    private String product_name;
    private String brand_id;
    private String category_id;
    private double price;
    private String size;
    private String description;
    private String image;

    public ProductDTO() {
    }

    public ProductDTO(int product_id, String product_name, String brand_id, String category_id, double price, String size, String description, String image) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.brand_id = brand_id;
        this.category_id = category_id;
        this.price = price;
        this.size = size;
        this.description = description;
        this.image = image;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(String brand_id) {
        this.brand_id = brand_id;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "product_id=" + product_id + ", product_name=" + product_name + ", brand_id=" + brand_id + ", category_id=" + category_id + ", price=" + price + ", size=" + size + ", description=" + description + ", image=" + image + '}';
    }
    

    
}



