contract UserComments {
function addComment(string _comment, address _to, bool _aboutBounty, uint _bountyId)
    public
    {
      if (_aboutBounty){
        comments.push(Comment(_comment, msg.sender, address(0), _aboutBounty, _bountyId, block.timestamp));
      } else {
        comments.push(Comment(_comment, msg.sender, _to, _aboutBounty, _bountyId, block.timestamp));
      }
      CommentAdded(_comment, msg.sender, _to, block.timestamp);
    }
}