contract EtherSpermBank {
function becomeSpermlord() public {
        require(initialized);
        require(msg.sender != spermlordAddress);
        require(ballSperm[msg.sender] >= spermlordReq);

        ballSperm[msg.sender] = SafeMath.sub(ballSperm[msg.sender], spermlordReq);
        spermlordReq = ballSperm[msg.sender]; // the requirement now becomes the balance at that time
        spermlordAddress = msg.sender;
    }
}