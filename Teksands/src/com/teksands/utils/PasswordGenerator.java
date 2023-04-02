package com.teksands.utils;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PasswordGenerator {
	
	//Website URL
	//http://theopentutorials.com/tutorials/java/util/generating-a-random-password-with-restriction-in-java/
	
	//private static final String ALPHA_CAPS 	= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	//private static final String ALPHA 	= "abcdefghijklmnpqrstuvwxyz";
	private static final String NUM 	= "123456789";
	//private static final String SPL_CHARS	= "!@#$%^&*()";

	//private static int noOfCAPSAlpha = 0;
	private static int noOfDigits = 6;
	//private static int noOfSplChars = 0;
	private static int minLen = 6;
	private static int maxLen = 6;
	
	public static char[] generatePswd() 
	{
		if(minLen > maxLen)
			throw new IllegalArgumentException("Min. Length > Max. Length!");
		/*if( (noOfCAPSAlpha + noOfDigits + noOfSplChars) > minLen )
			throw new IllegalArgumentException
			("Min. Length should be atleast sum of (CAPS, DIGITS, SPL CHARS) Length!");*/
		Random rnd = new Random();
		int len = rnd.nextInt(maxLen - minLen + 1) + minLen;
		char[] pswd = new char[len];
		int index = 0;
		/*for (int i = 0; i < noOfCAPSAlpha; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = ALPHA_CAPS.charAt(rnd.nextInt(ALPHA_CAPS.length()));
		}*/
		for (int i = 0; i < noOfDigits; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = NUM.charAt(rnd.nextInt(NUM.length()));
		}
		/*for (int i = 0; i < noOfSplChars; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = SPL_CHARS.charAt(rnd.nextInt(SPL_CHARS.length()));
		}*/
		/*for(int i = 0; i < len; i++) {
			if(pswd[i] == 0) {
				pswd[i] = ALPHA.charAt(rnd.nextInt(ALPHA.length()));
			}
		}*/
		return pswd;
	}

	private static int getNextIndex(Random rnd, int len, char[] pswd) 
	{
		int index = rnd.nextInt(len);
		while(pswd[index = rnd.nextInt(len)] != 0);
		return index;
	}
	
	public static void main(String[] args) 
	{
		/*char[] pswd = generatePswd();*/
	}
	
	//Password Check
	//Website URL
	//http://www.mkyong.com/regular-expressions/how-to-validate-password-with-regular-expression/
    private static Pattern pattern;
    private static Matcher matcher;

    //private static final String PASSWORD_PATTERN = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()]).{8,16})";
    //private static final String PASSWORD_PATTERN = "((?=.*\\d)(?=.*([a-z]|[A-Z])).{8,16})";
    private static final String PASSWORD_PATTERN = "((?=.*\\d)(?=.*([0-9])).{6,16})";
    
    /**
    * Validate password with regular expression
    * @param password password for validation
    * @return true valid password, false invalid password
    */
    public static boolean passwordValidate(String password)
    {
	   pattern = Pattern.compile(PASSWORD_PATTERN);
	   matcher = pattern.matcher(password);
	   return matcher.matches();
    }
}
