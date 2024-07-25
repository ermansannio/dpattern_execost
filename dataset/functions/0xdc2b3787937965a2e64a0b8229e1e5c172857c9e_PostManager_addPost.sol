contract PostManager {
function addPost(bytes32 _jsonHash) public payable {
        
        // Ensure post not already created
        require(posts[msg.sender].value != 0);
        
        // Create post
        var post = Post(_jsonHash, msg.value);
        posts[msg.sender] = post;

        PostAdded(msg.sender);
    }
}