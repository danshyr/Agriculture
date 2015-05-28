import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class CorLongan {
	public static void main(String[] args) throws ParseException{			
		Connection conn = null;
		try{
			//只要修改檔名和TABE名一樣，就能一次全改
			String fruit="TempPriceCorlongan";
			//connection
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");	
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=agriculture";
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			
			///////////create table  in for loop
			String text="";
			for(int i=2004;i<=2014;i++){
				text += "year"+i+" "+"float"+","+" ";
			}
			text = "create table "+fruit+"("+text+"seq Int"+")"+";";
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
				for(int i=1;i<=11;i++){
					pstmt2.setFloat(i,Float.parseFloat(inputdata[i]));
				}				   
				   	pstmt2.setInt(12,Integer.parseInt(inputdata[12]));
				    pstmt2.addBatch();		
				    //System.out.print(Double.parseDouble(inputdata[11]));
			}pstmt2.executeBatch();					
				
			
			
		}catch(IOException i){i.printStackTrace();}
		 catch(SQLException e){e.printStackTrace();} 
		 finally { 
		 if (conn != null)try {conn.close();}catch(SQLException e){e.printStackTrace();}
	}   
	}
}
