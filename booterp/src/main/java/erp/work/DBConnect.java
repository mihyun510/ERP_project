package erp.work;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBConnect {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	
	public List<Map<String,Object>> select() {
		List<Map<String,Object>> rList = new ArrayList<Map<String,Object>>();
		try {
			StringBuilder sb = new StringBuilder("");
			sb.append("select w_day, w_time, w_work from worktime");
			con=dbMgr.getConnection();
			pstmt=con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			Map<String,Object> nMap = null;
			while(rs.next()) {
				nMap = new HashMap<String, Object>();
				nMap.put("w_day",rs.getString("w_day"));
				nMap.put("w_time",rs.getInt("w_time"));
				nMap.put("w_work",rs.getString("w_work"));
				rList.add(nMap);
			}
			for(Map<String,Object> haha:rList) {

				System.out.println(haha);
				System.out.println("==========");
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rList;
	}
	public static void main(String[] args) {
		DBConnect db = new DBConnect();
		db.select();
	}
}
