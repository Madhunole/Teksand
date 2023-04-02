package com.teksands.utils;

import java.util.Arrays;

//http://stackoverflow.com/questions/7988486/how-do-you-calculate-the-variance-median-and-standard-deviation-in-c-or-java/7988556
public class MeanMedianStdDev 
{
	public static double[] data;
	public static int size;      

    public static double getMean(double[] data1)
    {
    	data = data1;
        size = data1.length;
        
        double sum = 0.0;
        for(double a : data)
            sum += a;
        return sum/size;
    }

    public static double getVariance(double[] data1)
    {
    	data = data1;
        size = data1.length;
        
        double mean = getMean(data1);
        double temp = 0;
        for(double a :data)
            temp += (mean-a)*(mean-a);
        return temp/size;
    }

    public static double getStdDev(double[] data1)
    {
        return Math.sqrt(getVariance(data1));
    }

    public static double median(double[] data1) 
    {
    	data = data1;
        size = data1.length;
        
       Arrays.sort(data);

       if (data.length % 2 == 0) 
       {
          return (data[(data.length / 2) - 1] + data[data.length / 2]) / 2.0;
       } 
       else 
       {
          return data[data.length / 2];
       }
    }
}