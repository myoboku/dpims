

package smstest;

import java.sql.*;

public class dbcon {
    public static Connection con=null;
    public static Connection in()
    {
    try{
       
    Class.forName("com.mysql.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/coa","root","");
    }catch(Exception e){}
     return con;
    }
    public static Connection out()
    {
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/coa","root","");
            }catch (Exception e){}
            return con;
    }
   }


