/**
 * This class provides some basic methods for accessing a MySQL DB.
 * It uses Java JDBC and MySQL JDBC driver, mysql-connector-java-5.1.18-bin.jar
 * to open an modify the DB.
 *
 */


// You need to import the java.sql package to use JDBC methods and classes

import java.sql.*;


/**
 * @author kenb
 *
 */
public class Utilities {

    //fields
    private Connection conn = null; // Connection object

    /**
     * Open a MySQL DB connection where user name and password are predefined
     * (hardwired) within the method.
     */
    public void openDB()
    {
        openDB(null, null);
    }

    /******************** 1 Write and Test ********************************
     * Overload the open method that opens a MySQL DB with the user name and
     * password given as input.
     *
     * @param username is a String that is the DB account username
     * @param password is a String that is the password the account
     */
    public void openDB(String username, String password)
    {
        // Database Info
        String url = "jdbc:mysql://zoe.cs.plu.edu:3306/";
        String db = "dt367_2016";

        if (username == null) username = "dt367";
        if (password == null) password = "dt367";

        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url+db, username, password);
        } catch (SQLException e) {
            System.out.println("Error connecting to database: " + e.toString());
        } catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
    }

    /**
     * Close the connection to the DB
     */
    public void closeDB() {
        try {
            if (conn != null)
                conn.close();
            conn = null;
        } catch (SQLException e) {
            System.err.println("Failed to close database connection: " + e);
        }
    }



    public int addStudentAccount(String name, String password, String email)
    {
        try
        {
            PreparedStatement q = conn.prepareStatement("insert into student (name, password, email) " +
                    "VALUES (?, ?, ?)");
            q.setString(1, name);
            q.setString(2, password);
            q.setString(3, email);
            return q.executeUpdate();
        } catch (SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }

    public int addSchedule(String email, String degree, String starting_semester, String starting_year, String name)
    {
        try
        {
            PreparedStatement q = conn.prepareStatement("INSERT INTO schedule (student_email, degree, starting_semester, starting_year, name) " +
                    "VALUES (?,?,?,?,?)");
            q.setString(1, email);
            q.setString(2, degree);
            q.setString(3, starting_semester);
            q.setString(4, starting_year);
            q.setString(5, name);
            return q.executeUpdate();
        } catch (SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }

    public int addAdvisor(String student_email, String advisor_email)
    {
        try
        {
            PreparedStatement q = conn.prepareStatement("update student set advisor_email = ? " +
                    "where email = ?");
            q.setString(1, advisor_email);
            q.setString(2, student_email);
            return q.executeUpdate();
        } catch (SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }

    public int deleteCourse(String dept, String course_number)
    {
        try
        {
            PreparedStatement q = conn.prepareStatement("DELETE FROM course " +
                    "WHERE department = ? AND course_number = ?");
            q.setString(1, dept);
            q.setString(2, course_number);
            return q.executeUpdate();
        } catch (SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }
    
    /**
     * Checks to see whether the student has met the requirements for graduation
     * @return the Courses still needed for graduation
     */
    public ResultSet evaluateSchedule(){
    	ResultSet r;
    	
    	return null;
    }

    /**
     * @return the conn
     */
    public Connection getConn() {
        return conn;
    }

    /**
     * @param conn the conn to set
     */
    public void setConn(Connection conn) {
        this.conn = conn;
    }

}// Utilities class