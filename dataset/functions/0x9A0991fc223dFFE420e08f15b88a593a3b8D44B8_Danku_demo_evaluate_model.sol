contract Danku_demo {
function evaluate_model(uint submission_index) public {
    // TODO: Make sure that if there's two same submission w/ same weights
    // and biases, the first one submitted should get the reward.
    // Make sure contract is not terminated
    assert(contract_terminated == false);
    // Make sure it's not the initialization stage anymore
    assert(init_level == 3);
    // Make sure it's evaluated after the reveal stage
    assert(block.number >= init3_block_height + submission_stage_block_size + reveal_test_data_groups_block_size);
    // Make sure it's evaluated within the evaluation stage
    assert(block.number < init3_block_height + submission_stage_block_size + reveal_test_data_groups_block_size + evaluation_stage_block_size);
    // Evaluates a submitted model & keeps track of the best model
    int256 submission_accuracy = 0;
    if (use_test_data == true) {
      submission_accuracy = model_accuracy(submission_index, test_data);
    } else {
      submission_accuracy = model_accuracy(submission_index, train_data);
    }

    // Keep track of the most accurate model
    if (submission_accuracy > best_submission_accuracy) {
      best_submission_index = submission_index;
      best_submission_accuracy = submission_accuracy;
    }
  }
}