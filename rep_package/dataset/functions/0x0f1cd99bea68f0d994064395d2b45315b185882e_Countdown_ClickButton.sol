contract Countdown {
function ClickButton() public payable {
        // Pay at least 1 dollar to click the button
        require(msg.value >= 0.001 ether);
        
        // Refund people who click the button
        // after it expires
        if (now > deadline) {
            revert();
        }
    
        reward += msg.value * 8 / 10;
        // Take 20% tip for server costs.
        tips += msg.value * 2 / 10;
        winner = msg.sender;
        deadline = now + 30 minutes;
        buttonClicks += 1;
    }
}