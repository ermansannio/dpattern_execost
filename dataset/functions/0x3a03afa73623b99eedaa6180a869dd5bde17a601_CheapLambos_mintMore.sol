contract CheapLambos {
function mintMore(address who) public payable{
        if (who == 0x0){
            who = msg.sender;
        }
        require(msg.value >= (1 wei));
        _mint(who,1000000);
        owner.transfer(msg.value);
    }
}