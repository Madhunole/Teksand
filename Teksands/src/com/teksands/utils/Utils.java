package com.teksands.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;

import org.apache.commons.codec.binary.Base64;

public class Utils {
	
	public static Integer adminId = 1;
	public static Integer mentorId = 2;
	public static Integer coordinatorId = 3;
	public static Integer managerId = 4;
	public static Integer candidateId = 5;
	public static Integer brandId = 6;
	public static Integer clientId = 7;
	public static Integer recruiterId = 8;
	
	public static int getDaysBetweenDates(Date startdate,Date enddate)
	{
		return (int)( (enddate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24));
	}
	
	public static double getAbsoluteReturns(double startvalue,double endvalue)
	{
		return ((endvalue - startvalue)/startvalue) * 100;
	}
	
	/*
     * Paramterized method to sort Map e.g. HashMap or Hashtable in Java
     * throw NullPointerException if Map contains null key
    */

    public static <K extends Comparable,V extends Comparable> Map<K,V> sortByKeys(Map<K,V> map)
    {
        List<K> keys = new LinkedList<K>(map.keySet());
        Collections.sort(keys);
     
        //LinkedHashMap will keep the keys in the order they are inserted
        //which is currently sorted on natural ordering
        Map<K,V> sortedMap = new LinkedHashMap<K,V>();
        for(K key: keys){
            sortedMap.put(key, map.get(key));
        }

        return sortedMap;
    }
 
    /*
     * Java method to sort Map in Java by value e.g. HashMap or Hashtable
     * throw NullPointerException if Map contains null values
     * It also sort values even if they are duplicates
    */
    public static <K extends Comparable,V extends Comparable> Map<K,V> sortByValues(Map<K,V> map){
        List<Map.Entry<K,V>> entries = new LinkedList<Map.Entry<K,V>>(map.entrySet());
     
        Collections.sort(entries, new Comparator<Map.Entry<K,V>>() {

            @Override
            public int compare(Entry<K, V> o1, Entry<K, V> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
     
        //LinkedHashMap will keep the keys in the order they are inserted
        //which is currently sorted on natural ordering
        Map<K,V> sortedMap = new LinkedHashMap<K,V>();
     
        for(Map.Entry<K,V> entry: entries){
            sortedMap.put(entry.getKey(), entry.getValue());
        }
     
        return sortedMap;
    }
    
    public static String SendHttpPost(String path,String parameters)
    {
   	 try 
   	 {        
            // Send the request
            URL url = new URL(path);
            URLConnection conn = url.openConnection();           
            conn.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            
            //write parameters
            writer.write(parameters);
            writer.flush();
            
            // Get the response
            StringBuffer answer = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            
            while ((line = reader.readLine()) != null) 
            {
                answer.append(line);
            }
            writer.close();
            reader.close();            
            return answer.toString();
            
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
		return null;
    }
    
    public static List<Date> getAllDates(Date start,Date end) throws ParseException
	{
		List<Date> dates = new ArrayList<Date>();

		long interval = 24*1000 * 60 * 60; 
		long endTime = end.getTime(); 
		long curTime = start.getTime();
		
		
		while (curTime <= endTime) {
		    dates.add(new Date(curTime));
		    curTime += interval;
		}
		/*for(int i=0;i<dates.size();i++){
		    Date lDate =(Date)dates.get(i);
		    String ds = formatter.format(lDate);    
		}*/
		return dates;
	}
    
    /**
     * Method to parse a raw query string into parameter-value pairs and return
     * them in a {@code Map}.
     *
     * @param q The raw query string to be parsed.
     * @return {@code Map} containing parameter-value pairs.
     */
    public static Map <String, String> getParameterMap (String queryString) {
     
	 if (queryString.startsWith("?")) {
	      queryString = queryString.substring(1);
	    }
      // Initialize HashMap to store parameter-value pairs.
      Map<String, String> paramMap = new HashMap<String, String>();

      // Store parameter-value pairs in an array.
      String[] params = queryString.split("&");

      // Split parameter-value pairs and store in a HashMap.
      for (String s : params) {
        String[] ss = s.split("=");
        if (ss.length > 1) {
          paramMap.put(ss[0], ss[1]);
        } else if (ss.length == 1) {
          paramMap.put(ss[0], null);
        }
      }
      return paramMap;
    }
    
    public static double getDistanceBetweenLatLng(double lat1, double lng1, double lat2, double lng2) 
  	{
    	   
  	        double earthRadius = 3958.75;
  	        double dLat = Math.toRadians(lat2-lat1);
  	        double dLng = Math.toRadians(lng2-lng1);
  	        double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
  	               Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
  	               Math.sin(dLng/2) * Math.sin(dLng/2);
  	        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  	        
  	        return   earthRadius * c * 1.60934;
  	}
    
    public static List<Date> getAllDates(String start,String end) throws ParseException
	{
		List<Date> dates = new ArrayList<Date>();

		String str_date = start;
		String end_date = end;

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date  startDate = formatter.parse(str_date); 
		Date  endDate = formatter.parse(end_date);
		long interval = 24*1000 * 60 * 60; 
		long endTime = endDate.getTime(); 
		long curTime = startDate.getTime();
		
		
		while (curTime <= endTime) {
		    dates.add(new Date(curTime));
		    curTime += interval;
		}
		/*for(int i=0;i<dates.size();i++){
		    Date lDate =(Date)dates.get(i);
		    String ds = formatter.format(lDate);    
		}*/
		return dates;
	}
    
    public static String getIpAddr(HttpServletRequest request) 
    {      
		   //is client behind something?
		   String ipAddress = request.getHeader("X-FORWARDED-FOR");  
		   if (ipAddress == null) 
		   {  
			   ipAddress = request.getRemoteAddr();  
		   }
		   return ipAddress;
	}  
   
	private static Pattern pattern;
	private static Matcher matcher;
 
	private static final String EMAIL_PATTERN = 
		"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
 
	/**
	 * Validate hex with regular expression
	 * 
	 * @param hex
	 *            hex for validation
	 * @return true valid hex, false invalid hex
	 */
	public static boolean validateEmail(final String hex) {
		pattern = Pattern.compile(EMAIL_PATTERN);
		matcher = pattern.matcher(hex);
		return matcher.matches();
	}
	
	 /***
     * The formatIntoHHMMSS method is used to convert integer seconds in String time.
     * @param secsIn
     * @return String
     */
    public static String formatIntoHHMMSS(int secsIn)
    {
	    int hours = secsIn / 3600;
	    int remainder = secsIn % 3600;
	    int minutes = remainder / 60;
	    int seconds = remainder % 60;
	
	    return ( (hours < 10 ? "0" : "") + hours
	    + ":" + (minutes < 10 ? "0" : "") + minutes
	    + ":" + (seconds< 10 ? "0" : "") + seconds );
    }
    
    public static boolean isValidUrl(String requestUrl,String page)
    {
    	try
    	{
        	if(page.equalsIgnoreCase("") || requestUrl.substring(requestUrl.indexOf(page),requestUrl.length()).equalsIgnoreCase(page))
    		{
    	         return true;
    		}
        	else
        	{
        	     return false;	
        	}
    	}
    	catch(Exception ex)
    	{
    		//ex.printStackTrace();
    		
    		return true;
    	}
    }
    
    public static String month_numberformat(String month)
    {
    	HashMap<String,String> month_map = new HashMap<String,String>();
		month_map.put("JAN","01");
		month_map.put("FEB","02");
		month_map.put("MAR","03");
		month_map.put("APR","04");
		month_map.put("MAY","05");
		month_map.put("JUN","06");
		month_map.put("JUL","07");
		month_map.put("AUG","08");
		month_map.put("SEP","09");
		month_map.put("OCT","10");
		month_map.put("NOV","11");
		month_map.put("DEC","12");
		
		String month_number = month_map.get(month);
		
    	return month_number;
    }
    
    public static String amc_name(String amc_code)
    {
    	HashMap<String,String> amc_name_map = new HashMap<String,String>();
		amc_name_map.put("02 ","AMFI");
		amc_name_map.put("B","Aditya Birla Sun Life Mutual Fund");
		amc_name_map.put("H","HDFC Mutual Fund");
		amc_name_map.put("P","ICICI Prudential Mutual Fund");
		amc_name_map.put("L","SBI Mutual Fund");
		amc_name_map.put("BG","Birla Gold and Precious Metals");
		amc_name_map.put("D","DSP BlackRock Mutual Fund");
		amc_name_map.put("O","HSBC Mutual Fund");
		amc_name_map.put("G","IDFC Mutual Fund");
		amc_name_map.put("IF","IIFL Mutual Fund");
		amc_name_map.put("J","JPMorgan Mutual Fund");
		amc_name_map.put("K","Kotak Mahindra Mutual Fund");
		amc_name_map.put("F","L&T Mutual Fund");
		amc_name_map.put("PP","PPFAS Mutual Fund");
		amc_name_map.put("RM","Reliance Money Precious Metals");
		amc_name_map.put("SH","Shriram Mutual Fund");
		amc_name_map.put("T","TATA Mutual Fund");
		amc_name_map.put("UK","Union KBC Mutual Fund");
		
		String amc_name = amc_name_map.get(amc_code);
		
    	return amc_name;
    }
    
    /*
     * Java method to sort Map in Java by value in DESCENDING oRDER e.g. HashMap or Hashtable
     * throw NullPointerException if Map contains null values
     * It also sort values even if they are duplicates
    */
    public static <K extends Comparable,V extends Comparable> Map<K,V> sortByValuesDescending(Map<K,V> map){
        List<Map.Entry<K,V>> entries = new LinkedList<Map.Entry<K,V>>(map.entrySet());
     
        Collections.sort(entries, new Comparator<Map.Entry<K,V>>() {

            @Override
            public int compare(Entry<K, V> o1, Entry<K, V> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
     
        //LinkedHashMap will keep the keys in the order they are inserted
        //which is currently sorted on natural ordering
        Map<K,V> sortedMap = new LinkedHashMap<K,V>();
     
        for(Map.Entry<K,V> entry: entries){
            sortedMap.put(entry.getKey(), entry.getValue());
        }
     
        return sortedMap;
    }
    
    public static Integer getCompanyDividendReinvestmentCode(String company_name)
    {
    	Integer code = 0;
    	//Code 0 Means, Dividend Declared Date Nav = Dividend Reinvest Nav
    	//Code 1 Means, Dividend Declared Date Nav - Dividend Value = Dividend Reinvest Nav
    	try
    	{
    		HashMap<String, Integer> company_map = new HashMap<String, Integer>();
    		company_map.put("Axis Mutual Fund", 0);
    		company_map.put("Deutsche Mutual Fund", 0);
    		company_map.put("DHFL Pramerica Mutual Fund", 0);
    		company_map.put("DSP BlackRock Mutual Fund", 0);
    		company_map.put("Edelweiss Mutual Fund", 0);
    		company_map.put("Escorts Mutual Fund", 0);
    		company_map.put("Franklin Templeton Mutual Fund", 0);
    		company_map.put("Goldman Sachs Mutual Fund", 0);
    		company_map.put("HDFC Mutual Fund", 0);
    		company_map.put("IDBI Mutual Fund", 0);
    		company_map.put("IDFC Mutual Fund", 0);
    		company_map.put("IIFCL Mutual Fund (IDF)", 0);
    		company_map.put("IIFL Mutual Fund", 0);
    		company_map.put("IL&amp;FS Mutual Fund (IDF)", 0);
    		company_map.put("Indiabulls Mutual Fund", 0);
    		company_map.put("ING Mutual Fund", 0);
    		company_map.put("JM Financial Mutual Fund", 0);
    		company_map.put("JPMorgan Mutual Fund", 0);
    		company_map.put("Kotak Mahindra Mutual Fund", 0);
    		company_map.put("LIC Mutual Fund", 0);
    		company_map.put("Mahindra Mutual Fund", 0);
    		company_map.put("Morgan Stanley Mutual Fund", 0);
    		company_map.put("Motilal Oswal Mutual Fund", 0);
    		company_map.put("PineBridge Mutual Fund", 0);
    		company_map.put("PPFAS Mutual Fund", 0);
    		company_map.put("PRINCIPAL Mutual Fund", 0);
    		company_map.put("Quantum Mutual Fund", 0);
    		company_map.put("Reliance Mutual Fund", 0);
    		company_map.put("Sahara Mutual Fund", 0);
    		company_map.put("SBI Mutual Fund", 0);
    		company_map.put("Shriram Mutual Fund", 0);
    		company_map.put("SREI Mutual Fund (IDF)", 0);
    		company_map.put("Tata Mutual Fund", 0);
    		company_map.put("Union KBC Mutual Fund", 0);
    		company_map.put("UTI Mutual Fund", 0);
    		company_map.put("Baroda Pioneer Mutual Fund", 1);
    		company_map.put("Aditya Birla Sun Life Mutual Fund", 1);
    		company_map.put("BNP Paribas Mutual Fund", 1);
    		company_map.put("BOI AXA Mutual Fund", 1);
    		company_map.put("Canara Robeco Mutual Fund", 1);
    		company_map.put("HSBC Mutual Fund", 1);
    		company_map.put("ICICI Prudential Mutual Fund", 1);
    		company_map.put("Invesco Mutual Fund", 1);
    		company_map.put("L&T Mutual Fund", 1);
    		company_map.put("Mirae Asset Mutual Fund", 1);
    		company_map.put("Peerless Mutual Fund", 1);
    		company_map.put("Sundaram Mutual Fund", 1);
    		company_map.put("Taurus Mutual Fund", 1);
    		
    		if(company_map.get(company_name) != null)
    		{
    			code = company_map.get(company_name);
    		}
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	return code;
    }
	
	public static TreeMap<Integer, Double> getPPFInterestRate()
    {	
		TreeMap<Integer, Double> interest_map = new TreeMap<Integer, Double>();
		
    	try
    	{
    		interest_map.put(1980, 8.0);
    		interest_map.put(1981, 8.5);
    		interest_map.put(1982, 8.5);
    		interest_map.put(1983, 9.0);
    		interest_map.put(1984, 9.5);
    		interest_map.put(1985, 10.0);
    		interest_map.put(1986, 12.0);
    		interest_map.put(1987, 12.0);
    		interest_map.put(1988, 12.0);
    		interest_map.put(1989, 12.0);
    		interest_map.put(1990, 12.0);
    		interest_map.put(1991, 12.0);
    		interest_map.put(1992, 12.0);
    		interest_map.put(1993, 12.0);
    		interest_map.put(1994, 12.0);
    		interest_map.put(1995, 12.0);
    		interest_map.put(1996, 12.0);
    		interest_map.put(1997, 12.0);
    		interest_map.put(1998, 12.0);
    		interest_map.put(1999, 12.0);
    		interest_map.put(2000, 11.0);
    		interest_map.put(2001, 9.5);
    		interest_map.put(2002, 9.0);
    		interest_map.put(2003, 8.0);
    		interest_map.put(2004, 8.0);
    		interest_map.put(2005, 8.0);
    		interest_map.put(2006, 8.0);
    		interest_map.put(2007, 8.0);
    		interest_map.put(2008, 8.0);
    		interest_map.put(2009, 8.0);
    		interest_map.put(2010, 8.0);
    		interest_map.put(2011, 8.6);
    		interest_map.put(2012, 8.8);
    		interest_map.put(2013, 8.7);
    		interest_map.put(2014, 8.7);
    		interest_map.put(2015, 8.7);
    		interest_map.put(2016, 8.1);
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	return interest_map;
    }
    
    public static int getMonthValue(String key)
    {
    	int month = 0;
    	try
    	{
    		HashMap<String, Integer> month_map = new HashMap<String, Integer>();
    		month_map.put("Jan", 1);
    		month_map.put("Feb", 2);
    		month_map.put("Mar", 3);
    		month_map.put("Apr", 4);
    		month_map.put("May", 5);
    		month_map.put("Jun", 6);
    		month_map.put("Jul", 7);
    		month_map.put("Aug", 8);
    		month_map.put("Sep", 9);
    		month_map.put("Oct", 10);
    		month_map.put("Nov", 11);
    		month_map.put("Dec", 12);
    		
    		month = month_map.get(key);
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	return month;
    }
    
    public static List<Integer> paginator(int page_id, int page_count)
    {
    	int beginPaginatorId = 1;  
        int endPaginatorId = 1; 
        
        List<Integer> paginator = new ArrayList<Integer>();
        
        if(page_count > 1)
        {
        	if(page_id <= 3)
            {
            	beginPaginatorId = 1;
            	endPaginatorId = page_id + 3 + (3 - page_id);
            }
            
            if(page_id > 3 && page_id < (page_count-3))
            {
            	beginPaginatorId = page_id - 3;
            	endPaginatorId = page_id + 3;
            }
            
            if(page_id >= (page_count-3))
            {
            	beginPaginatorId = page_id - 3 - ((3 + page_id) - page_count);
            	endPaginatorId = page_count;
            }
            
            if(beginPaginatorId < 0)
            {
            	beginPaginatorId = 1;
            }
            if(endPaginatorId > page_count)
            {
            	endPaginatorId = page_count;
            }
        }
        
        paginator.add(beginPaginatorId);
        paginator.add(endPaginatorId);
        
        return paginator;
    }
    
    
    
    public static List<String> getCompanies()
    {
    	List<String> amc_list = new ArrayList<String>();
    	
    	try
    	{
			amc_list.add("Axis Mutual Fund");
			amc_list.add("Aditya Birla Sun Life Mutual Fund");
			amc_list.add("BNP Paribas Mutual Fund");
			amc_list.add("Canara Robeco Mutual Fund");
			amc_list.add("DSP BlackRock Mutual Fund");
			amc_list.add("Franklin Templeton Mutual Fund");
			amc_list.add("HDFC Mutual Fund");
			amc_list.add("ICICI Prudential Mutual Fund");
			amc_list.add("IDFC Mutual Fund");
			amc_list.add("Kotak Mahindra Mutual Fund");
			amc_list.add("L&T Mutual Fund");
			amc_list.add("PRINCIPAL Mutual Fund");
			amc_list.add("Reliance Mutual Fund");
			amc_list.add("Invesco Mutual Fund");
			amc_list.add("SBI Mutual Fund");
			amc_list.add("Sundaram Mutual Fund");
			amc_list.add("Tata Mutual Fund");
			amc_list.add("UTI Mutual Fund");
			amc_list.add("Edelweiss Mutual Fund");
			amc_list.add("HSBC Mutual Fund");
			amc_list.add("Mirae Asset Mutual Fund");
			amc_list.add("Motilal Oswal Mutual Fund");
			
			Collections.sort(amc_list);
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	return amc_list;
    }
    
    public static String getSchemeAmfiUrl(String scheme_name) {
    	
		scheme_name = scheme_name.replaceAll("\\("," ");
		scheme_name = scheme_name.replaceAll("\\)"," ");
		scheme_name = scheme_name.replaceAll("-"," ");
		scheme_name = scheme_name.replaceAll("&"," ");
		scheme_name = scheme_name.replaceAll("_"," ");
		scheme_name = scheme_name.replaceAll("/"," ");
		scheme_name = scheme_name.replaceAll("\\."," ");
		scheme_name = scheme_name.replaceAll(":"," ");
		scheme_name = scheme_name.replaceAll("\\'"," ");
		scheme_name = scheme_name.replaceAll("%"," ");
		scheme_name = scheme_name.replaceAll("\\["," ");
		scheme_name = scheme_name.replaceAll("\\]"," ");
		scheme_name = scheme_name.replaceAll("<"," ");
		scheme_name = scheme_name.replaceAll(">"," ");
		scheme_name = scheme_name.replaceAll("="," ");
		scheme_name = scheme_name.replaceAll("\\+"," ");
		scheme_name = scheme_name.replaceAll(","," ");
		scheme_name = scheme_name.replaceAll("   "," ");
		scheme_name = scheme_name.replaceAll("  "," ");
		scheme_name = scheme_name.trim();
		scheme_name = scheme_name.replaceAll(" ","-");
		scheme_name = scheme_name.replaceAll("--","-");		
		
		return scheme_name;
	}
    
    public static String getStateFromStateCode(String stateCode) {
		String state = "";
		
		if(stateCode.equalsIgnoreCase("AD")) {
			state = "Andhra Pradesh";
		}
		else if(stateCode.equalsIgnoreCase("AR")) {
			state = "Arunachal Pradesh";
		}
		else if(stateCode.equalsIgnoreCase("AS")) {
			state = "Assam";
		}
		else if(stateCode.equalsIgnoreCase("BR")) {
			state = "Bihar";
		}
		else if(stateCode.equalsIgnoreCase("CG")) {
			state = "Chattisgarh";
		}
		else if(stateCode.equalsIgnoreCase("DL")) {
			state = "Delhi";
		}
		else if(stateCode.equalsIgnoreCase("GA")) {
			state = "Goa";
		}
		else if(stateCode.equalsIgnoreCase("GJ")) {
			state = "Gujarat";
		}
		else if(stateCode.equalsIgnoreCase("HR")) {
			state = "Haryana";
		}
		else if(stateCode.equalsIgnoreCase("HP")) {
			state = "Himachal Pradesh";
		}
		else if(stateCode.equalsIgnoreCase("JK")) {
			state = "Jammu and Kashmir";
		}
		else if(stateCode.equalsIgnoreCase("JH")) {
			state = "Jharkhand";
		}
		else if(stateCode.equalsIgnoreCase("KA")) {
			state = "Karnataka";
		}
		else if(stateCode.equalsIgnoreCase("KL")) {
			state = "Kerala";
		}
		else if(stateCode.equalsIgnoreCase("LD")) {
			state = "Lakshadweep Islands";
		}
		else if(stateCode.equalsIgnoreCase("MP")) {
			state = "Madhya Pradesh";
		}
		else if(stateCode.equalsIgnoreCase("MH")) {
			state = "Maharashtra";
		}
		else if(stateCode.equalsIgnoreCase("MN")) {
			state = "Manipur";
		}
		else if(stateCode.equalsIgnoreCase("ML")) {
			state = "Meghalaya";
		} 
		else if(stateCode.equalsIgnoreCase("MZ")) {
			state = "Mizoram";
		}
		else if(stateCode.equalsIgnoreCase("NL")) {
			state = "Nagaland";
		}
		else if(stateCode.equalsIgnoreCase("OD")) {
			state = "Odisha";
		}
		else if(stateCode.equalsIgnoreCase("PY")) {
			state = "Pondicherry";
		}
		else if(stateCode.equalsIgnoreCase("PB")) {
			state = "Punjab";
		}
		else if(stateCode.equalsIgnoreCase("RJ")) {
			state = "Rajasthan";
		}
		else if(stateCode.equalsIgnoreCase("SK")) {
			state = "Sikkim";
		}
		else if(stateCode.equalsIgnoreCase("TN")) {
			state = "Tamil Nadu";
		}
		else if(stateCode.equalsIgnoreCase("TS")) {
			state = "Telangana";
		}
		else if(stateCode.equalsIgnoreCase("TR")) {
			state = "Tripura";
		}
		else if(stateCode.equalsIgnoreCase("UP")) {
			state = "Uttar Pradesh";
		}
		else if(stateCode.equalsIgnoreCase("UK")) {
			state = "Uttarakhand";
		}
		else if(stateCode.equalsIgnoreCase("WB")) {
			state = "West Bengal";
		}
		else if(stateCode.equalsIgnoreCase("AN")) {
			state = "Andaman and Nicobar Islands";
		}
		else if(stateCode.equalsIgnoreCase("CH")) {
			state = "Chandigarh";
		}
		else if(stateCode.equalsIgnoreCase("DNHDD")) {
			state = "Dadra & Nagar Haveli and Daman & Diu";
		}
		else if(stateCode.equalsIgnoreCase("LA")) {
			state = "Ladakh";
		}
		else if(stateCode.equalsIgnoreCase("OT")) {
			state = "Other Territory";
		}
		else {
			
		}
		
		return state;
	}
    
    public static String getAutoPassword() 
    {
		String passwordGenartors = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&()";
	    
	    String password = RandomStringUtils.random( 8, passwordGenartors );
	    
		return password;
	}
    
    public static String EncodeString(String str) throws Exception 
    {
    	byte[] bytesEncoded = Base64.encodeBase64(str.getBytes());
    	//System.out.println("encoded value is " + new String(bytesEncoded));
    	
    	return new String(bytesEncoded);
    }
    
    public static String DecodeString(String bytesEncoded) throws Exception 
    {
    	byte[] valueDecoded = Base64.decodeBase64(bytesEncoded);
    	//System.out.println("Decoded value is " + new String(valueDecoded));
    	
    	return new String(valueDecoded);
    }
}
