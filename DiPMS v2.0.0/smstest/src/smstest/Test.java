package smstest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * @author Saqib
 */
public class Test
{
    public static void main(String[] args)
    {
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
  	  	Date date = new Date();
  	  	System.out.println(dateFormat.format(date));
        //test02();
    }    
    
    public static void test01()
    {
    	String testString1 = "My name is Saqib";
        String testString2 = "Hello,\tSaqib";
        String testString3 = "That\nBoy";
        System.out.println(testString1);
        System.out.println(testString2);
        System.out.println(testString3);

        System.out.println();
        System.out.println("Here Goes!");
        String[] one = testString1.split("\\s+");
        String[] two = testString2.split("\\s+");
        String[] three = testString3.split("\\s+");

        System.out.println(Arrays.toString(one));
        System.out.println(Arrays.toString(two));
        System.out.println(Arrays.toString(three));
    }
    
    public static void test02()
    {
    	System.out.println("One:");
    	System.out.println(ProcessingUnit.process("Rce", 24.75, 35.55));
    	
    	System.out.println("Two:");
    	System.out.println(ProcessingUnit.process("Rce d-3:40, d-1:23, p-1:76", 24.75, 33.33));
    	
    	System.out.println("Three:");
    	System.out.println(ProcessingUnit.process("Rce d-2:45, p-3:70, d-4:78", 25.25, 33.33));
    }
}
