package table;

public class TBook {
	private String classification, book_name, writer, press, published_date, isbn;// 6
	private int copy_volume, inventory;
	private float price;

	// ISBN
	public String getISBN() {
		return isbn;
	}

	public void setISBN(String isbn) {
		this.isbn = isbn;
	}

	// 书名
	public String getName() {
		return book_name;
	}

	public void setName(String name) {
		this.book_name = name;
	}

	// 作译者
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	// 出版年月
	public String getPublishedDate() {
		return published_date;
	}

	public void setPublishedDate(String published_date) {
		this.published_date = published_date;
	}

	// 出版社
	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	// 分类号
	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	// 复本量
	public int getCopyVolume() {
		return copy_volume;
	}

	public void setCopyVolume(int copy_volume) {
		this.copy_volume = copy_volume;
	}

	// 库存量
	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	// 价格
	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
