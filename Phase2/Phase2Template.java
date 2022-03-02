import java.util.*;
import java.io.*;

public class Phase2Template {
	public static void main(String[] args){
		//Make sure you didn't forget to pass the table name
		if (args.length == 0){
			System.out.println("You forget to pass a table name!");			
			return;
		}
		
		String tableName = args[0]; // store the table name in a variable
	
		try{
			File infile = new File(String.format("%s.csv", tableName)); // In this project, the table names will match the input .csv files.	
			FileWriter outfile = new FileWriter(String.format("%s.sql", tableName)); // We will also name our output .sql files accordingly.
			
			Scanner ins = new Scanner(infile);
			while (ins.hasNextLine()){ //read through the file line-by-line
				String line = ins.nextLine();				
				String output = getSQLInsert(tableName, line); // I created a separate method to generate my insert statements.	
				Writer(output, tableName);			
				
			}
			outfile.close();
			ins.close();
	
		} catch (FileNotFoundException e){
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());			
		}		
	}
	public static void Writer(String writeThis, String tableName){ //Writes to file and adds new line.
        try{
            FileWriter myWriter = new FileWriter(String.format("%s.sql", tableName), true);
            myWriter.write(writeThis);
            myWriter.close();
            //System.out.println("Successfully wrote to the file.");
        } catch(IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

	public static String getSQLInsert(String tableName, String line){
		//This is where it is up to you to properly format values for you insert statements.

		//parse list values
		String[] dataSplit = line.split(",");

		//store in a list
		ArrayList<String> dataList = new ArrayList<String>(Arrays.asList(dataSplit));

		ArrayList<String> myDataTypeList = new ArrayList<String>();
		
		//for value in values
		for (String value: dataList){
			value = value.trim();
			try { //Evaluate value if value is integer
				Integer.parseInt(value);
				myDataTypeList.add(value); //adds an integer to the string
			} catch (NumberFormatException ex){ //else add string to list
				if(value.equals("NULL")){
					myDataTypeList.add(value);
				}
				else{
					myDataTypeList.add( ("'") + value + ("'") ); //Adds single quotes to non-NULL strings.
				}
				
			}
		}
		//Concatenate the values in my list with a comma
		String result = String.join(", ", myDataTypeList);
		String insertTemplate = String.format("INSERT INTO %s VALUES(%s);\n", tableName, result);

		return insertTemplate;
	}
}