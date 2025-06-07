package DAO;

import Models.BrandDTO;
import Models.ProductDTO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<ProductDTO> getAllProducts() {
        List<ProductDTO> products = new ArrayList<>();
        String query = "SELECT * FROM Products";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("brand_id"),
                        rs.getString("category_id"),
                        rs.getDouble("price"),
                        rs.getString("size"),
                        rs.getString("description"),
                        rs.getString("image")
                );
                products.add(product);
            }

        } catch (Exception e) {
            System.out.println("Load all products error: "+e.getMessage());
        }

        return products;
    }

    public List<BrandDTO> getAllBrand() {
        List<BrandDTO> brands = new ArrayList<>();
        String query = "SELECT * FROM Brands";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                BrandDTO brand = new BrandDTO(
                        rs.getInt("brand_id"),
                        rs.getString("brand_name")
                );
                brands.add(brand);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return brands;
    }

    public List<ProductDTO> getProductByBrandID(String bid) {
        List<ProductDTO> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE brand_id = ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {

            // Gọi setString sau khi tạo PreparedStatement
            ps.setString(1, bid);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand_id"),
                            rs.getString("category_id"),
                            rs.getDouble("price"),
                            rs.getString("size"),
                            rs.getString("description"),
                            rs.getString("image")
                    );
                    products.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public List<ProductDTO> getProductByCategoryID(String cid) {
        List<ProductDTO> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE category_id = ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {

            // Gọi setString sau khi tạo PreparedStatement
            ps.setString(1, cid);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand_id"),
                            rs.getString("category_id"),
                            rs.getDouble("price"),
                            rs.getString("size"),
                            rs.getString("description"),
                            rs.getString("image")
                    );
                    products.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public List<ProductDTO> searchProductsByName(String keyword) {
        List<ProductDTO> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE product_name LIKE ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, "%" + keyword + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand_id"),
                            rs.getString("category_id"),
                            rs.getDouble("price"),
                            rs.getString("size"),
                            rs.getString("description"),
                            rs.getString("image")
                    );
                    products.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public ProductDTO getProductByID(String pid) {
        String query = "SELECT * FROM Products WHERE product_id = ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {

            // Gọi setString sau khi tạo PreparedStatement
            ps.setString(1, pid);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    return new ProductDTO(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand_id"),
                            rs.getString("category_id"),
                            rs.getDouble("price"),
                            rs.getString("size"),
                            rs.getString("description"),
                            rs.getString("image")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    //phân trang 
    public List<ProductDTO> getProductsByPage(int offset, int limit) {
        List<ProductDTO> products = new ArrayList<>();
        String query = "SELECT * FROM Products ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, offset);
            ps.setInt(2, limit);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand_id"),
                            rs.getString("category_id"),
                            rs.getDouble("price"),
                            rs.getString("size"),
                            rs.getString("description"),
                            rs.getString("image")
                    );
                    products.add(product);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public int getTotalProductCount() {
        String query = "SELECT COUNT(*) FROM Products";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public void createProduct(ProductDTO product) {
        String query = "INSERT INTO Products (product_name, brand_id, category_id, price, size, description, image) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, product.getProduct_name());
            ps.setString(2, product.getBrand_id());
            ps.setString(3, product.getCategory_id());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getSize());
            ps.setString(6, product.getDescription());
            ps.setString(7, product.getImage());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Create product error: "+e.getMessage());
        }
    }

    public void updateProduct(ProductDTO product) {
        String query = "UPDATE Products SET "
                + "product_name = ?, brand_id = ?, category_id = ?, price = ?, size = ?, description = ?, image = ? "
                + "WHERE product_id = ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, product.getProduct_name());
            ps.setString(2, product.getBrand_id());
            ps.setString(3, product.getCategory_id());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getSize());
            ps.setString(6, product.getDescription());
            ps.setString(7, product.getImage());
            ps.setInt(8, product.getProduct_id());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Update product error: "+e.getMessage());
        }
    }
    
    public void deleteProduct(int id) {
        String sqlPreqOrder= "DELETE FROM OrderDetails WHERE product_id=?";
        String sqlPreqReview= "DELETE FROM Reviews WHERE product_id=?";
        String sql = "DELETE FROM Products WHERE product_id=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement stmt1= conn.prepareStatement(sqlPreqOrder);
            PreparedStatement stmt2= conn.prepareStatement(sqlPreqReview);
            PreparedStatement stmt3 = conn.prepareStatement(sql);
            stmt1.setInt(1, id);
            stmt2.setInt(1, id);
            stmt3.setInt(1, id);

            stmt1.executeUpdate();
            stmt2.executeUpdate();
            stmt3.executeUpdate();
        } catch (Exception e) {
            System.out.println("Delete user error: " + e.getMessage());
        }
    }
    
    public List<ProductDTO> searchProducts(String keyword) {
    List<ProductDTO> products = new ArrayList<>();
    String query = "SELECT * FROM Products WHERE product_name LIKE ? OR description LIKE ?";

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        String likeKeyword = "%" + keyword + "%";
        ps.setString(1, likeKeyword);
        ps.setString(2, likeKeyword);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("brand_id"),
                        rs.getString("category_id"),
                        rs.getDouble("price"),
                        rs.getString("size"),
                        rs.getString("description"),
                        rs.getString("image")
                );
                products.add(product);
            }
        }

    } catch (Exception e) {
        System.out.println("Search products error: " + e.getMessage());
    }

    return products;
}

}
