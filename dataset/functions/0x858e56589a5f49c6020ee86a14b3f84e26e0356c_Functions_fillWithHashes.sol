contract Functions {
function fillWithHashes() public {
        require(randomHashes.length == 0);

        for (uint i = block.number - 100; i < block.number; i++) {
            randomHashes.push(blockhash(i));
        }
    }
}