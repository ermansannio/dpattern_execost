contract DiscordLink {
function setLink(bytes didHash) {
        require(linkage[didHash] == 0x0);
        linkage[didHash] = msg.sender;
    }
}