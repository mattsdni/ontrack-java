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
                case 1: callAddStudentAccount(); break;
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
        System.out.println("1)  callAddStudentAccount() ");
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

    // close the database;
    public static void callCloseDB() {
        System.out.print("The value of testObj.conn before closing the DB: ");
        System.out.println(testObj.getConn());
        testObj.closeDB(); //close the DB connection
        System.out.print("The value of testObj.conn after closing the DB: ");
        System.out.println(testObj.getConn());
    }


    public static void callAddStudentAccount()
    {
        System.out.print("Enter name: ");
        String name = keyboard.nextLine();
        System.out.print("Enter password: ");
        String password = keyboard.nextLine();
        System.out.print("Enter email: ");
        String email = keyboard.nextLine();
        int result = testObj.addStudentAccount(name, password, email);
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