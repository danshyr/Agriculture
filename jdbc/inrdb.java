import java.io.*;
import java.sql.*;

public class inrdb {
	public static void main(String[] args){			
		Connection conn = null;
		try{
			File inputfile = new File("C:\\Users\\wei\\Desktop\\已整理資料\\hurrcine.csv");  //可修改			
			String str;
			BufferedReader in = new BufferedReader(new FileReader(inputfile));
			
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=jdbc";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			String insStmt = "INSERT INTO typhoon VALUES (?, ?, ?, ?, ?, ?,?,?,?,?,?,?)";  //可修改
			PreparedStatement pstmt = conn.prepareStatement(insStmt);
			
			while((str=in.readLine())!=null){
				String[] inputdata =str.split(",");
				
				for(int i=0;i<inputdata.length;i++){
					//pstmt.setString(i,inputdata[i]);
					//pstmt.addBatch();
					System.out.print(inputdata[i]+" ");					
				}   System.out.print("\n");
				
			}
					//pstmt.executeBatch();
			
			
			pstmt = conn.prepareStatement("SELECT * FROM typhoon");
			ResultSet rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			while(rs.next()) {
				for(int i=0;i<count;i++){
				System.out.print(rs.getString(i+1) + ",");
				}			
			}
			
			
			
			
		}catch(IOException i){i.printStackTrace();}
		 catch(SQLException e){e.printStackTrace();} 
		 finally { 
		 if (conn != null)try {conn.close();}catch(SQLException e){e.printStackTrace();}
	}   
	}
}
