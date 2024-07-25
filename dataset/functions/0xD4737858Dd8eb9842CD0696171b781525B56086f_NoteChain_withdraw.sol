contract NoteChain {
function withdraw(address _address, uint _amount) external onlyOwner {
                require(_amount <= address(this).balance);
                address(_address).transfer(_amount);
        }
}