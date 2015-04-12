import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class inrtyphoon {
	public static void main(String[] args) throws ParseException{			
		Connection conn = null;
		try{
			File inputfile = new File("C:\\Users\\BigData\\project\\hurrcine4.csv");  //可依檔案修改			
			String str;
			BufferedReader in = new BufferedReader(new FileReader(inputfile));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");//轉換日期格式
			
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=agriculture";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			String insStmt = "INSERT INTO typhoon VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";  //可依TABLE修改
			PreparedStatement pstmt = conn.prepareStatement(insStmt);
			
			while((str=in.readLine())!=null){
				String[] inputdata =str.split(",");				
				    //依欄位屬性分別設定輸入類型
					pstmt.setInt(1,Integer.parseInt(inputdata[0]));
					pstmt.setInt(2,Integer.parseInt(inputdata[1]));
					pstmt.setString(3,inputdata[2]);
					pstmt.setString(4,inputdata[3]);
					pstmt.setString(5,inputdata[4]);
					pstmt.setString(6,inputdata[5]);
					pstmt.setInt(7,Integer.parseInt(inputdata[6]));
					pstmt.setInt(8,Integer.parseInt(inputdata[7]));
					pstmt.setInt(9,Integer.parseInt(inputdata[8]));
					pstmt.setInt(10,Integer.parseInt(inputdata[9]));
					pstmt.setInt(11,Integer.parseInt(inputdata[10]));
					pstmt.setDate(12,new java.sql.Date((sdf.parse(inputdata[11])).getTime()));
					//因為要輸入成SQL的日期形式，所以要改成這樣
					pstmt.setDate(13,new java.sql.Date((sdf.parse(inputdata[12])).getTime()));
					pstmt.addBatch();//批次輸入							  
			}		pstmt.executeBatch();	//一次執行						
			
		}catch(IOException i){i.printStackTrace();}
		 catch(SQLException e){e.printStackTrace();} 
		 finally { 
		 if (conn != null)try {conn.close();}catch(SQLException e){e.printStackTrace();}
	}   
	}
}
