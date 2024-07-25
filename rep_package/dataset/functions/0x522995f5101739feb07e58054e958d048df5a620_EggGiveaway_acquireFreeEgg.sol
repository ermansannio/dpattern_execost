contract EggGiveaway {
function acquireFreeEgg() payable external {
        require(msg.value == 0);
        require(START_DATE <= now && now < END_DATE);
        require(eggOwners[msg.sender] == false);

        uint8 currentTimeSlot = getTimeSlot(now);

        require(remainingFreeEggs[currentTimeSlot] > 0);

        remainingFreeEggs[currentTimeSlot] -= 1;
        eggOwners[msg.sender] = true;

        LogEggAcquisition(msg.sender, now);
    }
}