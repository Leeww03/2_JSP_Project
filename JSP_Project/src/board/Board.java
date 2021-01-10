package board;

public class Board {
	private long bnum;
	private String bid;
	private String tag;
	private String title;
	private String content;
	private String bdate;
	private String img;
	private long cnt;
	public long getBnum() {
		return bnum;
	}
	public void setBnum(long bnum) {
		this.bnum = bnum;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public long getCnt() {
		return cnt;
	}
	public void setCnt(long cnt) {
		this.cnt = cnt;
	}
	
}
