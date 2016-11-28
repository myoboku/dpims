package smstest;

/**
 *
 * @author devil
 */

import java.awt.*;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class timer {
  
    Toolkit tkit;
    Timer tmr;
    static  String msgout; 
    static int id=0,counter=0;
    static double latitude,longitude;
    
    String pno;
    public timer()
    {
        tkit = Toolkit.getDefaultToolkit();
        tmr = new Timer();
      // the timer method responsible for contineously looping with an interval of 10 second.
        tmr.scheduleAtFixedRate(new rmtask(),0, 10000);      
        
    }
    class rmtask extends TimerTask{

        @Override
        public void run() {
            
            
            
   try
    {
       Connection con_user=dbcon.in();
       Statement user_smt = con_user.createStatement();
     
     
     
     Connection con_in= dbcon.in();
     Statement smt = con_in.createStatement();
     ResultSet rs = smt.executeQuery("select * from msgin");
     rs.absolute(counter);
   
      /**
       * checks wether any new message arrived
       */
       if( rs.next())
       {
        id = rs.getInt(1);
        counter= rs.getInt(12);
        pno=rs.getString(4);
        String msg=rs.getString(7);
        int status=rs.getInt(13);
        System.out.println(id+" "+counter);
        
        System.out.println(pno);
        counter=id;
        
        ResultSet rs_user=user_smt.executeQuery("select latitude,longitude  from users where m_no="+pno);
       /**
        * condition to check if the message is forwarded for processing and the user requesting information is 
        * a registered user.
        */
        if(status==0  && rs_user.next())
                {
                  
                  
                  latitude=  rs_user.getDouble(1);
                  longitude=rs_user.getDouble(2);
        
                  PreparedStatement ps1=con_in.prepareCall("update msgin set counter="+counter+",processed=1 where id="+id);
        
                  ps1.executeUpdate();
                  msgout = ProcessingUnit.process(msg,latitude,longitude);
                  Connection con_out=dbcon.out();
                  PreparedStatement ps2= con_out.prepareStatement("insert into msgout (msgtxt,msgto) values (?,?)");
      
         
                  ps2.setString(1, msgout);
                  ps2.setString(2, pno);
                  ps2.executeUpdate();
                  ps2.close();
        
                  System.out.println(msgout);
                  System.out.println(pno);       
     
                 // PreparedStatement delete=con_in.prepareStatement("delete from msgin where id="+);
                 // delete.executeUpdate();
                  
                  PreparedStatement ps3=con_in.prepareStatement("truncate table msgin");
                  /**
                   * condition to check wether the no of message in msgin table lies in the integer range
                   * if it exceeds the given limit of inbox (msgin) table  then the table is truncated.
                   */
                  if(id>=32000)
                  {
                      ps3.executeUpdate();
                      counter=0; //resets the counter
                      id=0;     // resets the id field
                      
                  }
                  ps3.close();
                  
                  con_out.close();
                    
                }
        
    } 
      
       System.out.println("Still working");
  
    }catch (SQLException e){Logger.getLogger(timer.class.getName()).log(Level.SEVERE, null, e);}
   
        }

        private String getOutputMessage(String afdghges_rg_ere) {
            return "not supported yet";
            
        }
        
    }
 
    
    public static void main(String args[])
    {
        new timer();
    }
 
}

