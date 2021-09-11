package kr.ac.kopo.signal.vo;

public class NewsVO {
	String title;
	String contents;
	String link;
	String imgSrc;

	public NewsVO() {
		super();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	@Override
	public String toString() {
		return "NewsVO [title=" + title + ", contents=" + contents + ", link=" + link + ", imgSrc=" + imgSrc + "]";
	}

}
