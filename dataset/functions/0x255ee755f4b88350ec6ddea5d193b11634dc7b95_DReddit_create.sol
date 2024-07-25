contract DReddit {
function create(bytes _description)
        public
    {
        uint postId = posts.length++;
        posts[postId] = Post({
            creationDate: block.timestamp,
            description: _description,
            owner: msg.sender,
            upvotes: 0,
            downvotes: 0
        });
        emit NewPost(postId, msg.sender, _description);
    }
}