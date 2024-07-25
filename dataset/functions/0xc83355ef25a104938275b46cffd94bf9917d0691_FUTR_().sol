contract FUTR {
function () external payable {
   
       require(msg.sender != address(0) &&
                tier != 10 &&
                swap == false &&
                wait == false);
    
        uint256 issued = mint(msg.sender, msg.value);
        
        Mined(msg.sender, issued);
        Transfer(this, msg.sender, issued);
    }
}