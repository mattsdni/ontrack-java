package ontrack; /**
 * This program is used to test the Utilities class
 * <p>
 * sources:
 * http://www.java2s.com/Code/Java/Database-SQL-JDBC/Outputdatafromtable.htm
 */

// You need to import the java.sql package to use JDBC

import java.sql.*;
import java.util.LinkedList;
import java.util.Scanner;

/**
 * @authors Matt Dennie, Jeoff V, Philip P, Joseph B
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

        while (choice != 7) {

            switch (choice) {
                case 0:
                    callOpenDB();
                    break;
                case 1:
                    callAddStudentAccount();
                    break;
                case 2:
                    callAddSchedule();
                    break;
                case 3:
                    callAddAdvisor();
                    break;
                case 4:
                    callDeleteCourse();
                    break;
                case 5:
                    callEvaluateSchedule();
                    break;
                case 6:
                    callCloseDB();
                    break;
                default:
                    System.out.println("Method not implemented at this time");
            }// switch

            System.out.println();
            displaymenu();
            choice = getChoice();

        }

    }// main

    /**
     * Prints out the menu
     */
    static void displaymenu() {
        System.out.println("0)  openDB");
        System.out.println("1)  AddStudentAccount");
        System.out.println("2)  addSchedule");
        System.out.println("3)  addAdvisor");
        System.out.println("4)  deleteCourse");
        System.out.println("5)  evaluateSchedule");
        System.out.println("6)  close the DB");
        System.out.println("7)  quit");
    }

    /**
     *  Gets the users number choice
     *  corresponds to the menu
     * @return i, the number entered by the user
     */
    static int getChoice() {
        int i = -1;
        try {
            System.out.print("Please enter an integer between 0-7: ");
            i = Integer.parseInt(keyboard.nextLine());
            while (i < 0 || i > 9) {
                System.out.println();
                System.out.print("Please enter an integer between 0-7: ");
                i = Integer.parseInt(keyboard.nextLine());
            }
        } catch (NumberFormatException e) {
            System.out.println("I SAID AN INTEGER!!!!");
        }

        return i;
    }

    /**
     * open the default open database;
     */
    public static void callOpenDB() {
        System.out.print("The value of testObj.conn before opening the DB: ");
        System.out.println(testObj.getConn());
        testObj.openDB();
        System.out.print("The value of testObj.conn after opening the DB: ");
        System.out.println(testObj.getConn());
    }

    /**
     * Closes the database
     */
    public static void callCloseDB() {
        System.out.print("The value of testObj.conn before closing the DB: ");
        System.out.println(testObj.getConn());
        testObj.closeDB(); //close the DB connection
        System.out.print("The value of testObj.conn after closing the DB: ");
        System.out.println(testObj.getConn());
    }


    /**
     * Calls addStudentAccount from Utilities class
     */
    public static void callAddStudentAccount() {
        System.out.print("Enter name: ");
        String name = keyboard.nextLine();
        System.out.print("Enter password: ");
        String password = keyboard.nextLine();
        System.out.print("Enter email: ");
        String email = keyboard.nextLine();
        int result = testObj.addStudentAccount(name, password, email);

        printRowsAffected(result);
    }

    /**
     * Calls addSchedule from Utilities class
     */
    public static void callAddSchedule() {
        System.out.print("Enter student email: ");
        String email = keyboard.nextLine();
        System.out.print("Enter degree (B.A. or B.S.): ");
        String degree = keyboard.nextLine();
        System.out.print("Enter starting semester (Fall, Spring): ");
        String starting_semester = keyboard.nextLine();
        System.out.print("Enter starting year: ");
        String starting_year = keyboard.nextLine();
        System.out.print("Enter schedule name: ");
        String name = keyboard.nextLine();

        printRowsAffected(testObj.addSchedule(email, degree, starting_semester, starting_year, name));
    }

    /**
     * Calls addAdvisor from Utilities class
     */
    public static void callAddAdvisor() {
        System.out.print("Enter student email: ");
        String student_email = keyboard.nextLine();
        System.out.print("Enter advisor email: ");
        String advisor_email = keyboard.nextLine();

        printRowsAffected(testObj.addAdvisor(student_email, advisor_email));
    }

    /**
     * Calls deleteCourse from Utilities class
     */
    public static void callDeleteCourse() {
        System.out.print("Enter department: ");
        String dept = keyboard.nextLine();
        System.out.print("Enter course number: ");
        String course_number = keyboard.nextLine();
        System.out.print("Enter schedule id: ");
        int scheduleID = keyboard.nextInt();
        printRowsAffected(testObj.deleteCourse(dept, course_number, scheduleID));
    }

    /**
     * Calls evaluateSchedule in Utilities class
     */
    public static void callEvaluateSchedule() {
        System.out.print("Enter schedule number: ");
        int num = keyboard.nextInt();
        LinkedList<String> l = testObj.evaluateSchedule(num);
        for (String s : l) {
            System.out.println(s);
        }

    }

    static void callGetAllAdvisors() throws SQLException {
        ResultSet rs;
        rs = testObj.getAllAdvisors();
        while(rs.next()){
            System.out.println(rs.getString(1));
        }
    }

    static void callGetAdvisor() throws SQLException {
        ResultSet rs;
        String student_email = keyboard.nextLine();
        rs = testObj.getAdvisor(student_email);
        while(rs.next()){
            System.out.println(rs.getString(1));
        }
    }

    /**
     * Prints number of rows affected according to the integer passed in
     * @param result
     */
    private static void printRowsAffected(int result) {
        System.out.println(result + " row" + (result != 1 ? "s were" : " was") + " affected");
    }

    /**
     * Prints out a formatted version of the result set to stdout
     * @param rs
     */
    private static void printResultSet(ResultSet rs) {
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

}//MyUtilitiesTest	