import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class CorsampleLazy {
	public static void main(String[] args) throws ParseException{	
		File folder = new File("C:\\Users\\T100T\\Downloads\\totalfruit");
		File[] listOfFiles = folder.listFiles();
		String fruit="";
		    for (int i = 0; i < listOfFiles.length; i++) {
		      if (listOfFiles[i].isFile()) {
		    	 fruit = listOfFiles[i].getName().replaceAll(".csv","");	  
		    
		Connection conn = null;
		try{						
			//connection
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");	
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=agriculture";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			//System.out.print(fruit+"\n");
			///////////create table  in for loop
			String text="";
			for(int j=2004;j<=2014;j++){
				text += "year"+j+" "+"float"+","+" ";
			}
			text = "create table "+fruit+" ("+text+"seq Int"+")"+";";
			//System.out.print(text);
			////////////////////////
			String insStmt1 = text;
			PreparedStatement pstmt1 = conn.prepareStatement(insStmt1);
			pstmt1.executeUpdate();			
			
			///source
			File inputfile1 = new File("C:\\Users\\T100T\\Downloads\\totalfruit\\"+fruit+".csv");  //可修改			
			String str;
			BufferedReader in1 = new BufferedReader(new FileReader(inputfile1));					
			//insert			
			String insStmt2 = "INSERT INTO "+ fruit +" VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";  //可修改
			PreparedStatement pstmt2 = conn.prepareStatement(insStmt2);
			str=in1.readLine();
			
			while((str=in1.readLine())!=null){
				String[] inputdata =str.split(",");		
				for(int k=1;k<=11;k++){
					pstmt2.setFloat(k,Float.parseFloat(inputdata[k]));
				}				   
				   	pstmt2.setInt(12,Integer.parseInt(inputdata[12]));
				    pstmt2.addBatch();		
				    //System.out.print(Double.parseDouble(inputdata[11]));
			}pstmt2.executeBatch();					
				
			
			
		}catch(IOException z){z.printStackTrace();}
		 catch(SQLException e){e.printStackTrace();} 
		 finally { 
		 if (conn != null)try {conn.close();}catch(SQLException e){e.printStackTrace();}
	}   
	}
		    }}
}
