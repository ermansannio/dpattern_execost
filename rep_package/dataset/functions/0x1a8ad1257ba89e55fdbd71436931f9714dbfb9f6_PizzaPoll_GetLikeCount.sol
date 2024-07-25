contract PizzaPoll {
function GetLikeCount() returns (uint count){
        return likeCount[msg.sender];
    }
}