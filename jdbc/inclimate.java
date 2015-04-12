import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class inclimate {
	public static void main(String[] args) throws ParseException{			
		Connection conn = null;
		try{
			File inputfile = new File("C:\\Users\\BigData\\project\\氣象資料1996-2015合併(改).csv");  //可修改			
			String str;
			BufferedReader in = new BufferedReader(new FileReader(inputfile));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=agriculture";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			String insStmt = "INSERT INTO weather VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";  //可修改
			PreparedStatement pstmt = conn.prepareStatement(insStmt);
			
			while((str=in.readLine())!=null){
				String[] inputdata =str.split(",");			
				   
				    pstmt.setDate(1,new java.sql.Date((sdf.parse(inputdata[0])).getTime()));
				    pstmt.setDouble(2,Double.parseDouble(inputdata[1]));
				    pstmt.setDouble(3,Double.parseDouble(inputdata[2]));
				    pstmt.setDouble(4,Double.parseDouble(inputdata[3]));
				    pstmt.setDouble(5,Double.parseDouble(inputdata[4]));
				    pstmt.setDouble(6,Double.parseDouble(inputdata[5]));
				    pstmt.setDouble(7,Double.parseDouble(inputdata[6]));
				    pstmt.setDouble(8,Double.parseDouble(inputdata[7]));
				    pstmt.setDouble(9,Double.parseDouble(inputdata[8]));
				    pstmt.setDouble(10,Double.parseDouble(inputdata[9]));
				    pstmt.setString(11,inputdata[10]);
					pstmt.setString(12,inputdata[11]);
					pstmt.setDouble(13,Double.parseDouble(inputdata[12]));
					pstmt.setDouble(14,Double.parseDouble(inputdata[13]));
					pstmt.setDouble(15,Double.parseDouble(inputdata[14]));
					pstmt.setDouble(16,Double.parseDouble(inputdata[15]));
					pstmt.setDouble(17,Double.parseDouble(inputdata[16]));
					pstmt.setDouble(18,Double.parseDouble(inputdata[17]));
					pstmt.setDouble(19,Double.parseDouble(inputdata[18]));
					pstmt.setDouble(20,Double.parseDouble(inputdata[19]));
					pstmt.setDouble(21,Double.parseDouble(inputdata[20]));
					pstmt.addBatch();
					//System.out.print(inputdata[1]+" ");					
					}//System.out.print("\n");				  
			        pstmt.executeBatch();					
			
		
			
			
		}catch(IOException i){i.printStackTrace();}
		 catch(SQLException e){e.printStackTrace();} 
		 finally { 
		 if (conn != null)try {conn.close();}catch(SQLException e){e.printStackTrace();}
	}   
	}
}
