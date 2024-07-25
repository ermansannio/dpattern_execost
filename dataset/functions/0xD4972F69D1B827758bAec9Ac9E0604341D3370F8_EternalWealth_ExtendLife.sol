contract EternalWealth {
function ExtendLife() public payable {

        require(msg.value >= 0.001 ether);

        if (now > doomsday) {
            revert();
        }
    
        blessings += msg.value * 8 / 10;
        tithes += msg.value * 2 / 10;
        savior = msg.sender;
        doomsday = now + 30 minutes;
        lifePoints += 1;
    }
}