contract fortunes {
function fortune_new() public payable {
		require(msg.value >= unopened_bid || 
		        msg.sender == owner || 
		        fortune_arr.length <= 500, 
		        "ammount below unopened bid");
        require(fortune_arr.length <= max_fortunes,"fortunes max reached");
        fortune memory x;
        x.current_owner = msg.sender;
		x.number = uint32(fortune_arr.length);
		unopened_bid += unopened_bid/1000; // 0.01% increase
        fortune_arr.push(x);
        pending_pay[owner]+= msg.value;
        emit event_new(fortune_arr.length-1);
    }
}