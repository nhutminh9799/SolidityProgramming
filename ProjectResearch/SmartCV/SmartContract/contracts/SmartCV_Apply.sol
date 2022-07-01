// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//Lưu trữ CV
contract ApplyCV {
    struct CV {
        address studentOwner;
        address businessOwner;
    }

    struct Review {
        address studentOwner;
        address businessOwner;
        string content;
    }

    CV[] public cvs;
    Review[] public reviews;

    //Nhận CV
    function addCV (address _studentOwner, address _businessOwner) public {
            cvs.push(CV(_studentOwner, _businessOwner));
    }

    //Lấy danh sách CV theo doanh nghiệp
    function getCV(address _businessOwner) public view returns(address[] memory, address[] memory)  {
        address[] memory studentOwners = new address[](cvs.length);
        address[] memory businessOwners = new address[](cvs.length);
        for(uint i=0; i<cvs.length;i++){
            if(cvs[i].businessOwner == _businessOwner) {
                studentOwners[i] = cvs[i].studentOwner;
                businessOwners[i] = cvs[i].businessOwner;
            }
        }
        return (studentOwners, businessOwners);
    }

    //Lưu trữ đánh giá thực tập của từng sinh viên
    function addReview (address _studentOwner, address _businessOwner, string memory _content) public {
            reviews.push(Review(_studentOwner, _businessOwner, _content));
    }

    //Lấy thông tin đánh giá thực tập
    function getReview(address _studentOwner, address _businessOwner) public view returns(address[] memory, address[] memory, string[] memory)  {
        address[] memory studentOwners = new address[](reviews.length);
        address[] memory businessOwners = new address[](reviews.length);
        string[] memory contents = new string[](reviews.length);
        for(uint i=0; i<reviews.length;i++){
            if(reviews[i].businessOwner == _businessOwner && reviews[i].studentOwner == _studentOwner) {
                studentOwners[i] = reviews[i].studentOwner;
                businessOwners[i] = reviews[i].businessOwner;
                contents[i] = reviews[i].content;
            }
        }
        return (studentOwners, businessOwners, contents);
    }
}