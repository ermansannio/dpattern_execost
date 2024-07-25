contract FUTX {
function changeFoundation (address _receiver) public
    {
        require(msg.sender == foundation);
        foundation = _receiver;
    }
}