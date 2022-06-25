// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//Lưu trữ CV
contract ApplyCV {
    struct CV {
        address studentOwner;
        address businessOwner;
    }

    // struct Review {
    //     address _owner;
    //     address _b_owner;
    //     string _content;
    // }

    CV[] public cvs;
    // Review[] public reviews;

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
}