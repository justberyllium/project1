package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;


public class MangeNoticeDAO {
	
	private static MangeNoticeDAO mgDAO;
	
	private MangeNoticeDAO() {
		
	}
	private static MangeNoticeDAO getInstance() {
		if(mgDAO == null) {
			mgDAO=new MangeNoticeDAO();
		}//end if
		return mgDAO;
	}//getInstance
	

	  public int insertNotice(NoticeVO nVO)throws SQLException {
		  Connection con=null;
			PreparedStatement pstmt=null;
			
			DbConnection dbCon=DbConnection.getInstance();
			
			
			try {
				con = dbCon.getConn();

				StringBuilder insertBoard = new StringBuilder();
				insertBoard.append("INSERT INTO inquiry (id, title, createAt, content) ")
				           .append("VALUES (seq_board.nextval, ?, ?, ?)");

				pstmt = con.prepareStatement(insertBoard.toString());

				// 사용자 입력을 통해 받은 값을 바인딩
				pstmt.setString(1, nVO.getTitle());      
				pstmt.setString(2, nVO.getCreateAt());    
				pstmt.setString(3, nVO.getContent());     

				// 쿼리문 수행
				pstmt.executeUpdate();
				
			}finally {
				dbCon.dbClose(null, pstmt, con);
			}//end finally
	    }//insertNotice

	    public NoticeVO selectOneNotice(int noticeId) {
	        return new NoticeVO();
	    }//selectOneNotice

	    
	    public List<NoticeVO> selectAllNotice(NoticeVO nVO) {
	    	List<NoticeVO> list=new ArrayList<NoticeVO>();
	    	
	    	Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			DbConnection dbCon=DbConnection.getInstance();
			try {
				//connection얻기
				con=dbCon.getConn();
				//쿼리문 생성객체 얻기
				StringBuilder deleteBoard=new StringBuilder();
				deleteBoard
				.append("	SELECT INQUIRY_ID, USER_ID, ADMIN_AD,CATEGORY, TITLE, CONTENT, CREATE_AT, STATUS, ADMIN_ID")
				.append("	FROM inquiry ")
				.append("	ORDER BY joinDate DESC ")
				;
				
				pstmt=con.prepareStatement(deleteBoard.toString());
				//바인드 변수에 값 설정
				pstmt.setInt(1,nVO.getNum());
				pstmt.setString(2,nVO.getWriter());
							
				//쿼리문 수행 후 결과 얻기
				noticeId=pstmt.executeUpdate();
				
			}finally {
				dbCon.dbClose(null, pstmt, con);
			}//end finally
	    }//selectAllNotice

	    public int updateOneNotice(NoticeVO nVO) {
	    	 int result = 0;
	         Connection con = null;
	         PreparedStatement pstmt = null;

	         DbConnection dbCon = DbConnection.getInstance();

	         try {
	         	con = dbCon.getConn();

	         	StringBuilder updateMember = new StringBuilder();
	         	updateMember
	         	    .append("UPDATE inquiry ")
	         	    .append("SET categolyId = ?, title = ?, content = ? ")
	         	    .append("WHERE noticeId = ?");

	         	pstmt = con.prepareStatement(updateMember.toString());

	         	pstmt.setInt(1, nVO.getCategolyId());
	         	pstmt.setString(2, nVO.getTitle());
	         	pstmt.setString(3, nVO.getContent());
	         	pstmt.setInt(4, nVO.getNoticeId());
	             
	             result = pstmt.executeUpdate();
	         } catch (Exception e) {
	             e.printStackTrace();
	         } finally {
	             dbCon.dbClose(null, pstmt, con);
	         }

	         return result;
	     
	    }//updateOneNotice

	    public int deleteNotice(int noticeId) {
	    	int result = 0; // 결과를 저장할 변수
	        Connection con = null; // 연결 객체
	        PreparedStatement pstmt = null; // PreparedStatement 객체

	        DbConnection dbCon = DbConnection.getInstance(); // DB 연결 인스턴스

	        try {
	            con = dbCon.getConn(); // DB 연결
	            String sql = "DELETE FROM inquiry WHERE noticeId = ?"; // 삭제 쿼리
	            pstmt = con.prepareStatement(sql); // PreparedStatement 객체 생성
	            pstmt.setInt(1, noticeId); // 바인드 변수에 값 설정

	            result = pstmt.executeUpdate(); // 쿼리 실행
	        } catch (Exception e) {
	            e.printStackTrace(); // 예외 발생 시 출력
	        } finally {
	            dbCon.dbClose(null, pstmt, con); // 리소스 해제
	        }

	        return result; // 결과 반환
	    }
}
