import java.io.File;//imports the file class
import java.io.FileNotFoundException; //Import this class to handle errors
import java.util.Scanner; //Import scanner to read text files
import java.io.IOException; //handles errors
import java.io.FileWriter; //helps write to files.
import java.util.ArrayList;
import java.util.Arrays;
//Worked with Sara Basili on Phase 1 part A and part B.

public class HandleFile{ //Class to handle editing of files
    
    public static void newFile(){ //Makes new file Rename based on your preference
       try{
           File myNewCSV = new File("phase1Output.txt");
           if (myNewCSV.createNewFile()) {
               System.out.println("File created: " + myNewCSV.getName());

           } else{
               System.out.println("File already exists.");
           }
        } catch (IOException e){
               System.out.println("An error occurred.");
               e.printStackTrace();
        }
    }

    public static void Writer(String writeThis){ //Writes to file and adds new line.
        try{
            FileWriter myWriter = new FileWriter("phase1Output.txt", true);
            myWriter.write(writeThis);
            myWriter.write("\n");
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch(IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    public static void main(String[] args){ //Reads from file

        newFile();

        try{
            File myCSV = new File("phase1.csv");            
            Scanner myReader = new Scanner(myCSV);
            while (myReader.hasNextLine()){
                //Initialize empty list
                ArrayList<String> dataList = new ArrayList<String>();
                //Its okay to keep it

                String data = myReader.nextLine();

                //parse list values= line.split(",")
                String[] dataSplit = data.split(",");

                //store in a list
                dataList = new ArrayList<String>(Arrays.asList(dataSplit));
            
                //System.out.println(dataList);

                ArrayList<String> myDataTypeList = new ArrayList<String>();
                
                //for value in values
                for (String value: dataList){
                    value = value.trim();
                    try { //Evaluate value if value is integer, add integer to myDataTypeList.
                        Integer.parseInt(value);
                        myDataTypeList.add("Integer");
                    } catch (NumberFormatException ex){ //else add string to list
                        myDataTypeList.add("Text");
                    }
                }
                System.out.println(myDataTypeList);
                //Concatenate the values in my list with a comma
                //String output = String.join(",", myDataTypeList);
                String output = String.join(", ", myDataTypeList);
                System.out.println(output);

                 //Write output to outfie. Probably throw in a new line character too.
                Writer(output);
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("an error occurred.");
            e.printStackTrace();
        }
   
    }
}