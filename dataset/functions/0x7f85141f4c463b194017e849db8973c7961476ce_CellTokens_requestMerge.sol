contract CellTokens {
function requestMerge(uint256[] ids)onlyMergeEnable() external {
      require(ids.length == 4);
      require(ids[0]%(10**8)/(10**4)<max_merge_size);
      require(ids[0]%(10**8)/(10**4)<max_merge_size);
      require(ids[0]%(10**8)/(10**4)<max_merge_size);
      require(ids[0]%(10**8)/(10**4)<max_merge_size);
      require(ownerOfItem[ids[0]] == msg.sender);
      require(ownerOfItem[ids[1]] == msg.sender);
      require(ownerOfItem[ids[2]] == msg.sender);
      require(ownerOfItem[ids[3]] == msg.sender);
      require(ids[0]+ (10**12) == ids[1]);
      require(ids[0]+ (10**8) == ids[2]);
      require(ids[0]+ (10**8) + (10**12) == ids[3]);
      
      uint256 newPrice = priceOfItem[ids[0]]+priceOfItem[ids[1]]+priceOfItem[ids[2]]+priceOfItem[ids[3]];
      uint256 newId = ids[0] + ids[0]%(10**8);
      listedItems.push(newId);
      priceOfItem[newId] = newPrice;
      ownerOfItem[newId] = msg.sender;
      ownerOfItem[ids[0]] = address(0);
      ownerOfItem[ids[1]] = address(0);
      ownerOfItem[ids[2]] = address(0);
      ownerOfItem[ids[3]] = address(0);
  }
}