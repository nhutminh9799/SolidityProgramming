/**
 * Định nghĩa Interface ERC721
 *
 * Tài liệu tham khảo: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol
 *
 */
interface ERC721 {
    // Các thuộc tính cơ bản
    // 1.1 Tên Token
    // (Giống như ERC20)
    string public constant name = "IS Token";
    // 1.2 Mã Token
    // (Giống như ERC20)
    string public constant symbol = "IST";
    // 1.3 Base URI của 
    // Đường dẫn chứa tiền tố của URI và dùng để làm hậu tố cho tokenURI
    // Ví dụ: https://gateway.pinata.cloud/ipfs/
    string public constant baseURI = "";
    // 1.4 Trả về TokenURI khi sẽ là baseURI + tokenId (Được encode)
    string public constant tokenURI = "";

    // Các hàm sẵn có trong một interface ERC721

    // 2.1 Hàm này dùng để xác minh Token thuộc quyền sở hữu của địa chỉ nào.
    // Mỗi Token ERC-721 là duy nhất và không có thể thay đổi được.
    function ownerOf(uint256 tokenId) returns (address);

    // 2.2 Hàm Approve cấp quyền hoặc phê duyệt cho cho một thực thể khác di chuyển token thay mặt cho chủ sở hữu
    function approve(address to, uint256 tokenId);

    // 2.3 Dùng để tra cứu Token của một address truyền vào
    // Có thể xem bất kỳ của address
    // (Giống như ERC20)
    function balanceOf(address _owner) constant returns (uint256 balance);

    // 2.4 Lấy tổng số lượng Token được phát hành
    // (Giống như ERC20)
    function totalSupply() constant returns (uint256 totalSupply);

    // Important Function for ERC20
    // 2.5 Gửi Token từ một địa chỉ người sở hữu đến địa chỉ khác
    // Vì hàm này chỉ có địa chỉ người nhận nên không có địa chỉ người gửi
    function transfer(address _to, uint256 _tokenId) returns (bool success);

    // 2.6 Mở rộng hơn transfer vì có địa chỉ _from có thể thay thế cho tài khoản, contract gửi thay.
    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) returns (bool success);

    // Nhật Ký Sự Kiện

    // 3.1 Sự kiện này sẽ kích hoạt khi tài khoản được chấp thuận thu nhận số lượng token nhất định
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _tokenId
    );

    // 3.2 Sự kiện này sẽ xảy ra khi chuyển token
    // Lưu vào nhật ký
    event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
}
