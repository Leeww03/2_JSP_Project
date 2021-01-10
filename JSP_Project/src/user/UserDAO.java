package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	public int LoginCheck(UserInfo u) {//로그인
		int num=-1; //반환값 -1로 설정
		try {
			String sql=("SELECT userNum,pw,img FROM USER_INFO WHERE id=?"); //SQL문 선언
			conn=DBConnection.getConnection();//Connection 연결
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, u.getId());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				u.setImg(rs.getString("img"));//SQL문에서 찾은 img의 값을 UserInfo.java에서 setter
				if(rs.getString("pw")!=null&&rs.getString("pw").equals(u.getPw())&&rs.getString("userNum").equals("0")) {
					return num=0;//디비에서 받아온 pw가 null이아니고 디비에서 받아온 pw가 로그인시 입력한 pw와 같고 디비에서 가져온 userNum이 0이면 0반환(0은 관리자계정)
				}else if(rs.getString("pw")!=null&&rs.getString("pw").equals(u.getPw())&&rs.getString("userNum").equals("1")) {
					return num=1;//디비에서 받아온 pw가 null이아니고 디비에서 받아온 pw가 로그인시 입력한 pw와 같고 디비에서 가져온 userNum이 1이면 1반환(1은 일반 유저)
				}
			}else {
				return num=-1;//rs.next()가 false면 -1반환
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null){rs.close();rs = null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return num;
	}
	public int getIdcheck(String getid) {//id 중복 체크
		int num=-1;
		try {
			String sql=("SELECT COUNT(id) idcheck FROM USER_INFO WHERE id=?");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, getid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt("idcheck")==0) {//COUNT(id)가 0이면 중복된 id가 없어서 num에 1을 넣고 num return
					num=1;
					return num;
				}else{
					num=0;					 //COUNT(id)가 0이 아니면 있는 id이므로 num에 0을 넣고 num return
					return num;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null){rs.close();rs = null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return num; 
	}
	public void SignUp(UserInfo u) {//회원가입
		try {
			String sql = ("INSERT INTO USER_INFO VALUES(1,?,?,?,?,?,?,?,?,?)");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,u.getName());
			pstmt.setString(2,u.getRrn());
			pstmt.setString(3,u.getId());
			pstmt.setString(4,u.getPw());
			pstmt.setString(5,u.getGender());
			pstmt.setString(6,u.getAddress());
			pstmt.setString(7,u.getTel());
			pstmt.setString(8,u.getEmail());
			pstmt.setString(9,u.getImg());
			pstmt.executeUpdate();//쿼리실행
			conn.commit();		  //commit
		}catch(Exception e) {
			try {
				conn.rollback();  //쿼리 실패시 rollback
			}catch(SQLException s) {
				s.printStackTrace();
			}
		}finally {
			try {
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public int getcnt() {//유저수 카운트(일반유저)
		int cnt = 0;
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM USER_INFO WHERE usernum=1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){rs.close();rs = null;}
				if(pstmt != null) {pstmt.close();pstmt = null;}
				if(conn != null) {conn.close();conn = null;}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return cnt;
	}
	public List<UserInfo> getUserInfoList(int str,int end){//유저 리스트를 가져옴

		List<UserInfo> list=new ArrayList<>();//List선언
		try {
		String sql="SELECT a.name,a.id,a.gender,a.img FROM (SELECT rownum as rnum,a.* FROM (SELECT * FROM USER_INFO WHERE usernum=1 ORDER BY name ASC)a where rownum<=?)a where rnum>=?";
		conn = DBConnection.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, end);
		pstmt.setInt(2, str);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			UserInfo userlist=new UserInfo();//UserInfo선언
			userlist.setName(rs.getString("name"));
			userlist.setId(rs.getString("id"));
			userlist.setGender(rs.getString("gender"));
			userlist.setImg(rs.getString("img"));
			/*디비에서 가져온 값들을 넣어줌*/
			list.add(userlist);//list에 저장
		}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null){rs.close();rs = null;}
				if(pstmt != null) {pstmt.close();pstmt = null;}
				if(conn != null) {conn.close();conn = null;}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<UserInfo> userInfo(String id) {//로그인한 유저 정보 가져오기
		UserInfo in = new UserInfo();
		List<UserInfo> list = new ArrayList<UserInfo>();
		try {
			String sql=("SELECT name,rrn,id,pw,gender,address,tel,email,img FROM USER_INFO WHERE id=?"); //SQL문 선언
			conn=DBConnection.getConnection();//Connection 연결
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				in.setName(rs.getString("name"));
				in.setRrn(rs.getString("rrn"));
				in.setId(rs.getString("id"));
				in.setPw(rs.getString("pw"));
				in.setGender(rs.getString("gender"));
				in.setAddress(rs.getString("address"));
				in.setTel(rs.getString("tel"));
				in.setEmail(rs.getString("email"));
				in.setImg(rs.getString("img"));
				list.add(in);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null){rs.close();rs = null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<UserInfo> getidFind(String name,String rrn) { //id찾기
		
		List<UserInfo> list = new ArrayList<UserInfo>();
		try {
			String sql=("SELECT id FROM USER_INFO WHERE name=? AND rrn=?");
			conn=DBConnection.getConnection();//Connection 연결
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,rrn);
			rs=pstmt.executeQuery();
			while(rs.next()) {//값이 여러개일수도 있기때문에 if 대신 while 사용
				UserInfo info=new UserInfo();
				info.setId(rs.getString("id"));
				list.add(info);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null){rs.close();rs = null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public String getpwFind(String id,String rrn) { //pw찾기
		String findid = null;
		try {
			String sql=("SELECT pw FROM USER_INFO WHERE id=? AND rrn=?");
			conn=DBConnection.getConnection();//Connection 연결
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,rrn);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				findid=rs.getString("pw");
				return findid;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null){rs.close();rs = null;}
				if (pstmt != null) {pstmt.close();pstmt = null;}
				if (conn != null) {conn.close();conn = null;}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return findid;
	}
	public void UserDelete(String id) {//유저 삭제
		try {
			String sql=("DELETE FROM USER_INFO WHERE id=?");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	public void userUpdate(UserInfo u,String getid,String getpw,String getaddress,String gettel,String getemail,String getimg) {
		//유저 정보 변경
		try {
				conn=DBConnection.getConnection();
				String realid=u.getId();
				//받아온 값들이 있으면 UserInfo에 setter
				if(getid.length()!=0) {u.setId(getid);}
				if(getpw.length()!=0) {u.setPw(getpw);}
				if(getaddress.length()!=0) {u.setAddress(getaddress);}
				if(gettel.length()!=0) {u.setTel(gettel);}
				if(getemail.length()!=0) {u.setEmail(getemail);}
				if(getimg!=null) {u.setImg(getimg);}
				
				
				if(getid.length()==0) {//id의 길이가 0이면 id는 변경하지 않음
					String sql=("UPDATE USER_INFO SET pw=?,address=?,tel=?,email=?,img=? WHERE id=?");
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, u.getPw());
					pstmt.setString(2, u.getAddress());
					pstmt.setString(3, u.getTel());
					pstmt.setString(4, u.getEmail());
					pstmt.setString(5, u.getImg());
					pstmt.setString(6, u.getId());
					pstmt.executeUpdate();
					conn.commit();
				}else if(getid.length()>0){//id의 길이가 0보다 크면 id도 변경
					String sql=("UPDATE USER_INFO SET id=?,pw=?,address=?,tel=?,email=?,img=? WHERE id=?");
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, u.getId());
					pstmt.setString(2, u.getPw());
					pstmt.setString(3, u.getAddress());
					pstmt.setString(4, u.getTel());
					pstmt.setString(5, u.getEmail());
					pstmt.setString(6, u.getImg());
					pstmt.setString(7, realid);
					pstmt.executeUpdate();
					conn.commit();
				}
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
