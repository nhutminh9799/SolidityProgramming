// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract SwitchCase {
    function switchCase(uint y) public pure returns (uint x) {
        //Assembly cho phép bạn thực thi một số logic có thể không thực hiện được với Solidity như switch case
        assembly {    
            switch lt(y, 30) //lt() để kiểm tra y có nhỏ hơn 30 không?
                case true {
                    x := 1
                }
                case false {
                    x := 0
                }
        }
    }
}