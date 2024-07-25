contract EtherShare {
function Update(uint ShareID, uint ReplyID, string content) public {
        require(msg.sender==allShare[ShareID][ReplyID].sender && allShare[ShareID][ReplyID].AllowUpdated);  // only sender can update the share or reply which is AllowUpdated
        allShare[ShareID][ReplyID].content = content;
        allShare[ShareID][ReplyID].timestamp = now;
        EVENT(ShareID,ReplyID);
    }
}