package ontrack;
/**
 * This class provides some basic methods for accessing a MySQL DB.
 * It uses Java JDBC and MySQL JDBC driver, mysql-connector-java-5.1.18-bin.jar
 * to open an modify the DB.
 *
 */


// You need to import the java.sql package to use JDBC methods and classes

import org.jasypt.util.password.StrongPasswordEncryptor;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.*;
import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    /**
     * Opens the database
     * @param username is a String that is the DB account username
     * @param password is a String that is the password the account
     */
    public void openDB(String username, String password)
    {
        // Database Info
        String url = "jdbc:mysql://zoe.cs.plu.edu:3306/";
        try
        {
            String ip = InetAddress.getLocalHost().toString();
            if (ip.contains("192.168."))
                url = "jdbc:mysql://127.0.0.1:2000/";

        } catch (UnknownHostException e)
        {
            e.printStackTrace();
        }

        String db = "dt367_2016";

        if (username == null) username = "dt367";
        if (password == null) password = "dt367";

        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url+db, username, password);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("attempting to use ssh tunnel to database over port 2000");
            url = "jdbc:mysql://127.0.0.1:2000/";
            try
            {
                conn = DriverManager.getConnection(url+db, username, password);
            } catch (SQLException e1)
            {
                System.out.println("failed to connect over ssh over port 2000");
                System.out.println("Please run this command on your terminal (if on mac/linux)");
                System.out.println("ssh –N –L 2000:zoe.cs.plu.edu:3306 username@haven.cs.plu.edu ");
                System.out.println("if on windows, use putty or cygwin");
                System.out.println("For more details, see https://www.cs.plu.edu/courses/csce367/spring2016/courseMaterial/1-Accessing%20MySQL%20off-campus.pdf");
            }

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
        if (conn == null)
            openDB();
        Pattern r = Pattern.compile(".+@.+\\..+");

        // Now create matcher object.
        Matcher m = r.matcher(email);
        if (!m.find())
        {
            return -1;
        }

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
            return -1;
        }
    }

    /**
     * Adds the following parameters to a Student Schedule
     * @param email
     * @param degree
     * @param starting_semester
     * @param starting_year
     * @param name
     * @return (1) the row count for SQL Data Manipulation Language (DML) statements
     *         (2) 0 for SQL statements that return nothing
     *         (3) -1 for failure
     */
    public int addSchedule(String email, String degree, String starting_semester, String starting_year, String name)
    {
        if (conn == null)
            openDB();
        try
        {
            PreparedStatement q = conn.prepareStatement("INSERT INTO schedule " +
                    "(student_email, degree, starting_semester, starting_year, name) " +
                    "VALUES (?,?,?,?,?)");
            q.setString(1, email);
            q.setString(2, degree);
            q.setString(3, starting_semester);
            q.setString(4, starting_year);
            q.setString(5, name);
            return q.executeUpdate();
        } catch (SQLException e)
        {
            return -1;
        }
    }

    /**
     * Adds an advisor email to a student row in db
     * @param student_email
     * @param advisor_email
     * @return (1) the row count for SQL Data Manipulation Language (DML) statements
     *         (2) 0 for SQL statements that return nothing
     *         (3) -1 for failure
     */
    public int addAdvisor(String student_email, String advisor_email)
    {
        if (conn == null)
            openDB();
        try
        {
            PreparedStatement q = conn.prepareStatement("update student set advisor_email = ? " +
                    "where email = ?");
            q.setString(1, advisor_email);
            q.setString(2, student_email);
            return q.executeUpdate();
        } catch (SQLException e)
        {
            return -1;
        }
    }

    /**
     * Queries database for all advisors
     * @return A ResultSet of the all advisors
     */
    public ResultSet getAllAdvisors(){
        ResultSet rset = null;
        String sql = null;
        if (conn == null)
            openDB();

        try {
            // create a Statement and an SQL string for the statement
            sql = "SELECT advisor.name, advisor.email\n" +
                    "FROM advisor";
            Statement s = conn.createStatement();
            rset = s.executeQuery(sql);
        } catch (SQLException e) {
            return null;
        }

        return rset;
    }

    public ResultSet getAdvisor(String student_email){
        ResultSet rset = null;
        String sql = null;

        try {
            // create a Statement and an SQL string for the statement
            sql = "SELECT student.advisor_email, advisor.name\n" +
                    "FROM student, advisor\n" +
                    "WHERE student.email = ? and student.advisor_email = advisor.email";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.clearParameters();
            pstmt.setString(1, student_email);

            rset = pstmt.executeQuery();
        } catch (SQLException e) {
            return null;
        }
        return rset;
    }

    /**
     * Deletes a course from a given schedule
     * @param dept
     * @param course_number
     * @param schedule_id
     * @return (1) the row count for SQL Data Manipulation Language (DML) statements
     *         (2) 0 for SQL statements that return nothing
     *         (3) -1 for failure
     */
    public int deleteCourse(String dept, String course_number, int schedule_id)
    {
        if (conn == null)
            openDB();
        if(evaluateCourseString(dept, course_number) == -1){
            //invalid course inputted
            return -1;
        }
        try
        {
            PreparedStatement q = conn.prepareStatement("DELETE FROM has_course " +
                    "WHERE department = ? AND course_number = ? AND schedule_id = ?");
            q.clearParameters();
            q.setString(1, dept);
            q.setString(2, course_number);
            q.setInt(3, schedule_id);
            return q.executeUpdate();
        } catch (SQLException e)
        {
        	System.out.println(e.getMessage());
            return -1;
        }
    }
    
    /**
     * Checks to see whether the student has met the requirements for graduation
     * @param schedule_id The id of the schedule
     * @return the Courses still needed for graduation
     */
    public LinkedList<String> evaluateSchedule(int schedule_id){
        if (conn == null)
            openDB();
    	//Load the ResultSets
    	ResultSet cs, math;
    	cs = evaluateCoreCS(schedule_id);
    	math = evaluateMath(schedule_id);
    	int CSElectives = evaluateCSElectives(schedule_id);
    	int science = evaluateScience(schedule_id);
    	//Used to store statements to the user
    	LinkedList<String> printoutList = new LinkedList<String>();
    	
    	if(rowCounter(cs) == 0){
    		printoutList.add("You have taken all the required CSCE courses");
    	}
    	else {
            try {
                printoutList.add("Here are the CSCE courses you still need to take:");
                printoutList.add(resultSetString(cs));
            }catch(NullPointerException e)
            {
                printoutList.add("Something went wrong evaluating cs");
            }
    	}
    	if(CSElectives >= 12){
    		printoutList.add("You have taken all the required CS Electives");
    	}
    	else {
            printoutList.add("You have not taken enough CS Electives");
        }
    	
    	if(rowCounter(math) == 0){
    		printoutList.add("You have taken all the required Math courses");
    	}
    	else {
            try {
    		    printoutList.add("Here are the Math courses you still need to take:");
        	    printoutList.add(resultSetString(math));
            }catch(NullPointerException e)
            {
                printoutList.add("Something went wrong evaluating math");
            }
        }
    	
    	if(science <= 0){
    		printoutList.add("You have taken all the required Science courses");
    	}
    	else {
            printoutList.add("You have not satisfied the year of lab science requirement");
        }
    	
    	return printoutList;
    }
    /**
     * Queries database for CS courses the student still has to take
     * @param id The id of the Schedule
     * @return A ResultSet of the CSCE courses the student still needs to take to fulfill the requirements
     */
    private ResultSet evaluateCoreCS(int id){
    	ResultSet rset = null;
		String sql = null;

		try {
			// create a Statement and an SQL string for the statement
			sql = "SELECT department, course_number " +
                    "FROM requirements JOIN requires_course on requirements.req_number=requires_course.req_number " +
			  "WHERE requirements.req_number = 4 and  (department, course_number) not in " +
			  "(select department, course_number from has_course where schedule_id = ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.clearParameters();
			pstmt.setInt(1,id); //set the 1 parameter
			
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			return null;
		}

		return rset;
    }
    /**
     * Queries database for math courses the student still has to take
     * @param id The id of the Schedule
     * @return rset
     */
  private int evaluateCSElectives(int id){
	  ResultSet rset = null;
		String sql = null;
		int credits = 0;
		try {
			// create a Statement and an SQL string for the statement
			sql = "(select distinct sum(course.credits) as total_electives " +
                    "from has_course h join course on h.department = course.department " +
                    "AND h.course_number = course.course_number " +
                  "where schedule_id=? and (h.department, h.course_number) in " +
                        "(select department, course_number from course " +
                    "where course_number regexp '^(3|4)' and course.department='CSCE' " +
                    "and (course.department, course_number) not in " +
                    "(select course.department, course.course_number " +
                    "from course join requires_course on course.department = requires_course.department " +
                    "AND course.course_number = requires_course.course_number " +
                                     " where req_number=4)))";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.clearParameters();
			pstmt.setInt(1,id); //set the 1st parameter
			
			 
			rset = pstmt.executeQuery();

            rset.next();

            try
            {
                credits = Integer.parseInt(rset.getString(1));
            }
            catch (Exception e)
            {
                return -1;
            }
		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);
            return -1;
		}
		return credits;
	  
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
			sql = "SELECT department, course_number " +
                    "FROM requirements JOIN requires_course on requirements.req_number=requires_course.req_number " +
			  "WHERE requirements.req_number = 6 and  (department, course_number) not in " +
			  "(select department, course_number from has_course where schedule_id = ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.clearParameters();
			pstmt.setInt(1,id); //set the 1 parameter
			
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			return null;
		}

		return rset;
    }
    /**
     * Queries database for Science courses the student still has to take
     * @param id The id of the schedule
     * @return A ResultSet of possible science courses the student can take to fulfill the requirements
     */
    private int evaluateScience(int id){
    	ResultSet rset = null;
		String sql = null;
        int credits;
		try {
			// create a Statement and an SQL string for the statement
			sql = "(select (select num_credits from requirements " +
                    "where requirements.req_number=7)-sum(credits) as credits from course join " +
                    "  (select department, course_number from requirements " +
                    "    JOIN requires_course on requirements.req_number=requires_course.req_number " +
                    "  where requirements.req_number=7 and (department, course_number) IN " +
                    "                                      (select has_course.department, has_course.course_number " +
                    "                                       from has_course where schedule_id=?)) x " +
                    "    on (x.department, x.course_number)= " +
                    "       (course.department, course.course_number))";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.clearParameters();
			pstmt.setInt(1,id); //set the 1 parameter
			
			rset = pstmt.executeQuery();
            rset.next();
            try
            {
                credits = Integer.parseInt(rset.getString(1));
            }
            catch (Exception e)
            {
                return 1; //needs to be positive since this is how many lab sci credits you still need to take
            }
            return credits;
        } catch (SQLException e) {
			return -1;
		}

    }
    /**
     * Counts the number of rows in a result set
     * @param set The ResultSet whose rows are counted
     * @return The number of rows in set
     *          -1 if SQLException
     */
    private int rowCounter(ResultSet set){
    	// This came in handy:
        // http://stackoverflow.com/questions/8292256/get-number-of-rows-returned-by-resultset-in-java
    	int rows = 0;
    	try {
    		set.beforeFirst();
			while(set.next()){
				rows++;
			}
		} catch (SQLException e) {
			return -1;
		}
    	return rows;
    }
    /**
     * Returns the contents of the given ResultSet in String format
     * @param rs
     * @return String representation of ResultSet
     */
    private String resultSetString(ResultSet rs)
    {
    	StringBuilder sb = new StringBuilder();
        try
        {
        	rs.beforeFirst();
            ResultSetMetaData rsmd = rs.getMetaData();

            int numberOfColumns = rsmd.getColumnCount();

           for (int i = 1; i <= numberOfColumns; i++) {
                String columnName = rsmd.getColumnName(i);
                sb.append("\t" + columnName);
            }
            sb.append("\n");
            while (rs.next()) {
                for (int i = 1; i <= numberOfColumns; i++) {
                    String columnValue = rs.getString(i);
                    sb.append("\t" + columnValue);
                }
                sb.append("\n");
            }

        } catch (SQLException e)
        {
            return "Invalid Resultset in resultSetString";
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

    /**
     * Evaluates the input for adding a course to determine if the input is valid
     * @param courseDepartment the department for the course
     * @param courseNumber the number for the course
     * @return 1 if the course department and course number are valid, otherwise -1
     */
    public int evaluateCourseString(String courseDepartment, String courseNumber){
        if(courseDepartment.length() != 4){
            return -1;
        }
        if(!(courseNumber.length() == 3 || courseNumber.length() == 4)){
            return -1;
        }
        if(!courseDepartment.matches("CSCE|MATH|PHYS|CHEM|BIOL|GEOS")){
            return -1;
        }
        Pattern regDepartment = Pattern.compile("^[a-zA-Z]{4}");
        Matcher m = regDepartment.matcher(courseDepartment);
        if (!m.find())
        {
            return -1;
        }
        /*evaluate courseNumber*/
        Pattern  regNum = Pattern.compile("\\d{3}[abAB]?$");
        m = regNum.matcher(courseNumber);
        if (!m.find())
        {
            return -1;
        }
        return 1;
    }

    public ResultSet getSchedule(int id)
    {
        ResultSet rset = null;
        String sql = null;
        if (conn == null)
            openDB();

        try {
            // create a Statement and an SQL string for the statement
            sql = "select * from has_course join course on has_course.department = course.department AND has_course.course_number = course.course_number " +
                    "where schedule_id = "+ id + " order by course_year, -course_semester, has_course.department, has_course.course_number";
            Statement s = conn.createStatement();
            rset = s.executeQuery(sql);
        } catch (SQLException e) {
            return null;
        }
        return rset;
    }

    public String getScheduleNameById(int id)
    {
        ResultSet rset = null;
        String sql = null;
        if (conn == null)
            openDB();
        try {
            // create a Statement and an SQL string for the statement
            sql = "select name from schedule where id = " + id ;
            Statement s = conn.createStatement();
            rset = s.executeQuery(sql);
            if (rset != null)
            {
                rset.next();
                return rset.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getScheduleId() {
        ResultSet rset = null;
        String sql = null;
        if (conn == null)
            openDB();

        try {
            // create a Statement and an SQL string for the statement
            sql = "SELECT id FROM schedule ORDER BY id DESC LIMIT 1";
            Statement s = conn.createStatement();
            rset = s.executeQuery(sql);
        } catch (SQLException e) {
            return null;
        }
        return rset;
    }

    /**
     * Adds the null course to a new semester on the end of schedule
     * effectively adding a blank semester to the schedule.
     * @param id of the schedule
     * @return the name of the semester that it was added to
     */
    public String addNewSemesterToEndOfSchedule(String id)
    {
        String result = null;
        String sql = null;
        ResultSet rset = null;
        if (conn == null)
        {
            openDB();
        }

        try
        {
            //TODO: put this whole thing into 1 sql statement
            sql = "select course_year, course_semester from has_course where schedule_id = 1 order by -course_year, course_semester limit 1";
            Statement stmt = conn.createStatement();
            rset = stmt.executeQuery(sql);
            rset.next();
            String year = rset.getString(1);
            String semester = rset.getString(2);
            sql = "INSERT INTO `dt367_2016`.`has_course` (`schedule_id`, `department`, `course_number`, `course_semester`, `course_year`) \n" +
                    "VALUES (" + id + ", 'null', 'null', '" + year +"', '" + semester +"');";
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            return whichSemesterComesAfter(semester);
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return null;
    }

    private String whichSemesterComesAfter(String semester)
    {
        if (semester.equals("FALL"))
            return "J-TERM";
        if (semester.equals("J-TERM"))
            return "SPRING";
        return "FALL";
    }

    public String login(String email, String password)
    {
        String result = null;
        String sql = null;
        ResultSet rset = null;
        if (conn == null)
        {
            openDB();
        }

        try {
            sql = "select password, name from student where email = \"" + email + "\"";
            Statement stmt = conn.createStatement();
            rset = stmt.executeQuery(sql);
            StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
            rset.next();
            if(passwordEncryptor.checkPassword(password, rset.getString("password")))
            {
                return rset.getString("name");
            }

        } catch (SQLException e) {
            return result;
        }
        return result;
    }

    //debug only
    public void printResultSet(ResultSet rs) {
        try {
            ResultSetMetaData rsmd = rs.getMetaData();

            int numberOfColumns = rsmd.getColumnCount();

            for (int i = 1; i <= numberOfColumns; i++) {
                String columnName = rsmd.getColumnName(i);
                System.out.format("%15s", columnName);
            }
            System.out.println();

            while (rs.next()) {
                for (int i = 1; i <= numberOfColumns; i++) {
                    String columnValue = rs.getString(i);
                    System.out.format("%15s", columnValue);
                }
                System.out.println("");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}// ontrack.Utilities class