package chap07;
// ��(Bean) Ŭ����
// ��������� private ���������ڸ� ���.
// ����޼���� public �̰�, setter,getter �� �̷����.
//   src/chap07/book
public class Book {
	private String writer; //�������. ������Ƽ �ƴ�.
	private String title;
	private String content;
	//��Ŭ��  --> source  --> getters/setters  --> select all check
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	//getter, setter
	// set property : setXxx : xxx ������Ƽ��. 
	// get property : getXxx : xxx ������Ƽ��.
	
	
}
