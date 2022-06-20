pragma solidity ^0.8.6; 
   
contract MappingExampleTest{
      
    // Defining Structure Book
    struct Book {
        // Declaring different data types
        string tenSach;
        string tacGia;
        uint256 giaTien;
    }
    
    Book book;
    // Creating mapping
    mapping (string => Book[]) public result;
     
    /**
     * Function add Book
     */
    function addBook(string memory bookID,string memory tenSach,string memory tacGia, uint256 giaTien) public{
        result[bookID].push(Book(tenSach,tacGia,giaTien));
    }

    /** Function Get Name Book */
    function getNameBook(string memory bookID, uint index) public view returns(string memory){
        return result[bookID][index].tenSach;
    }
}