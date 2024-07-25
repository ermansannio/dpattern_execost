contract PayItBack {
function contribute() public payable enabled wontOverflow {
        // Hold time starts with first contribution
        // Don't allow subsequent contributions to reset the expiry
        if (contributionTime == 0 && msg.value > 0) {
            contributionTime = now;
        }

        totalContributions += msg.value;

        emit Contribution(msg.value, msg.sender);
    }
}