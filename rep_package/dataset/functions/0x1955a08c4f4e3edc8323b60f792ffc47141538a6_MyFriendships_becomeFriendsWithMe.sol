contract MyFriendships {
function becomeFriendsWithMe () public {
        require(msg.sender != me); // I won't be friends with myself.
        myFriends[msg.sender] = true;
        latestFriend = msg.sender;
        numberOfFriends++;
    }
}