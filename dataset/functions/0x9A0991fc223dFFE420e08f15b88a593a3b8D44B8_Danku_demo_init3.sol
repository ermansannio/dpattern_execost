contract Danku_demo {
function init3(int256[] _train_data_groups, int256 _train_data_group_nonces) external {
    // Pass a single data group at a time
    // Make sure contract is not terminated
    assert(contract_terminated == false);
    // Only allow calling once, in order
    assert(init_level == 2);
    // Verify data group and nonce lengths
    assert((_train_data_groups.length/partition_size)/datapoint_size == 1);
    // Verify data group hashes
    // Order of revealed training data group must be the same with training partitions
    // Otherwise hash verification will fail
    assert(sha_data_group(_train_data_groups, _train_data_group_nonces) ==
      hashed_data_groups[training_partition[train_dg_revealed]]);
    train_dg_revealed += 1;
    // Assign training data after verifying the corresponding hash
    unpack_data_groups(_train_data_groups, true);
    if (train_dg_revealed == (training_data_group_size/partition_size)) {
      init_level = 3;
      init3_block_height = block.number;
    }
  }
}