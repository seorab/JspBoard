package db;

public class Page {
	public static void main(String[] args) {
		int page = 2;
		
		int total = 32; // 전체 게시물 수
		int totalPage = 0; // 전체 페이지 수 4
		if(total % 10 == 0) { // 10 20 30 40
			totalPage = total / 10;
		} else {
			totalPage = total / 10 + 1;
		}
		System.out.println(totalPage);
		
		int startRow = 0;
		int endRow = 0;
		endRow = page * 10;
		startRow = endRow - 9;
		
		System.out.println(startRow);
		System.out.println(endRow);
		
		
		int startPage = 0;
		startPage = (page - 1) / 10 * 10 + 1;
		
		int endPage = 0;
		endPage = startPage + 9;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		System.out.println(startPage);
		System.out.println(endPage);
	}
}







