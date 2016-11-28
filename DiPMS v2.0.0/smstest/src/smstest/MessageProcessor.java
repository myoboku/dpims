package smstest;

import idw.Interpolation;
import idw.Mathematics;
import idw.Point;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Objects;

/**
 * @author Saqib Nizam Shamsi
 */
public class MessageProcessor
{
    private static String remedyLookup(String word)
    {
        String[] codes = word.split(Constants.CODE_SEPARATOR);
        // System.out.println(Arrays.toString(codes));
        String remedy;
        if(codes.length == Constants.WORD_ARRAY_LENGTH)
        {
            char lookup = codes[0].charAt(0);
            String[] fragments = codes[1].split(Constants.VALUE_SEPARATOR);
            switch(lookup)
            {
                case Constants.DISEASE_1:
                case Constants.DISEASE_2:
                    try
                    {
                        remedy = DBManager.diseaseLookup(Integer.parseInt(fragments[0]), Double.parseDouble(fragments[1]));
                    }
                    catch(Exception e)
                    {
                        remedy = ErrorMessages.INVALID_INPUT;
                    }
                    break;
                case Constants.PEST_2:
                case Constants.PEST_1:
                    try
                    {
                        remedy = DBManager.pestLookup(Integer.parseInt(fragments[0]), Double.parseDouble(fragments[1]));
                    }
                    catch(Exception e)
                    {
                        remedy = ErrorMessages.INVALID_INPUT;
                    }
                    break;
                default:
                    remedy = ErrorMessages.INVALID_INPUT;
            }
        }
        else
            return ErrorMessages.INVALID_INPUT;
        return remedy;
    }

    public static String findRemedies(String msg)
    {
        StringBuffer message = new StringBuffer();
        String[] problems = msg.split(Constants.WORD_SEPARATOR);
        for(int i = 0; i < problems.length; i++)
            message.append(remedyLookup(problems[i])).append("\n");

        return message.toString();
    }

    public static String[] cleave(String rawMessage)
    {
        if(rawMessage == null)
            return new String[]{"", ""};
        rawMessage = rawMessage.trim();
        String[] broken = rawMessage.split("\\s+");
        String part2 = "";
        for(int i = 1; i < broken.length; i++)
            part2 += broken[i];
        return new String[]{broken[0], part2};
    }

    public static void main(String args[])
    {
        System.out.println(process("RCE p-1:23, d-6:34", 89.95, 42.42));
        //System.out.println(process("RCE d-1:54.33, p-2:25.98, x-1:80.0", 26.4284, -77.8957));
    }

    private static void test01()
    {
        System.out.println("Trial One:");
        System.out.println(findRemedies("d-1:80,d-2:50,p-1:40,p-2:70"));
        System.out.println("Trial Two:");
        System.out.println(findRemedies(("d-1:80 d-250, p-1:40,p-2:70")));
        System.out.println("Trial Three:");
        System.out.println(findRemedies("Yep, p-2:30,d-4:40"));
        System.out.println("Trial Four:");
        System.out.println(findRemedies("P-02:35.5,D-01:80.5"));
        System.out.println("Trial Five:");
        System.out.println(findRemedies("Disease-2:30,Pest-4:90, D-3:79"));

    }

    private static void test02()
    {
        System.out.println("Trial One:");
        System.out.println(process("RCE", 23.852, 98.332));
        System.out.println("Trial Two:");
        System.out.println(process("Rce d-1:54.33, p-2:25.98, x-1:80.0", 26.4284, -77.8957));
    }



    public static String process(String rawMessage, double latitude, double longitude)
    {
        // First break the message into two parts
        String[] broken = cleave(rawMessage);
        if(broken[1].equals(""))
        {
            String solution = getSolutions(broken[0], latitude, longitude);
            if(solution.length() != 0)
                return solution;
            else
                return Constants.EMPTY_RESULT;
        }
        else
        {
            storeData(broken[0], broken[1], latitude, longitude);
            return findRemedies(broken[1]);
        }
    }

    public static String storeData(String cropCode, String data, double latitude, double longitude)
    {
        String[] words = data.split(Constants.WORD_SEPARATOR);
        StringBuffer sb = new StringBuffer();
        for(String word : words)
        {
            sb.append(storeWord(cropCode, word, latitude, longitude)).append("\n");
        }
        return sb.toString();
    }

    private static String getSolutions(String cropCode, double latitude, double longitude)
    {
        try
        {
            Object[] lists = DBManager.getAllProblems(cropCode + "Data");
            String[] problems = (String[]) lists[0];
            int[] ids = (int[]) lists[1];
            StringBuffer sb = new StringBuffer();
            for(int i = 0; i < problems.length; i++)
            {
                Object[] data = DBManager.getGeoLocationalData(cropCode + "Data", problems[i], ids[i]);
                Point[] points = (Point[]) data[0];
                double[] weights = (double[]) data[1];
                double interpolatedWeight = Interpolation.computeWeight(points, weights, new Point(latitude, longitude), 2);
                if(problems[i].equalsIgnoreCase("D"))
                    sb.append(DBManager.diseaseLookup(ids[i], interpolatedWeight)).append("\n");
                else
                    sb.append(DBManager.pestLookup(ids[i], interpolatedWeight)).append("\n");

            }

            return sb.toString();

        } catch (SQLException e)
        {
            e.printStackTrace();
            return ErrorMessages.INVALID_CROP_CODE;
        } catch (ClassNotFoundException e)
        {
            e.printStackTrace();
            return ErrorMessages.TECHNICAL_ISSUE;
        }
    }


    public static String storeWord(String cropCode, String word, double latitude, double longitude)
    {
        word = word.trim();
        if(word.length() == 0)
            return "";
        try
        {
            String[] values = word.split(Constants.CODE_SEPARATOR);
            String[] v = values[1].split(Constants.VALUE_SEPARATOR);
            int id = Integer.parseInt(v[0]);
            double severity = Double.parseDouble(v[1]);
            return DBManager.storeGeoLocationalData(cropCode + "data", values[0].toUpperCase(), id, latitude, longitude, severity);
        }
        catch(Exception e)
        {
            return ErrorMessages.INVALID_INPUT;
        }

    }

}
