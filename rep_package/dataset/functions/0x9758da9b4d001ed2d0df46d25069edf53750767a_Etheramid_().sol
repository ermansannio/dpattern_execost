contract Etheramid {
function() {
		uint rand = uint(msg.sender) % Count;
        enter(Index[rand]);
    }
}