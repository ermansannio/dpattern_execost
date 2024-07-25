contract FUTX {
function changeOwner (address _receiver) public
    {
        require(msg.sender == owner);
        owner = _receiver;
    }
}