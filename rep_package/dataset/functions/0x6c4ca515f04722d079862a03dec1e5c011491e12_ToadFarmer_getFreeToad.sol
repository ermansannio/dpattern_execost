contract ToadFarmer {
function getFreeToad() public {
        require(initialized);
        require(hatcheryToad[msg.sender] == 0);
        lastHatch[msg.sender] = now;
        hatcheryToad[msg.sender] = uint(blockhash(block.number-1))%400 + 1; // 'Randomish' 1-400 free eggs
    }
}