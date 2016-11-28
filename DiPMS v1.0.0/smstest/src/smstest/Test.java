package smstest;

import java.util.Arrays;

/**
 * @author Saqib
 */
public class Test
{
    public static void main(String[] args)
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
}
