contract st4ck {
function buyBlock(uint x, uint y) public payable {
        balance[msg.sender] += msg.value;
        require(balance[msg.sender] >= price(y));
        balance[msg.sender] -= price(y);
        if(x == wereld.length) {
            require(rowQuiter == false);
            wereld.length++;
        }
        else if (x > wereld.length) {
            revert();
        }
        require(y == wereld[x].length);
        wereld[x].push(msg.sender);
            
        if(y == 0) {
            balance[owner] += price(y);
        }
        else {
            balance[wereld[x][y - 1]] += price(y) * 99 / 100;
            balance[owner] += price(y) * 1 / 100;
        }  
        
    }
}