package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

    private final static String serverName = "localhost";
    private final static String dbName = "SoleMate";
    private final static String portNumber = "1433";
    private final static String instance = ""; 
    private final static String userID = "sa";
    private final static String password = "123456";

    public static Connection getConnection() {
        String url;

        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        } else {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        }

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            System.out.println("❌ JDBC Driver not found. Please check if mssql-jdbc is added.");
            return null;
        }

        try {
            Connection con = DriverManager.getConnection(url, userID, password);
            System.out.println("✅ Database connected successfully!");
            return con;
        } catch (SQLException ex) {
            System.out.println("❌ Failed to connect to SQL Server. Reason: " + ex.getMessage());
        }
        return null;
    }
}
