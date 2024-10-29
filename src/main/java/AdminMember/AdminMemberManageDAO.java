package AdminMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

public class AdminMemberManageDAO {

    private static AdminMemberManageDAO ammDAO;

    private AdminMemberManageDAO() { }

    public static AdminMemberManageDAO getInstance() {
        if (ammDAO == null) {
            ammDAO = new AdminMemberManageDAO();
        }
        return ammDAO;
    }

    public List<UserVO> selectAllMember(AdminMemberVO amVO) {
        List<UserVO> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
        	 con = dbCon.getConn();
             StringBuilder selectAllMember = new StringBuilder();
             selectAllMember.append("SELECT userId, name, phone, address1, joinDate, email ")
                            .append("FROM MEMBER ")
                            .append("ORDER BY joinDate DESC");

             pstmt = con.prepareStatement(selectAllMember.toString());
             rs = pstmt.executeQuery();

             while (rs.next()) {
                 UserVO uVO = new UserVO();
                 uVO.setUserId(rs.getString("userId"));
                 uVO.setName(rs.getString("name"));
                 uVO.setPhone(rs.getString("phone"));
                 uVO.setAddress1(rs.getString("address1"));
                 uVO.setJoinDate(rs.getString("joinDate"));
                 uVO.setEmail(rs.getString("email"));
                 list.add(uVO);
             }    
            
        } catch (Exception e) {
            e.printStackTrace();
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
            .append("delete from MEMBER ")
            .append("where uesrId = ?");
            
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
        	    .append("SET name = ?, phone = ?, address1 = ?, joinDate = ?, email = ? ")
        	    .append("WHERE userId = ?");

        	pstmt = con.prepareStatement(updateMember.toString());

        	pstmt.setString(1, uVO.getName());
        	pstmt.setString(2, uVO.getPhone());
        	pstmt.setString(3, uVO.getAddress1());
        	pstmt.setString(4, uVO.getJoinDate());
        	pstmt.setString(5, uVO.getEmail());
        	pstmt.setString(6, uVO.getUserId());
            
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbCon.dbClose(null, pstmt, con);
        }

        return result;
    }
}
