contract Cornholio {
function reap(address corn) external
    {
        Corn(corn).transfer(farmer, Corn(corn).balanceOf(this));
    }
}