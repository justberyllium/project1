package notice;

public class NoticeVO {
 private int noticeId,categolyId;
 private String title, createAt,content;

 public int getNoticeId() {
	return noticeId;
}
public void setNoticeId(int noticeId) {
	this.noticeId = noticeId;
}
public int getCategolyId() {
	return categolyId;
}
public void setCategolyId(int categolyId) {
	this.categolyId = categolyId;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getCreateAt() {
	return createAt;
}
public void setCreateAt(String createAt) {
	this.createAt = createAt;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
@Override
public String toString() {
	return "NoticeVO [noticeId=" + noticeId + ", categolyId=" + categolyId + ", title=" + title + ", createAt="
			+ createAt + ", content=" + content + "]";
}
 
 
 
}//calss
