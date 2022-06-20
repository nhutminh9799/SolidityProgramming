pragma solidity ^0.8.6;

contract EnumExample {

    int constant MONDAY = 2;
    int constant TUESDAY = 3;
    int constant WEBNESDAY = 4;
    int constant THURSDAY = 5;
    int constant FRIDAY = 6;
    int constant SATURDAY = 7;
    int constant SUNDAY = 8;

    //Những có số gây khó hiểu với người dùng
    uint[7] DayOfWeek = [1, 2, 3, 4, 5, 6, 7];
    
    enum dayOfWeek {
        MONDAY,
        TUESDAY,
        WEBNESDAY,
        THURSDAY,
        FRIDAY,
        SATURDAY,
        SUNDAY
    }

    /**
     * Function Get Monday
     */
    function getMonday() public pure returns(uint) {
        return uint(dayOfWeek.MONDAY);
    }

}