/**
 * Định nghĩa Interface ERC20
 *
 * Tài liệu tham khảo: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
 * 
 */
interface ERC20 {

  // Các thuộc tính cơ bản
  // 1.1 Tên Token
  string public constant name = "IS Token";
  // 1.2 Mã Token
  string public constant symbol = "IST";
  // 1.3 Số Decimals hiển thị
  // Ví dụ: decimals = 2. Hiện tại có 505 Token thì sẽ hiển thị người dùng 5,05 (Tức là 505/10**2)
  // Giá trị mặt định là: 18
  uint8 public constant decimals = 18;

  // Các hàm sẵn có trong một interface ERC20

  // 2.1 Hàm được sử dụng cùng với hàm approve(). Cho biết kiểm tra token còn lại sau khi chuyển
  // Ví dụ: Có 20 Token chuyển 15 Token còn lại 5 Token thì hàm này có trách nhiệm trả về Token
  function allowance(address _owner, address _spender) constant returns (uint remaining);

  // 2.2 Hàm Approve cho phép giới hạn token mà một smart contract có thể sử dụng 
  function approve(address _spender, uint _value) returns (bool success);

  // 2.3 Dùng để tra cứu Token của một address truyền vào 
  // Có thể xem bất kỳ của address
  function balanceOf(address _owner) constant returns (uint balance);

  // 2.4 Lấy tổng số lượng Token được phát hành
  function totalSupply() constant returns (uint totalSupply);

  // Important Function for ERC20
  // 2.5 Gửi Token từ một địa chỉ người sở hữu đến địa chỉ khác
  // Vì hàm này chỉ có địa chỉ người nhận nên không có địa chỉ người gửi
  function transfer(address _to, uint _value) returns (bool success);

  // 2.6 Mở rộng hơn transfer vì có địa chỉ _from có thể thay thế cho tài khoản, contract gửi thay.
  function transferFrom(address _from, address _to, uint _value) returns (bool success);

  // Nhật Ký Sự Kiện

  // 3.1 Sự kiện này sẽ kích hoạt khi tài khoản được chấp thuận thu nhận số lượng token nhất định
  event Approval(address indexed _owner, address indexed _spender, uint _value);

  // 3.2 Sự kiện này sẽ xảy ra khi chuyển token
  // Lưu vào nhật ký
  event Transfer(address indexed _from, address indexed _to, uint _value);
}