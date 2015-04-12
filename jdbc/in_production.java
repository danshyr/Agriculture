import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class in_production {
	public static void main(String[] args) throws ParseException{			
		Connection conn = null;
		try{
			File inputfile = new File("C:\\Users\\BigData\\project\\�w��z-���a���\\�w��z-���a���\\production.csv");  //�i�ק�			
			String str;
			BufferedReader in = new BufferedReader(new FileReader(inputfile));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=agriculture";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			String insStmt = "INSERT INTO production VALUES (?,?,?,?,?,?,?,?,?)";  //�i�ק�
			PreparedStatement pstmt = conn.prepareStatement(insStmt);
			
			while((str=in.readLine())!=null){
				String[] inputdata =str.split(",");				
				    pstmt.setInt(1,Integer.parseInt(inputdata[0]));				    
				    pstmt.setString(2,inputdata[1]);
				    pstmt.setInt(3,Integer.parseInt(inputdata[2]));		
				    pstmt.setInt(4,Integer.parseInt(inputdata[3]));		
					pstmt.setDouble(5,Double.parseDouble(inputdata[4]));
					pstmt.setDouble(6,Double.parseDouble(inputdata[5]));		
					pstmt.setDouble(7,Double.parseDouble(inputdata[6]));
					pstmt.setInt(8,Integer.parseInt(inputdata[7]));		
					pstmt.setInt(9,Integer.parseInt(inputdata[8]));		
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
