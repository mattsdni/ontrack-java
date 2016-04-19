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
        //String url = "jdbc:mysql://zoe.cs.plu.edu:3306/";
        String url = "jdbc:mysql://zoe.cs.plu.edu:3306/";
        String db = "company367_2016";

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

    /**
     * This method creates an SQL statement to list fname, lname, salary of all
     * employees that work in the department with dname='Research'
     *
     * @return ResultSet that contains three columns lname, fname, salary of
     * all employees that work in the research department
     */
    public ResultSet getNameSalary() {
        ResultSet rset = null;
        String sql = null;

        try {
            // create a Statement and an SQL string for the statement
            Statement stmt = conn.createStatement();
            sql = "SELECT lname, fname, salary FROM employee, department " +
                    "WHERE dno=dnumber and dname='Research' " +
                    "ORDER BY lname, fname";
            rset = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("createStatement " + e.getMessage() + sql);
        }

        return rset;
    }// getNameSalary

    /**
     * This method creates an SQL statement to list fname, lname, and department
     * number of all employees that have a last name that starts with
     * the String target
     *
     * @param target the string used to match beginning of employee's last name
     * @return ResultSet that contains lname, fname, and department number of all
     * employees that have a first name that starts with target.
     */
    public ResultSet matchLastName(String target)
    {
        ResultSet rset = null;
        String sql = null;

        try {
            // create a Statement and an SQL string for the statement
            Statement stmt = conn.createStatement();
            sql = "SELECT dno, lname, fname FROM employee " +
                    "WHERE lname like '"+target+"%' " +
                    "ORDER BY dno";
            rset = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("createStatement " + e.getMessage() + sql);
        }

        return rset;
    }

    /**
     * This method creates an SQL statement to list fname, lname, and department
     * number of all employees that work in the department with number
     * dno
     *
     * @param dno the department number
     * @return ResultSet that contains lname, fname, and department number of all
     * employees that work in the department number dno
     */
    //EXAMPLE OF USING A PreparedStatement AND SETTING Parameters
    public ResultSet employeeByDNO(int dno) {
        ResultSet rset = null;
        String sql = null;

        try {
            // create a Statement and an SQL string for the statement
            sql = "SELECT dno, lname, fname FROM employee " +
                    "WHERE dno = ? " +
                    "ORDER BY dno";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.clearParameters();
            pstmt.setInt(1,dno); //set the 1 parameter

            rset = pstmt.executeQuery();
        } catch (SQLException e) {
            System.out.println("createStatement " + e.getMessage() + sql);
        }

        return rset;
    }// matchLastName2

    /******************** 2 Write and Test ********************************
     * Write a method that returns lname, fname, project number and hours of
     * all employees that work on a project controlled by department, deptNum.
     * Here deptNum is given as input from the client
     *
     * @param deptNum is the controlling department number
     * @return ResultSet with lname, fname, project number and hours of
     * all employees that work on a project controlled by department dno
     */
    public ResultSet worksOnProjectInDepartment(int deptNum)
    {
//        select lname, fname, project.pnumber, hours
//        from employee, works_on, project
//        where ssn=works_on.essn and project.dnum=5
        try
        {
            PreparedStatement q = conn.prepareStatement("");
            return q.executeQuery();
        } catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    /******************** 3 Write and Test ********************************
     * Write a method that returns for each project the number of employees that
     * work on the project, the total number of hours they have all worked on the
     * project, and the average number of hours each employee has worked on the
     * project.
     *
     * @return ResultSet that has for each project the number of employees that
     * work on the project, the total number of hours they have all worked on the
     * project, and the average number of hours each employee has worked on project
     */
    public ResultSet projectStats()
    {
        try
        {
            PreparedStatement q = conn.prepareStatement("SELECT p.pname, count(*) AS num_employees, sum(w.hours) AS total_hours, avg(w.hours) AS avg_hours " +
                    "FROM employee e, works_on w, project p " +
                    "WHERE e.ssn=w.essn AND w.pno = p.pnumber " +
                    "GROUP BY p.pname");
            return q.executeQuery();
        } catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    /******************** 4 Write and Test ********************************
     * Write a method that returns fname, lname, salary, and dno for each employee
     * that works on a project with the employee specified by input values
     * empFname, empLname
     *
     * @param empFname is the first name of the employee
     * @param empLname is the last name of the employee
     * @return ResultSet that has fname, lname, salary, and dno for each employee
     * that works on a project with the employee empFname, empLname
     */
    public ResultSet worksOnProjWith(String empFname, String empLname)
    {
        try
        {
            PreparedStatement q = conn.prepareStatement("select distinct concat(fname, ' ', lname) as name, salary, dno " +
                    "from employee, works_on " +
                    "where ssn=essn and pno in " +
                    "(select pno from employee, works_on where ssn=essn and fname=? and lname=?)");
            q.setString(1, empFname);
            q.setString(2, empLname);
            return q.executeQuery();
        } catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    /******************** 5 Write and Test ********************************
     * Retrieve the names of employees who do not work on any project and their salary
     * Names must be in the format "lname, fname" i.e., the last name and first name
     * must be concatenated.
     *
     * @return ResultSet that has employee name and salary of all employees that do
     *         not work on any project.
     */
    public ResultSet empWithOutWork()
    {
        try
        {
            PreparedStatement q = conn.prepareStatement("SELECT concat(e.fname, ' ',e.lname) as name, salary " +
                    "FROM employee e " +
                    "LEFT JOIN works_on w " +
                    "ON e.ssn=w.essn " +
                    "WHERE w.essn IS NULL");
            return q.executeQuery();
        } catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }


    /******************** 6  Write and Test ********************************
     * YOU MUST USE A PreparedStatement
     * This method will use a PreparedStatement and the information in data
     * to update the works_on table.  Each row of the 2-dim array, data,
     * contains the 3 attributes for one tuple in the works_on
     * table. The 2-dim array is a nx3 array and the column format is (essn, pno, hours)
     * The method returns the number of tuples successfully inserted.
     *
     * @param data is a nx3 table of Strings where each row has the format (essn, pno, hours)
     * @return number of tuples successfully inserted into works_on
     */
    public int updateWorksOn(String[][] data)
    {
        int result = 0;
        for (String[] row : data)
        {
            try
            {
                PreparedStatement q = conn.prepareStatement("INSERT INTO works_on (essn, pno, hours) VALUES (?,?,?) " +
                        "ON DUPLICATE KEY UPDATE " +
                        "essn = VALUES(essn), " +
                        "pno = VALUES(pno), " +
                        "hours = VALUES(hours)");
                q.setString(1, row[0]);
                q.setString(2, row[1]);
                q.setString(3, row[2]);
                result += q.executeUpdate();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        return result;
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