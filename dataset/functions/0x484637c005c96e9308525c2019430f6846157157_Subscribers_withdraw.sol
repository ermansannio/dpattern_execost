contract Subscribers {
function withdraw() onlyOwner public {
        address(owner).transfer(address(this).balance);
    }
}