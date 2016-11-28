package smstest;

import idw.Point;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * This class handles all the calls to the database.
 *
 * @author Saqib Nizam Shamsi
 */
public class DBManager
{
    public static final String SUCCESS_MESSAGE = "Data Successfully Entered";

    /**
     * Returns a remedy if found according to the disease ID and the given amount of severity.
     *
     * @param id       ID of the disease as in the manual
     * @param severity Severity of the disease in percentage
     * @return Name and amount of the chemical that is to be used on the crop. If the disease corresponding to the id is not found in the database, ERR:02 is returned. If there is a connectivity problem, ERR:05 is returned.
     */
    public static String diseaseLookup(int id, double severity)
    {
        return lookup("DiseaseRemedy", "DiseaseID", ErrorMessages.DISEASE_NOT_FOUND, id, severity);
    }

    /**
     * Returns a remedy if found according to the pest ID and the given amount of severity.
     *
     * @param id       ID of the pest as in the manual
     * @param severity Severity of the pest in percentage
     * @return Name and amount of the chemical that is to be used on the crop. If the pest corresponding to the id is not found in the database, ERR:03 is returned. If there is a connectivity problem, ERR:05 is returned.
     */
    public static String pestLookup(int id, double severity)
    {
        return lookup("PestRemedy", "PestID", ErrorMessages.PEST_NOT_FOUND, id, severity);
    }

    private static String lookup(String tableName, String colName, String errorMessage, int id, double severity)
    {
        String remedy;
        // Check whether the value entered for severity is within the range [0, 100]
        if (!(severity >= 0 && severity <= 100))
            return ErrorMessages.INVALID_VALUE_ENTERED;
        try
        {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            Statement statement1 = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT Chemical, Dose FROM " + tableName + " WHERE " + colName + " = " + String.valueOf(id) + " AND " + String.valueOf(severity) + " >= SeverityLowerBound AND " + String.valueOf(severity) + " <= SeverityUpperBound");
            int subtract = tableName.length() - "remedy".length();
            ResultSet resultSet1 = statement1.executeQuery("SELECT Name FROM " + tableName.substring(0, subtract) + " WHERE ID = " + id);
            String problem = "";
            if (resultSet1.next())
            {
                problem = (String) resultSet1.getObject(1);
            }
            if (resultSet.next())
            {
                remedy = (String) resultSet.getObject(1);
                remedy = problem + ": " + remedy + " " + resultSet.getObject(2) + " lit/ha";
            } else
                remedy = errorMessage;
        } catch (SQLException e)
        {
            //e.printStackTrace();
            remedy = ErrorMessages.TECHNICAL_ISSUE;
        } catch (ClassNotFoundException e)
        {
            remedy = ErrorMessages.TECHNICAL_ISSUE;
        } catch (Exception e)
        {
            remedy = ErrorMessages.TECHNICAL_ISSUE;
        }

        return remedy;
    }

    private static Connection getConnection() throws SQLException, ClassNotFoundException
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(Constants.DATABASE_URI, Constants.USERNAME, Constants.PASSWORD);
        return connection;
    }

    public static Object[] getGeoLocationalData(String tableName, String problem, int id) throws SQLException, ClassNotFoundException
    {
        Connection connection = getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT Latitude, Longitude, Severity FROM " + tableName + " WHERE Problem = \'" + problem + "\' AND ProblemID = " + id);
        ArrayList<Point> points = new ArrayList<Point>();
        ArrayList<Double> weights = new ArrayList<Double>();
        while (resultSet.next())
        {
            double latitude = resultSet.getDouble(1);
            double longitude = resultSet.getDouble(2);
            double severity = resultSet.getDouble(3);

            Point p = new Point(latitude, longitude);

            points.add(p);
            weights.add(severity);
        }

        int length = points.size();
        Point[] p = new Point[length];
        double[] w = new double[length];
        for (int i = 0; i < length; i++)
        {
            p[i] = points.get(i);
            w[i] = weights.get(i);
        }
        return new Object[]{p, w};
    }

    public static String storeGeoLocationalData(String tableName, String problem, int id, double latitude, double longitude, double severity)
    {
        String problemTable = null;
        String error = null;
        // Check whether the given problem exists in the database or not
        try
        {
            Connection connection = getConnection();

            // Validate Input
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT TableName FROM Problems WHERE ID = \'" + problem + "\'");
            if (resultSet.next())
            {
                problemTable = (String) resultSet.getObject(1);
                if (problemTable.equalsIgnoreCase("Disease"))
                    error = ErrorMessages.DISEASE_NOT_FOUND;
                else if (problemTable.equalsIgnoreCase("Pest"))
                    error = ErrorMessages.PEST_NOT_FOUND;
            }
            if (problemTable == null)
                return ErrorMessages.INVALID_PROBLEM_ID;
            if (!exists(connection, problemTable, "ID", "ID = " + id))
                return error;
            if (severity < 0 || severity > 100)
                return ErrorMessages.INVALID_VALUE_ENTERED;

            // If the input is correct, then enter data into the table

            // See if the data is from a previously existing source
            boolean latitudeExists = exists(connection, tableName, "Latitude", " Latitude = " + latitude);
            boolean longitudeExists = exists(connection, tableName, "Longitude", " Longitude = " + longitude);
            boolean problemExists = exists(connection, tableName, "Problem", "Latitude = " + latitude + " AND Longitude = " + longitude + " AND Problem = \'" + problem + "\'");
            boolean problemIDExists = exists(connection, tableName, "ProblemID", "Latitude = " + latitude + " AND Longitude = " + longitude + " AND ProblemID = " + id);
            //System.out.println(problemExists + "  " + problemIDExists);

            if (latitudeExists && longitudeExists && problemExists && problemIDExists)
            {
                updateGeoLocationalData(tableName, problem, id, latitude, longitude, severity);
            } else
            {
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO " + tableName + " (Latitude, Longitude, Problem, ProblemID, Severity) VALUES (" + latitude + ", " + longitude + ", \'" + problem + "\', " + id + ", " + severity + ")");
            /*System.out.println("INSERT INTO " + tableName + " (Latitude, Longitude, Problem, ProblemID, Severity) VALUES (" + latitude + ", " + longitude + ", \'" + problem +"\', " + id + ", " + severity + ")");*/
                preparedStatement.execute();
            }
        } catch (ClassNotFoundException e)
        {
            //e.printStackTrace();
            return ErrorMessages.TECHNICAL_ISSUE;
        } catch (SQLException e)
        {

            //e.printStackTrace();
            return ErrorMessages.TECHNICAL_ISSUE;
        }

        return SUCCESS_MESSAGE;
    }

    public static boolean updateGeoLocationalData(String tableName, String problem, int id, double latitude, double longitude, double severity) throws SQLException, ClassNotFoundException
    {
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement("UPDATE " + tableName + " SET Severity = " + severity + " WHERE Latitude = " + latitude + " AND Longitude = " + longitude + " AND Problem = \'" + problem + "\' AND ProblemID = " + id);
        return statement.execute();
    }

    public static boolean exists(Connection connection, String tableName, String colName, String whereClause) throws SQLException
    {
        Statement statement = connection.createStatement();
        //System.out.println("SELECT " + colName + " FROM " + tableName + " WHERE " + whereClause);
        ResultSet resultSet = statement.executeQuery("SELECT " + colName + " FROM " + tableName + " WHERE " + whereClause);
        return resultSet.next() && !(resultSet.getObject(1) == null);
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException
    {
        Object[] lists = getAllProblems("RCEData");
        String[] problems = (String[]) lists[0];
        int[] ids = (int[]) lists[1];
        System.out.println(Arrays.toString(problems));
        System.out.println(Arrays.toString(ids));
    }

    public static Object[] getAllProblems(String tableName) throws SQLException, ClassNotFoundException
    {
        Connection connection = getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT DISTINCT Problem, ProblemID FROM " + tableName);
        ArrayList<String> s = new ArrayList<String>();
        ArrayList<Integer> I = new ArrayList<Integer>();
        while (resultSet.next())
        {
            s.add((String) resultSet.getObject(1));
            I.add((Integer) resultSet.getObject(2));
        }
        int length = s.size();
        String[] problems = new String[length];
        int[] ids = new int[length];
        for (int i = 0; i < length; i++)
        {
            problems[i] = s.get(i);
            ids[i] = I.get(i);
        }

        return new Object[]{problems, ids};
    }
}
