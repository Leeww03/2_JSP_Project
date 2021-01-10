package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;

public class MainBoardDAO {//MainForm 게시판 가져오기
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	public List<Board> freeBoard(String tag){//장르별게시판 가져오기
		List<Board> list=new ArrayList<Board>();
		try {
			String sql=("SELECT bnum,bid,btitle FROM(SELECT * FROM Board WHERE btag=? ORDER BY bnum DESC) WHERE rownum<=5");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tag);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b = new Board();
				b.setBnum(rs.getLong("bnum"));
				b.setBid(rs.getString("bid"));
				b.setTitle(rs.getString("btitle"));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs!=null) {rs.close();rs=null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				
			}
		}
		return list;
	}
}
