import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class in_market_persimmon {
	public static void main(String[] args) throws ParseException{			
		Connection conn = null;
		try{
			File inputfile = new File("C:\\Users\\BigData\\project\\persimmon.csv");  //可修改			
			String str;
			BufferedReader in = new BufferedReader(new FileReader(inputfile));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=agriculture";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			String insStmt = "INSERT INTO market_persimmon VALUES (?,?,?,?,?,?,?)";  //可修改
			PreparedStatement pstmt = conn.prepareStatement(insStmt);
			
			while((str=in.readLine())!=null){
				String[] inputdata =str.split(",");				
				    
				    pstmt.setDate(1,new java.sql.Date((sdf.parse(inputdata[0])).getTime()));
				    pstmt.setString(2,inputdata[1]);
					pstmt.setDouble(3,Double.parseDouble(inputdata[2]));
					pstmt.setDouble(4,Double.parseDouble(inputdata[3]));
					pstmt.setDouble(5,Double.parseDouble(inputdata[4]));
					pstmt.setDouble(6,Double.parseDouble(inputdata[5]));		
					pstmt.setDouble(7,Double.parseDouble(inputdata[6]));
					pstmt.addBatch();
					//System.out.print(inputdata[0]+" ");					
				    //System.out.print("\n");				  
			}pstmt.executeBatch();					
						
			
		}catch(IOException i){i.printStackTrace();}
		 catch(SQLException e){e.printStackTrace();} 
		 finally { 
		 if (conn != null)try {conn.close();}catch(SQLException e){e.printStackTrace();}
	}   
	}
}
