pragma solidity ^0.8.6;

contract ContinueContract {
    uint[]  public data;

    uint8 j = 0;

    function loop() public returns(uint[] memory) {
        while(j < 5) {
            j++;
            if(j == 3) {
                continue;
            }
            data.push(j);
        }

        return data;
    }
}

contract BreakContract {
    uint[] public data;

    uint8 j = 0;

    function loop() public returns(uint[] memory) {
        while(j < 5) {
            j++;
            if(j == 3) {
                break;
            }
            data.push(j);
        }

        return data;
    }
}