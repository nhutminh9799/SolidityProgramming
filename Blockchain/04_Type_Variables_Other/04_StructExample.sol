pragma solidity ^0.8.6;

contract StructTest {

    struct Book {
        string maSach;
        string tenSach;
        string tacGia;
        uint256 giaTien;
    }

    Book book;

    /**
     * Set Book Function
     */
    function setBook() public {
        book = Book("BOOK001",unicode"Tôi thấy Hoa Vàng trên cỏ xanh",unicode"Nguyễn Nhật Ánh",65000);
    }

    /**
     * Get Book Name Function
     */
    function getBookName() public view returns (string memory) {
        return book.tenSach;
    }

}