contract EtherShare {
function ReplyShare(uint ShareID, string nickname, bool AllowUpdated, string content) public {
        require(ShareID<count); // reply to a existed share
        allShare[ShareID].push(oneShare(msg.sender, nickname, now, AllowUpdated, content));
        EVENT(ShareID,allShare[ShareID].length-1);
    }
}