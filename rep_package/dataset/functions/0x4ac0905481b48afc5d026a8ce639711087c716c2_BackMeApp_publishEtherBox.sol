contract BackMeApp {
function publishEtherBox (bytes32 _label, string _ownerUrl, uint _lifespan) external onlyWhenRunning() payable {
      require(ownerToEtherBoxes[msg.sender].length < 10);
      assert(bytes(_ownerUrl).length <= 200);
      address etherBoxAddress = address(keccak256(msg.sender, now));
      ownerToEtherBoxes[msg.sender].push(etherBoxAddress);
      etherBoxes[etherBoxAddress] = EtherBox({
        label: _label,
        owner: msg.sender,
        ownerUrl: _ownerUrl,
        expiration: now + _lifespan
      });
      emit EtherBoxPublished(msg.sender, nicknames[msg.sender], etherBoxAddress, _label, now);
      if(msg.value > 0){ owner.transfer(msg.value); }
  }
}