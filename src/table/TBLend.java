package table;

public class TBLend {
	private String book_id,book_isbn;
	private boolean isLend;
	
	public String getId() {
		return book_id;
	}
	public String getISBN() {
		return book_isbn;
	}
	public boolean getIsLend() {
		return isLend;
	}
	
	public TBLend(String book_id,String book_isbn,boolean isLend) {
		this.book_id = book_id;
		this.book_isbn = book_isbn;
		this.isLend = isLend;
	}
}
