import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class index {
	public static void main(String[] args) throws ParseException{	
		//folder
		String folders = "D:\\document\\R\\count\\test\\index";
		File folder = new File(folders);
		File[] listOfFiles = folder.listFiles();
		String fruit="";
		    for (int i = 0; i < listOfFiles.length; i++) {
		      if (listOfFiles[i].isFile()) {
		    	 fruit = listOfFiles[i].getName().replaceAll(".csv","");	  
		    	 
		Connection conn = null;
		try{						
			//connection
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");	
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=agriculture";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			
			///////////create table  in for loop
			
			//drop table if exist
			String drop="IF OBJECT_ID('"+fruit+"') IS NOT NULL	DROP TABLE "+fruit +";";
			PreparedStatement pstmt0 = conn.prepareStatement(drop);
			pstmt0.executeUpdate();		
			
			String text="";
			
			for(int j=2004;j<=2015;j++){
				text += "year"+j+" "+"float"+","+" ";
			}
			text = "create table "+fruit+"("+"date varchar(max)"+","+text+")"+";";
			//System.out.print(text);
			////////////////////////
			String insStmt1 = text;
			PreparedStatement pstmt1 = conn.prepareStatement(insStmt1);
			pstmt1.executeUpdate();			
			
			///source
			File inputfile1 = new File(folders+"\\"+fruit+".csv");  //可修改			
			String str;
			BufferedReader in1 = new BufferedReader(new FileReader(inputfile1));					
			//insert			
			String insStmt2 = "INSERT INTO "+ fruit +"  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";  //可修改
			PreparedStatement pstmt2 = conn.prepareStatement(insStmt2);
			str=in1.readLine();
						
			while((str=in1.readLine())!=null){
				String[] inputdata =str.split(",");				
				
				pstmt2.setString(1,inputdata[1]);				
				//pstmt2.setDate(1,new java.sql.Date((sdf.parse(inputdata[1])).getTime()));
				//pstmt2.setInt(2,Integer.parseInt(inputdata[1]));
				
				for(int k=2;k<=13;k++){
					pstmt2.setFloat(k,Float.parseFloat(inputdata[k]));
				}				   
				   
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
