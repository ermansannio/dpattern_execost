contract EtherShare {
function NewShare(string nickname, bool AllowUpdated, string content) public {
        allShare[count].push(oneShare(msg.sender, nickname, now, AllowUpdated, content)); // add a new share
        EVENT(count,0);
        count++;
    }
}