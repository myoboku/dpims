package smstest;

/**
 * This class serves as the interface to the message sending and receiving unit as well as for the android application. It receives data from both of these units and processes them to produce the appropriate output.
 * @author Saqib Nizam Shamsi
 */
public class ProcessingUnit
{
    public static String process(String message)
    {
       String output = MessageProcessor.findRemedies(message);
       return output;
    }

    public static String process(String message, double latitude, double longitude)
    {
        return MessageProcessor.process(message, latitude, longitude);
    }
}
