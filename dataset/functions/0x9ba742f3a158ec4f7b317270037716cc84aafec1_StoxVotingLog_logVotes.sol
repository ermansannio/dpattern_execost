contract StoxVotingLog {
function logVotes(uint sum)
        public
        {
            emit LogVotes(msg.sender, sum);
        }
}