package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;

public class CommentDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	public void incmt(Comment c) {//댓글 등록
		try {
			String sql=("INSERT INTO User_Comment VALUES(?,Comment_Num.NEXTVAL,?,?,SYSDATE)");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, c.getBnum());
			pstmt.setString(2, c.getId());
			pstmt.setString(3, c.getComment());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	public List<Comment> getComment(String bnum){//댓글 가져오기
		List<Comment> list=new ArrayList<>();
		try {
			String sql=("SELECT * FROM User_Comment WHERE bnum=? ORDER BY cnum ASC");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bnum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Comment c = new Comment();
				String gdate=rs.getString("cdate");
				String y=gdate.substring(0,4);
				String m=gdate.substring(5,7);
				String d=gdate.substring(8,10);
				String date=y+"년"+m+"월"+d+"일";
				c.setBnum(rs.getLong("bnum"));
				c.setCnum(rs.getLong("cnum"));
				c.setId(rs.getString("id"));
				c.setComment(rs.getString("cmt"));
				c.setDate(date);
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();rs=null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public Comment Recomment(int cnum) {//댓글 수정시 정보 가져오기
		Comment c = new Comment();
		try {
			
			String sql = ("SELECT * FROM User_Comment WHERE cnum=?");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				c.setComment(rs.getString("cmt"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs!=null) {rs.close();rs=null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return c;
	}
	public void cmtupdate(int cnum,String cmt) {//댓글 수정
		try {
			String sql=("UPDATE User_Comment SET cmt=? WHERE cnum=?");
			conn = DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cmt);
			pstmt.setInt(2, cnum);
			pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void cmtdelete(int cnum) {//댓글 삭제
		try {
			String sql=("DELETE FROM User_Comment WHERE cnum=?");
			conn = DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
