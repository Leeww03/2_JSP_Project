package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	public List<Board> getBoardImg(String id){//해당 유저의 이미지를 가져옴
		List<Board> list = new ArrayList<>();
		try {
			String sql = ("SELECT img FROM Board WHERE bid=?");
			conn = DBConnection.getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Board b = new Board();
				b.setImg(rs.getString("img"));
				list.add(b);
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
		return list;
	}
	public void write(Board b) {//글작성
		try {
		String sql=("INSERT INTO Board VALUES(Board_Num.NEXTVAL,?,?,?,?,SYSDATE,?,0)");
		conn = DBConnection.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, b.getBid());
		pstmt.setString(2, b.getTag());
		pstmt.setString(3, b.getTitle());
		pstmt.setString(4, b.getContent());
		pstmt.setString(5, b.getImg());
		pstmt.executeQuery();
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
	public List<Board> getboard(int str,int end){//전체 게시글 가져오기

		List<Board> list=new ArrayList<>();
		try {
		String sql="SELECT a.bid,a.bnum,a.btitle,a.bdate,a.count FROM (SELECT rownum as rnum,a.* FROM (SELECT * FROM board ORDER BY bnum DESC)a where rownum<=?)a where rnum>=?";
		conn = DBConnection.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, end);
		pstmt.setInt(2, str);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			Board bl=new Board();
			String gdate=rs.getString("bdate");
			String y=gdate.substring(0,4);
			String m=gdate.substring(5,7);
			String d=gdate.substring(8,10);
			String date=y+"년"+m+"월"+d+"일";
			bl.setBnum(rs.getLong("bnum"));
			bl.setTitle(rs.getString("btitle"));
			bl.setBdate(date);
			bl.setBid(rs.getString("bid"));
			bl.setCnt(rs.getLong("count"));
			list.add(bl);
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
		return list;
	}
	public List<Board> gettagboard(int str,int end,String tag){//장르 게시글 가져오기
		
		List<Board> list=new ArrayList<>();
		try {
		String sql="SELECT a.bid,a.bnum,a.btitle,a.bdate,a.count FROM (SELECT rownum as rnum,a.* FROM (SELECT * FROM board ORDER BY bnum DESC)a where rownum<=? AND btag=?)a where rnum>=?";
		conn = DBConnection.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, end);
		pstmt.setString(2, tag);
		pstmt.setInt(3, str);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			Board bl=new Board();
			String gdate=rs.getString("bdate");
			String y=gdate.substring(0,4);
			String m=gdate.substring(5,7);
			String d=gdate.substring(8,10);
			String date=y+"년"+m+"월"+d+"일";
			bl.setBnum(rs.getLong("bnum"));
			bl.setTitle(rs.getString("btitle"));
			bl.setBdate(date);
			bl.setBid(rs.getString("bid"));
			bl.setCnt(rs.getLong("count"));
			list.add(bl);
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
		return list;
	}
public List<Board> getsearchboard(int str,int end,String title){//검색 게시글 가져오기
		List<Board> list=new ArrayList<>();
		try {
		String sql="SELECT a.bid,a.bnum,a.btitle,a.bdate,a.count FROM (SELECT rownum as rnum,a.* FROM (SELECT * FROM board ORDER BY bnum DESC)a where rownum<=? AND btitle LIKE ?)a where rnum>=?";
		conn = DBConnection.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, end);
		pstmt.setString(2, "%"+title+"%");
		pstmt.setInt(3, str);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			Board bl=new Board();
			String gdate=rs.getString("bdate");
			String y=gdate.substring(0,4);
			String m=gdate.substring(5,7);
			String d=gdate.substring(8,10);
			String date=y+"년"+m+"월"+d+"일";
			bl.setBnum(rs.getLong("bnum"));
			bl.setTitle(rs.getString("btitle"));
			bl.setBdate(date);
			bl.setBid(rs.getString("bid"));
			bl.setCnt(rs.getLong("count"));
			list.add(bl);
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
		return list;
	}
	public int boardcnt() {//전체 게시글수 가져오기
		int cnt=0;
		try {
			String sql = ("SELECT COUNT(*) cnt FROM Board");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
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
		return cnt;
	}
	public int tagboardcnt(String tag) {//장르 게시글수 가져오기
		int cnt=0;
		try {
			String sql = ("SELECT COUNT(*) cnt FROM Board WHERE btag=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tag);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
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
		return cnt;
	}
	public int searchboardcnt(String title) {//검색 게시글수 가져오기
		int cnt=0;
		try {
			String sql = ("SELECT COUNT(*) cnt FROM Board WHERE btitle LIKE ?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
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
		return cnt;
	}
	public Board getViewList(String bnum){//게시글 가져오기
		try {
			String sql=("SELECT * FROM Board WHERE bnum=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Board b=new Board();
				String gdate=rs.getString("bdate");
				String y=gdate.substring(0,4);
				String m=gdate.substring(5,7);
				String d=gdate.substring(8,10);
				String date=y+"년"+m+"월"+d+"일";
				
				b.setBnum(rs.getLong("bnum"));
				b.setBid(rs.getString("bid"));
				b.setTag(rs.getString("btag"));
				b.setTitle(rs.getString("btitle"));
				b.setContent(rs.getString("content"));
				b.setImg(rs.getString("img"));
				b.setCnt(rs.getLong("count"));
				b.setBdate(date);
				return b;
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
		return null;
	}
	public long Updatecnt(long cnt,String num) {//디비에 있는 cnt와 게시글 번호를가져옴
		long count = cnt;
		count+=1;//가져온 cnt에 +1추가후 업데이트
		try {
			String sql=("UPDATE BOARD SET count=? WHERE bnum=?");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setLong(1, count);
			pstmt.setString(2, num);
			pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return count;//count를 return
	}
	public void updateBoard(Board b) {//게시글 수정
		try {
			String sql=("UPDATE BOARD SET btitle=?,content=?,img=? WHERE bnum=?");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getImg());
			pstmt.setLong(4, b.getBnum());
			pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public String getimg(String num) {//이미지 파일 가져오기
		String imgname=null;
		try {
			String sql=("SELECT img FROM Board WHERE bnum=?");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				imgname=rs.getString("img");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs!=null) {rs.close();rs=null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return imgname;
	}
	public void deleteBoard(String num) {//게시글 삭제
		try {
			String sql=("DELETE FROM Board WHERE bnum=?");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeLargeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
