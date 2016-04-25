/**
 * This class provides some basic methods for accessing a MySQL DB.
 * It uses Java JDBC and MySQL JDBC driver, mysql-connector-java-5.1.18-bin.jar
 * to open an modify the DB.
 *
 */


// You need to import the java.sql package to use JDBC methods and classes

import org.jasypt.util.password.StrongPasswordEncryptor;

import java.sql.*;
import java.util.LinkedList;

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
        StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
        try
        {
            PreparedStatement q = conn.prepareStatement("insert into student (name, password, email) " +
                    "VALUES (?, ?, ?)");
            q.setString(1, name);
            q.setString(2, passwordEncryptor.encryptPassword(password));
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
     * @param schedule_id The id of the schedule
     * @return the Courses still needed for graduation
     */
    public LinkedList<String> evaluateSchedule(int schedule_id){
    	//Load the ResultSets
    	ResultSet cs, math, science;
    	cs = evaluateCoreCS(schedule_id);
    	math = evaluateMath(schedule_id);
    	science = evaluateScience(schedule_id);
    	//Used to store statements to the user
    	LinkedList<String> printoutList = new LinkedList<String>();
    	
    	if(rowCounter(cs) == 0){
    		printoutList.add("You have taken all the required CSCE courses");
    	}
    	else {
    		printoutList.add("Here are the CSCE courses you still need to take:");
    		printoutList.add(printResultSet(cs));
    	}
    	
    	if(rowCounter(math) == 0){
    		printoutList.add("You have taken all the required Math courses");
    	}
    	else {
    		printoutList.add("Here are the Math courses you still need to take:");
        	printoutList.add(printResultSet(math));
        }
    	
    	if(rowCounter(science) < 7){
    		printoutList.add("You have taken all the required Science courses");
    	}
    	else {
    		printoutList.add("Here are the Science courses you could choose from to fulfill the science requirement:");
        	printoutList.add(printResultSet(science));
        }
    	
    	return printoutList;
    }
    /**
     * 
     * @param id The id of the Schedule
     * @return A ResultSet of the CSCE courses the student still needs to take to fulfill the requirements
     */
    private ResultSet evaluateCoreCS(int id){
    	ResultSet rset = null;
		String sql = null;

		try {
			// create a Statement and an SQL string for the statement
			sql = "SELECT department, course_number FROM requirements JOIN requires_course on requirements.req_number=requires_course.req_number " +
			  "WHERE requirements.req_number = 4 and  (department, course_number) not in " +
			  "(select department, course_number from has_course where schedule_id = ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.clearParameters();
			pstmt.setInt(1,id); //set the 1 parameter
			
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);
		}

		return rset;
    }
    /**
     * 
     * @param id The id of the Schedule
     * @return A ResultSet of the math courses the student still needs to take to fulfill the requirements
     */
    private ResultSet evaluateMath(int id){
    	ResultSet rset = null;
		String sql = null;

		try {
			// create a Statement and an SQL string for the statement
			sql = "SELECT department, course_number FROM requirements JOIN requires_course on requirements.req_number=requires_course.req_number " +
			  "WHERE requirements.req_number = 6 and  (department, course_number) not in " +
			  "(select department, course_number from has_course where schedule_id = ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.clearParameters();
			pstmt.setInt(1,id); //set the 1 parameter
			
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);
		}

		return rset;
    }
    /**
     * 
     * @param id The id of the schedule
     * @return A ResultSet of possible science courses the student can take to fulfill the requirements
     */
    private ResultSet evaluateScience(int id){
    	ResultSet rset = null;
		String sql = null;

		try {
			// create a Statement and an SQL string for the statement
			sql = "SELECT department, course_number FROM requirements JOIN requires_course on requirements.req_number=requires_course.req_number " +
			  "WHERE requirements.req_number = 7 and  (department, course_number) not in " +
			  "(select department, course_number from has_course where schedule_id = ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.clearParameters();
			pstmt.setInt(1,id); //set the 1 parameter
			
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);
		}

		return rset;
    }
    /**
     * 
     * @param set The ResultSet whose rows are counted
     * @return The number of rows in set
     */
    private int rowCounter(ResultSet set){
    	// This came in handy: http://stackoverflow.com/questions/8292256/get-number-of-rows-returned-by-resultset-in-java
    	int rows = 0;
    	try {
			while(set.next()){
				rows++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return rows;
    }
    /**
     * Returns the contents of the given ResultSet in String format
     * @param rs
     * @return 
     */
    private static String printResultSet(ResultSet rs)
    {
    	StringBuilder sb = new StringBuilder();
        try
        {
            ResultSetMetaData rsmd = rs.getMetaData();

            int numberOfColumns = rsmd.getColumnCount();

            for (int i = 1; i <= numberOfColumns; i++) {
                String columnName = rsmd.getColumnName(i);
                sb.append("%15s" + columnName);
            }
            sb.append("/n");

            while (rs.next()) {
                for (int i = 1; i <= numberOfColumns; i++) {
                    String columnValue = rs.getString(i);
                    sb.append("%15s" + columnValue);
                }
                sb.append("");
            }


        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return sb.toString();
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