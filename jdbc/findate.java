import java.io.*;
import java.util.*;
public class findate {	
	public static void main(String[] args){
		 String str1;
		 String year;
	     String month;
		 String shan;
	     int count =0;	    
		try{
			File inputfile = new File("C:\\Users\\wei\\Desktop\\pratice\\hirrcane\\testTaichungdata2.csv");  //¥i­×§ï			
			String str;
			
			BufferedReader in = new BufferedReader(new FileReader(inputfile));	
			List dateList = new ArrayList();		
			
			while((str=in.readLine())!=null){
				String[] inputdata =str.split(",");
				
				for(int i=0;i<inputdata.length;i++){
					dateList.add(inputdata[i]);
					//System.out.print(inputdata[i]+"\n");					
				}   
				
			}	
			
			for(int i=0;i<dateList.size();i++){
				//System.out.print(dateList.get(i)+"\n");
				str1 =(String) dateList.get(i);				
			    year = str1.substring(1,5);
			    month = str1.substring(6,8);
			    shan = str1.substring(9,11);
			   // System.out.print(year+"/"+month+"/"+shan+"\n");			  

			    if(year.equals("2015")){
					 count++;
					 //System.out.print(year+"/"+count+"\n");
					System.out.print(year+"/"+month+"/"+shan+"\n");
					
				 }
			  	
			}				
			
		}catch(IOException i){i.printStackTrace();}			 
	}
}
