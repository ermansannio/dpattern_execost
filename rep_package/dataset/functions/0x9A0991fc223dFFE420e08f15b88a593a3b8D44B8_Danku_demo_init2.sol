contract Danku_demo {
function init2() external {
    // Make sure contract is not terminated
    assert(contract_terminated == false);
    // Only allow calling it once, in order
    assert(init_level == 1);
    // Make sure it's being called within 20 blocks on init1()
    // to minimize organizer influence on random index selection
    if (block.number <= init1_block_height+20 && block.number > init1_block_height) {
      // TODO: Also make sure it's being called 1 block after init1()
      // Randomly select indexes
      uint[] memory index_array = new uint[](max_num_data_groups/partition_size);
      for (uint i = 0; i < max_num_data_groups/partition_size; i++) {
        index_array[i] = i;
      }
      randomly_select_index(index_array);
      init_level = 2;
    } else {
      // Cancel the contract if init2() hasn't been called within 5
      // blocks of init1()
      cancel_contract();
    }
  }
}