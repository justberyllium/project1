package AdminMember;

public class AdminMemberVO {
private int startNum,endNum,currntPage;
private String  Keyword,Field;

public int getStartNum() {
	return startNum;
}

public void setStartNum(int startNum) {
	this.startNum = startNum;
}

public int getEndNum() {
	return endNum;
}

public void setEndNum(int endNum) {
	this.endNum = endNum;
}

public int getCurrntPage() {
	return currntPage;
}

public void setCurrntPage(int currntPage) {
	this.currntPage = currntPage;
}

public String getKeyword() {
	return Keyword;
}

public void setKeyword(String keyword) {
	Keyword = keyword;
}

public String getField() {
	return Field;
}

public void setField(String field) {
	Field = field;
}

@Override
public String toString() {
	return "AdminMemberVO [startNum=" + startNum + ", endNum=" + endNum + ", currntPage=" + currntPage + ", Keyword="
			+ Keyword + ", Field=" + Field + "]";
}






}
