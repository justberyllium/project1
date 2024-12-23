package kr.co.sist.notice;

import java.sql.Timestamp;

public class NoticeVO {
 private int notice_id,category_id;
 private String title,content,admin_Id,status;
 private Timestamp created_at;
public int getNotice_id() {
	return notice_id;
}
public void setNotice_id(int notice_id) {
	this.notice_id = notice_id;
}
public int getCategory_id() {
	return category_id;
}
public void setCategory_id(int category_id) {
	this.category_id = category_id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Timestamp getCreated_at() {
	return created_at;
}
public void setCreated_at(Timestamp created_at) {
	this.created_at = created_at;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getAdmin_Id() {
	return admin_Id;
}
public void setAdmin_Id(String admin_Id) {
	this.admin_Id = admin_Id;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
@Override
public String toString() {
	return "NoticeVO [notice_id=" + notice_id + ", category_id=" + category_id + ", title=" + title + ", created_at="
			+ created_at + ", content=" + content + ", admin_Id=" + admin_Id + ", status=" + status + "]";
}

 
}//calss
