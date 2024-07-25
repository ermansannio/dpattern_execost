contract LoversForLife {
function createLover(string l1, string l2, string message) public payable{
        require(msg.value >= minPrice);
        require(msg.value <= maxPrice);
        Lovers memory newLover = Lovers ({
            lover1: l1,
            lover2: l2,
            whyDoYouLove: message,
            worth: msg.value
            
            
        });
        
        loverList.push(newLover);
        loverNumber[msg.sender] = amountOfLovers;
        amountOfLovers++;
       
        creator.transfer(msg.value);
    }
}