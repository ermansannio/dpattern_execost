contract ballotBox {
function createBallot(string _ballotQuestion, bytes32[] _choices, uint256 _countBlock) public {
        // ensure the count is in the future
        require(_countBlock > block.number);
        // ensure msg.sender is an authorized ballot creator
        require(creators[msg.sender]);
        // add ballot object to array
        ballots.push(ballot(uint8(_choices.length),_countBlock));
        // fire event to record ballot contract creation and parameters
        emit BallotCreated( _ballotQuestion, ballots.length-1 , msg.sender, _choices, _countBlock);
    }
}