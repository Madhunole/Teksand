package com.teksands.utils;

import java.io.File;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.hibernate.internal.util.StringHelper;


/**
 * @author vivi
 * 
 */
public class ViewHelper {

	/**
	 * This is used to fetch the name of the file alone from the FileItem
	 * irrespective of the OS from which the file is loaded.
	 * 
	 * @param fileItem
	 * @return
	 */
	public static String getOriginalFileName(FileItem fileItem) {
		String filename = fileItem.getName();
		if (filename == null) {
			return "";
		}
		int pos = filename.lastIndexOf("/");
		if (pos == -1) {
			pos = filename.lastIndexOf("\\");
		}
		if (pos != -1) {
			return filename.substring(pos + 1);
		}
		return filename;
	}

	/**
	 * Creates the file from the file item objects. If the file with the same
	 * name exists, automatically generates the file name
	 * 
	 * @param fileItem
	 * @param path
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public static String createFile(FileItem fileItem, String path, String fileName) throws Exception {
		String name = path + File.separator + fileName;
		File fileToSave = new File(path, fileName);
		fileItem.write(fileToSave);
		return name;
	}
	

	/**
	 * Returns true if the filesize is within the limits. False if the file size
	 * exceeds the max limit
	 * 
	 * @param itemList
	 * @param maxLimit
	 * @return
	 */
	public static boolean checkFileSize(List<FileItem> itemList, float maxLimit) {
		for (FileItem item : itemList) {
			float fileSize = new Float(item.getSize()) / MEGABYTE;
			if (fileSize > maxLimit) {
				return false;
			}
		}
		return true;
	}

	private static final float MEGABYTE = 1024L * 1024L;

	/**
	 * Format the line breaks from textarea to html breaks.
	 * 
	 * @param input
	 * @return
	 */
	public static String formatLineBreaks(String input) {
		if (StringHelper.isEmpty(input)) {
			return input;
		}
		return input.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	}

	public static String firstToUpper(String word) {

		StringBuilder formattedWord = new StringBuilder();
		formattedWord.append(word.substring(0, 1).toUpperCase());
		formattedWord.append(word.substring(1).toLowerCase());
		return formattedWord.toString();
	}
}
