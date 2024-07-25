contract Splitter {
function withdrawAll() {
        Splitter.withdrawInternal(0, true);
    }
}