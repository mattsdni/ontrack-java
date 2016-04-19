/**
 * This program is used to test the Utilities class
 *
 * sources:
 *  http://www.java2s.com/Code/Java/Database-SQL-JDBC/Outputdatafromtable.htm
 */

// You need to import the java.sql package to use JDBC
import java.sql.*;
import java.util.LinkedList;
import java.util.Scanner;

/**
 * @author kenb
 *
 */
public class TestUtilities {

    // Global variables
    static Utilities testObj = new Utilities();       // Utilities object for testing
    static Scanner keyboard = new Scanner(System.in); // standard input

    public static void main(String[] args) throws SQLException {

        // variables needed for menu
        int choice;


        displaymenu();
        choice = getChoice();

        while (choice != 9) {

            switch (choice) {
                case 0: callOpenDB();	break;
                case 1: callOpenDBUserPass();	break;
                case 2: callWorksOnProjectInDepartment(); break;
                case 3: callProjectStats(); break;
                case 4: callWorksOnProjWith(); break;
                case 5: callEmpWithOutWork(); break;
                case 6: callUpdateWorksOn(); break;
                case 8: callCloseDB(); break;
                default: System.out.println("Method not implemented at this time");
            }// switch

            System.out.println();
            displaymenu();
            choice = getChoice();

        }

    }// main

    static void displaymenu() {
        System.out.println("0)  openDB()");
        System.out.println("1)  openDB(user, pass, dbName)");
        System.out.println("2)  WorksOnProjectInDepartment(projName)");
        System.out.println("3)  ProjectStats()");
        System.out.println("4)  WorksOnProjWith(empFname, empLname) ");
        System.out.println("5)  EmployeeWithoutWork(First, Last Name) ");
        System.out.println("6)  UpdateWorksOn(data) ");
        System.out.println("7)  othermethods");
        System.out.println("8)  close the DB");
        System.out.println("9)  quit");
    }

    static int getChoice() {
        int i = -1;
        try {
            System.out.print("Please enter an integer between 0-9: ");
            i = Integer.parseInt(keyboard.nextLine());
            while (i < 0 || i > 9) {
                System.out.println();
                System.out.print("Please enter an integer between 0-9: ");
                i = Integer.parseInt(keyboard.nextLine());
            }
        }catch (NumberFormatException e) {
            System.out.println("I SAID AN INTEGER!!!!");
        }

        return i;
    }

    // open the default open database;
    public static void callOpenDB() {
        System.out.print("The value of testObj.conn before opening the DB: ");
        System.out.println(testObj.getConn());
        testObj.openDB();
        System.out.print("The value of testObj.conn after opening the DB: ");
        System.out.println(testObj.getConn());
    }

    // open the default open database;
    public static void callOpenDBUserPass() {
        System.out.print("The value of testObj.conn before opening the DB: ");
        System.out.println(testObj.getConn());
        System.out.print("Enter database username: ");
        String username = keyboard.nextLine();
        System.out.print("Enter database password: ");
        String password = keyboard.nextLine();
        testObj.openDB(username, password);
        System.out.print("The value of testObj.conn after opening the DB: ");
        System.out.println(testObj.getConn());
    }


    // close the database;
    public static void callCloseDB() {
        System.out.print("The value of testObj.conn before closing the DB: ");
        System.out.println(testObj.getConn());
        testObj.closeDB(); //close the DB connection
        System.out.print("The value of testObj.conn after closing the DB: ");
        System.out.println(testObj.getConn());
    }

    public static void callWorksOnProjectInDepartment()
    {
        System.out.println("Enter a project name: ");
        int dnum;
        try
        {
            dnum = Integer.parseInt(keyboard.nextLine());
            printResultSet(testObj.worksOnProjectInDepartment(dnum));
        }catch (NumberFormatException e)
        {
            System.out.println("Department number must be an integer...");
        }
    }

    public static void callProjectStats()
    {
        printResultSet(testObj.projectStats());
    }

    public static void callEmpWithOutWork()
    {
        printResultSet(testObj.empWithOutWork());
    }

    public static void callWorksOnProjWith()
    {
        System.out.print("Enter first name: ");
        String fname = keyboard.nextLine();
        System.out.print("Enter last name: ");
        String lname = keyboard.nextLine();
        printResultSet(testObj.worksOnProjWith(fname, lname));
    }

    public static void callMatchLastName()
    {
        printResultSet(testObj.matchLastName("Kin"));
    }

    public static void callUpdateWorksOn()
    {
        String cont = "y";
        LinkedList<String[]> data = new LinkedList<>();
        String[] row;
        while (cont.contains("y"))
        {
            System.out.print("Enter SSN: ");
            row = new String[3];
            row[0] = keyboard.nextLine();

            System.out.print("Enter Project Number: ");
            row[1] = keyboard.nextLine();

            System.out.print("Enter Hours: ");
            row[2] = keyboard.nextLine();

            data.add(row);

            System.out.println("Add another row? ");
            cont = keyboard.nextLine();
        }
        String[][] data_array = new String[data.size()][3];
        for (int i = 0; i < data_array.length; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                data_array[i][j] = data.get(i)[j];
            }
        }
        int result = testObj.updateWorksOn(data_array);

        System.out.println(result + " row" + (result > 1 ? "s were" : " was") + " affected") ;
    }

    private static void printResultSet(ResultSet rs)
    {
        try
        {
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


        } catch (SQLException e)
        {
            e.printStackTrace();
        }

    }

}//MyUtilitiesTest	