package kr.co.sist.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.util.BoardUtil;

public class AdminMemberManageDAO {

    private static AdminMemberManageDAO ammDAO;

    private AdminMemberManageDAO() { }

    public static AdminMemberManageDAO getInstance() {
        if (ammDAO == null) {
            ammDAO = new AdminMemberManageDAO();
        }
        return ammDAO;
    }

    public List<UserVO> selectAllMember(AdminMemberVO amVO) throws SQLException {
        List<UserVO> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn();
            StringBuilder selectAllMember = new StringBuilder();
            selectAllMember.append("SELECT userId, name, phone, address1, address2, joinDate, email ")
            .append("FROM MEMBER");

            pstmt = con.prepareStatement(selectAllMember.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	UserVO uVO = new UserVO();
            	uVO.setUserId(rs.getString("userId"));
            	uVO.setName(rs.getString("name"));
            	uVO.setPhone(rs.getString("phone"));
            	uVO.setAddress1(rs.getString("address1"));  
            	uVO.setAddress2(rs.getString("address2"));  
            	uVO.setJoinDate(rs.getString("joinDate"));
            	uVO.setEmail(rs.getString("email"));
            	list.add(uVO);
            }

        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }

        return list;
    }


    public UserVO selectOneMember(String userId) {
        UserVO user = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn();

            String sql = "SELECT userId, name, email, phone, joinDate FROM MEMBER WHERE userId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new UserVO();
                user.setUserId(rs.getString("userId"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setJoinDate(rs.getString("joinDate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }

        return user;
    }

    public int deleteMember(String userId) {
        int result = 0;
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            con = dbCon.getConn();
            
            StringBuilder deleteMember=new StringBuilder();
            deleteMember
            .append("DELETE FROM MEMBER ")
            .append("WHERE userId = ?");
            
            UserVO uVO=new UserVO();
            pstmt=con.prepareStatement(deleteMember.toString());
            
            pstmt.setString(1, userId);
            
            result = pstmt.executeUpdate();
          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbCon.dbClose(null, pstmt, con);
        }

        return result;
    }

    public int updateMember(UserVO uVO) {
        int result = 0;
        Connection con = null;
        PreparedStatement pstmt = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
        	con = dbCon.getConn();

        	StringBuilder updateMember = new StringBuilder();
        	updateMember
            .append("UPDATE MEMBER ")
            .append("SET name = ?, phone = ?, address1 = ?, address2 = ?, joinDate = ?, email = ? ")
            .append("WHERE userId = ?");

        	pstmt = con.prepareStatement(updateMember.toString());

        	pstmt.setString(1, uVO.getName());
        	pstmt.setString(2, uVO.getPhone());
        	pstmt.setString(3, uVO.getAddress1());
        	pstmt.setString(4, uVO.getAddress2());
        	pstmt.setString(5, uVO.getJoinDate());
        	pstmt.setString(6, uVO.getEmail());
        	pstmt.setString(7, uVO.getUserId());
            
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbCon.dbClose(null, pstmt, con);
        }

        return result;
    }
    public int selectTotalCount(AdminMemberVO amVO) throws SQLException {
        int totalCount = 0;
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        DbConnection dbCon = DbConnection.getInstance();
        
        try {
            con = dbCon.getConn();
            
            // 기본 SQL 쿼리
            String sql = "SELECT COUNT(*) FROM member WHERE 1=1";
            
            // 필드와 키워드를 이용하여 조건 추가
            if (amVO.getField() != null && !amVO.getField().isEmpty() && amVO.getKeyword() != null && !amVO.getKeyword().isEmpty()) {
                sql += " AND " + amVO.getField() + " LIKE ?";
            }

            pstmt = con.prepareStatement(sql);

            // 파라미터 설정
            if (amVO.getField() != null && !amVO.getField().isEmpty() && amVO.getKeyword() != null && !amVO.getKeyword().isEmpty()) {
                pstmt.setString(1, "%" + amVO.getKeyword() + "%");
            }
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                totalCount = rs.getInt(1);
            }
            
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        
        return totalCount;
    }
    public List<UserVO> selectMember( AdminMemberVO amVO)throws SQLException{
		List<UserVO> list=new ArrayList<UserVO>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dbCon=DbConnection.getInstance();
		
		try {
			//connection얻기
			con=dbCon.getConn();
			//쿼리문 생성객체 얻기
			StringBuilder selectMember=new StringBuilder();
			selectMember
			.append("	select userId,name, phone,address1,question_id,email	")
			.append("	from	(select userId,name, phone,address1,question_id,email	")
			.append("	row_number() over( order by input_date desc) rnum	")
			.append("	from member	");
			
			//dynamic query : 검색 키워드를 판단 기준으로 where절이 동적생성되어야한다.
			if( amVO.getKeyword() != null && !"".equals(amVO.getKeyword()) ) {
				selectMember.append(" where instr(")
				.append( BoardUtil.numToField( amVO.getField()) )
				.append(",?) != 0");
			}//end if
			
			selectMember.append("	)where rnum between ? and ?	");
			
			pstmt=con.prepareStatement(selectMember.toString());
			//바인드 변수에 값 설정
			int bindInd=0;
			if( amVO.getKeyword() != null && !"".equals(amVO.getKeyword()) ) {
				pstmt.setString( ++bindInd, amVO.getKeyword());
			}//end if
			pstmt.setInt(++bindInd, amVO.getStartNum());
			pstmt.setInt(++bindInd, amVO.getEndNum());
						
			//쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			UserVO uVO=null;
			while( rs.next() ) {
				uVO=new UserVO();
				uVO.setUserId(rs.getString("userId"));
				uVO.setName(rs.getString("name"));
				uVO.setPhone(rs.getString("phone"));
				uVO.setAddress1(rs.getString("address1"));
				uVO.setQuestion_id(rs.getString("question_id"));
				uVO.setEmail(rs.getString("email"));
				
				list.add(uVO);
			}//end while
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectBoard

}
