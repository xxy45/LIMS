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

	// ����
	public String getName() {
		return book_name;
	}

	public void setName(String name) {
		this.book_name = name;
	}

	// ������
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	// ��������
	public String getPublishedDate() {
		return published_date;
	}

	public void setPublishedDate(String published_date) {
		this.published_date = published_date;
	}

	// ������
	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	// �����
	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	// ������
	public int getCopyVolume() {
		return copy_volume;
	}

	public void setCopyVolume(int copy_volume) {
		this.copy_volume = copy_volume;
	}

	// �����
	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	// �۸�
	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
