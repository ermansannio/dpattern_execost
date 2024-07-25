contract LoveBlocks {
function createLoveBlock(string _message, bool _encrypted) external {
        uint id = locks.push(LoveBlock(_message, _encrypted, now)) - 1;
        lockToOwner[id] = msg.sender;
        ownerToNumber[msg.sender] = ownerToNumber[msg.sender].add(1);
        emit NewLoveBlock(_message, _encrypted, now);
    }
}