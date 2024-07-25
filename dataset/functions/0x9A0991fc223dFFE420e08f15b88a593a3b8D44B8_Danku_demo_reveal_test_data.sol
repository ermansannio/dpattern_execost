contract Danku_demo {
function reveal_test_data(int256[] _test_data_groups, int256 _test_data_group_nonces) external {
    // Make sure contract is not terminated
    assert(contract_terminated == false);
    // Make sure it's not the initialization stage anymore
    assert(init_level == 3);
    // Make sure it's revealed after the submission stage
    assert(block.number >= init3_block_height + submission_stage_block_size);
    // Make sure it's revealed within the reveal stage
    assert(block.number < init3_block_height + submission_stage_block_size + reveal_test_data_groups_block_size);
    // Verify data group and nonce lengths
    assert((_test_data_groups.length/partition_size)/datapoint_size == 1);
    // Verify data group hashes
    assert(sha_data_group(_test_data_groups, _test_data_group_nonces) ==
      hashed_data_groups[testing_partition[test_dg_revealed]]);
    test_dg_revealed += 1;
    // Assign testing data after verifying the corresponding hash
    unpack_data_groups(_test_data_groups, false);
    // Use test data for evaluation
    use_test_data = true;
  }
}