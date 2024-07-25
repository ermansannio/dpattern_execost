contract AutoSplit {
function () payable {
        a.transfer(msg.value * rate / 100);
        b.transfer(msg.value * (100 - rate) / 100);
    }
}